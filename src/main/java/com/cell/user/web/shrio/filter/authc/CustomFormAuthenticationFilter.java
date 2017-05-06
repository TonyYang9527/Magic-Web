package com.cell.user.web.shrio.filter.authc;

import javax.servlet.ServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.cell.user.vo.single.SysUserVo;
import com.cell.user.web.service.UserService;

/**
 * 基于几点修改： 1、onLoginFailure 时 把异常添加到request attribute中 而不是异常类名 2、登录成功时：成功页面重定向：
 * 2.1、如果前一个页面是登录页面，-->2.3 2.2、如果有SavedRequest 则返回到SavedRequest
 * 2.3、否则根据当前登录的用户决定返回到管理员首页/前台首页
 * <p/>
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {
	@Autowired
	UserService userService;
	/**
	 * 默认的成功地址
	 */
	@Value("${shiro.default.success.url}")
	private String defaultSuccessUrl;
	/**
	 * 管理员默认的成功地址
	 */
	@Value("${shiro.admin.default.success.url}")
	private String adminDefaultSuccessUrl;

	@Override
	protected void setFailureAttribute(ServletRequest request,
			AuthenticationException ae) {
		request.setAttribute(getFailureKeyAttribute(), ae);
	}

	/**
	 * 根据用户选择成功地址
	 * 
	 * @return
	 */
	@Override
	public String getSuccessUrl() {
		String username = (String) SecurityUtils.getSubject().getPrincipal();
		SysUserVo user = userService.findByUsername(username);
		if (user != null && Boolean.TRUE.equals(user.getAdmin())) {
			return this.adminDefaultSuccessUrl;
		}
		return this.defaultSuccessUrl;
	}

}
