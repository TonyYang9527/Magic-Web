package com.cell.user.web.shrio.filter.user;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.cell.user.vo.single.SysUserVo;
import com.cell.user.web.service.UserService;

/**
 * 验证用户过滤器 1、用户是否删除 2、用户是否锁定
 */
public class SysUserFilter extends AccessControlFilter {

	@Autowired
	private UserService userService;
	/**
	 * 用户删除了后重定向的地址
	 */
	@Value("${shiro.user.notfound.url}")
	private String userNotfoundUrl;
	/**
	 * 用户锁定后重定向的地址
	 */
	@Value("${shiro.user.blocked.url}")
	private String userBlockedUrl;
	/**
	 * 未知错误
	 */
	@Value("${shiro.user.unknown.error.url}")
	private String userUnknownErrorUrl;

	/**
	 * 当前登录的用户
	 */
	public static final String CURRENT_USER = "user";

	public static final String CURRENT_USERNAME = "username";

	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response)
			throws Exception {
		Subject subject = getSubject(request, response);
		if (subject == null) {
			return true;
		}

		String username = (String) subject.getPrincipal();
		// 此处注意缓存 防止大量的查询db
		SysUserVo user = userService.findByUsername(username);
		// 把当前用户放到session中
		request.setAttribute(CURRENT_USER, user);
		// druid监控需要
		((HttpServletRequest) request).getSession().setAttribute(
				CURRENT_USERNAME, username);

		return true;
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		SysUserVo user = (SysUserVo) request.getAttribute(CURRENT_USER);
		if (user == null) {
			return true;
		}

		if (Boolean.TRUE.equals(user.getDeleted()) || user.getStatus()) {
			getSubject(request, response).logout();
			saveRequestAndRedirectToLogin(request, response);
			return false;
		}
		return true;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		getSubject(request, response).logout();
		saveRequestAndRedirectToLogin(request, response);
		return true;
	}

	protected void redirectToLogin(ServletRequest request,
			ServletResponse response) throws IOException {
		SysUserVo user = (SysUserVo) request.getAttribute(CURRENT_USER);
		String url = null;
		if (Boolean.TRUE.equals(user.getDeleted())) {
			url = this.userNotfoundUrl ;
		} else if (!user.getStatus()) {
			url =this.userBlockedUrl;
		} else {
			url =this.userUnknownErrorUrl;
		}

		WebUtils.issueRedirect(request, response, url);
	}

}
