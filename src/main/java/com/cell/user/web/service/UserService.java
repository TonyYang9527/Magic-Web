package com.cell.user.web.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.AopContext;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysUserFacade;
import com.cell.user.ifacade.request.user.FindSysUserReq;
import com.cell.user.ifacade.request.user.GetSysUserReq;
import com.cell.user.ifacade.response.user.FindSysUserRsp;
import com.cell.user.ifacade.response.user.GetSysUserRsp;
import com.cell.user.vo.single.SysUserVo;
import com.cell.user.web.exception.user.UserBlockedException;
import com.cell.user.web.exception.user.UserNotExistsException;
import com.cell.user.web.exception.user.UserPasswordNotMatchException;

@Service
public class UserService {

	public static final String USERNAME_PATTERN = "^[\\u4E00-\\u9FA5\\uf900-\\ufa2d_a-zA-Z][\\u4E00-\\u9FA5\\uf900-\\ufa2d\\w]{1,19}$";
	public static final String EMAIL_PATTERN = "^((([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|[\\x5d-\\x7e]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(\\\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]))))*(((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(\\x22)))@((([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.)+(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.?";
	public static final String MOBILE_PHONE_NUMBER_PATTERN = "^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$";
	public static final int USERNAME_MIN_LENGTH = 2;
	public static final int USERNAME_MAX_LENGTH = 20;
	public static final int PASSWORD_MIN_LENGTH = 5;
	public static final int PASSWORD_MAX_LENGTH = 50;

	@Resource
	private SysUserFacade userService;
	@Resource
	private PasswordService passwordService;
	private Logger logger = LoggerFactory.getLogger(UserService.class);

	public SysUserVo findByUsername(String username) {

		GetSysUserReq req = new GetSysUserReq();
		req.setUsername(username);
		GetSysUserRsp rsp = userService.getSysUser(req);
		SysUserVo user = null;
		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			user = rsp.getUser();
		} else {
			user = null;
		}
		return user;
	}

	public SysUserVo login(String username, String password) {

		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			logger.info(username, "loginError", "username is empty");
			throw new UserNotExistsException();
		}
		// 密码如果不在指定范围内 肯定错误
		if (password.length() < PASSWORD_MIN_LENGTH
				|| password.length() > PASSWORD_MAX_LENGTH) {
			logger.info(username, "loginError",
					"password length error! password is between {} and {}",
					PASSWORD_MIN_LENGTH, PASSWORD_MAX_LENGTH);
			throw new UserPasswordNotMatchException();
		}
		SysUserVo user = ((UserService) AopContext.currentProxy())
				.findSysUsers(username);
		if (user == null || Boolean.TRUE.equals(user.getDeleted())) {
			logger.info(username, "loginError", "user is not exists!");
			throw new UserNotExistsException();
		}

		passwordService.validate(user, password);
		if (user.getStatus()) {
			logger.info(username, "loginError", "user is blocked!");
			throw new UserBlockedException("user is blocked!");
		}

		logger.info(username, "loginSuccess", "");
		return user;
	}

	public SysUserVo findSysUsers(String username) {
		SysUserVo user = null;
		FindSysUserReq req = new FindSysUserReq();
		if (maybeUsername(username))
			req.setUsername(username);
		if (maybeEmail(username))
			req.setEmail(username);
		if (maybeMobilePhoneNumber(username))
			req.setMobile(username);
		FindSysUserRsp rsp = userService.findSysUsers(req);
		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			user = rsp.getUser();
		} else {
			user = null;
		}
		return user;
	}

	private boolean maybeUsername(String username) {
		if (!username.matches(USERNAME_PATTERN)) {
			return false;
		}
		// 如果用户名不在指定范围内也是错误的
		if (username.length() < USERNAME_MIN_LENGTH
				|| username.length() > USERNAME_MAX_LENGTH) {
			return false;
		}

		return true;
	}

	private boolean maybeEmail(String username) {
		if (!username.matches(EMAIL_PATTERN)) {
			return false;
		}
		return true;
	}

	private boolean maybeMobilePhoneNumber(String username) {
		if (!username.matches(MOBILE_PHONE_NUMBER_PATTERN)) {
			return false;
		}
		return true;
	}
}
