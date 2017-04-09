package com.cell.user.web.shrio.realm;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.cell.user.vo.single.SysUserVo;
import com.cell.user.web.exception.user.UserBlockedException;
import com.cell.user.web.exception.user.UserException;
import com.cell.user.web.exception.user.UserNotExistsException;
import com.cell.user.web.exception.user.UserPasswordNotMatchException;
import com.cell.user.web.exception.user.UserPasswordRetryLimitExceedException;
import com.cell.user.web.service.UserAuthService;
import com.cell.user.web.service.UserService;

/**
 * <p>
 * shiro Realm 提供用户安全数据
 * <p>
 * User: Tony.yang
 * <p>
 * Date :2017-3-23
 * <p>
 * Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

	private Logger logger = LoggerFactory.getLogger(UserRealm.class);
	@Resource
	private UserService userService;
	@Resource
	private UserAuthService authorityService;

	private static final String OR_OPERATOR = " or ";
	private static final String AND_OPERATOR = " and ";
	private static final String NOT_OPERATOR = "not ";
	
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername().trim();
		String password = "";
		if (upToken.getPassword() != null) {
			password = new String(upToken.getPassword());
		}
		SysUserVo user = null;
		try {
			user = userService.login(username, password);
			logger.info("username:{},user:{}", JSON.toJSONString(username),
					JSON.toJSONString(user));
		} catch (UserNotExistsException e) {
			throw new UnknownAccountException(e.getMessage(), e);
		} catch (UserPasswordNotMatchException e) {
			throw new AuthenticationException(e.getMessage(), e);
		} catch (UserPasswordRetryLimitExceedException e) {
			throw new ExcessiveAttemptsException(e.getMessage(), e);
		} catch (UserBlockedException e) {
			throw new LockedAccountException(e.getMessage(), e);
		} catch (Exception e) {
			logger.error("login error", e);
			throw new AuthenticationException(new UserException(
					"user.unknown.error", null));
		}
		SimpleAuthenticationInfo info = null;
		info = new SimpleAuthenticationInfo(user.getUsername(),
				password.toCharArray(), getName());
		return info;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();

		SysUserVo user = userService.findByUsername(username);
		Set<String> roles = authorityService.findStringRoles(user);
		Set<String> permissions = authorityService.findStringPermissions(user);

		logger.info("user:{},roles:{},permissions:{}", JSON.toJSONString(user),
				JSON.toJSONString(roles), JSON.toJSONString(permissions));

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(roles);
		authorizationInfo.setStringPermissions(permissions);
		return authorizationInfo;
	}

	/**
	 * 支持or and not 关键词 不支持and or混用
	 *
	 * @param principals
	 * @param permission
	 * @return
	 */
	public boolean isPermitted(PrincipalCollection principals, String permission) {
		if (permission.contains(OR_OPERATOR)) {
			String[] permissions = permission.split(OR_OPERATOR);
			for (String orPermission : permissions) {
				if (isPermittedWithNotOperator(principals, orPermission)) {
					return true;
				}
			}
			return false;
		} else if (permission.contains(AND_OPERATOR)) {
			String[] permissions = permission.split(AND_OPERATOR);
			for (String orPermission : permissions) {
				if (!isPermittedWithNotOperator(principals, orPermission)) {
					return false;
				}
			}
			return true;
		} else {
			return isPermittedWithNotOperator(principals, permission);
		}
	}

	private boolean isPermittedWithNotOperator(PrincipalCollection principals,
			String permission) {
		if (permission.startsWith(NOT_OPERATOR)) {
			return !super.isPermitted(principals,
					permission.substring(NOT_OPERATOR.length()));
		} else {
			return super.isPermitted(principals, permission);
		}
	}

}
