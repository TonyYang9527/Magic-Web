package com.cell.user.web.shrio.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

	private static final String OR_OPERATOR = " or ";
	private static final String AND_OPERATOR = " and ";
	private static final String NOT_OPERATOR = "not ";

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		// User user = userService.findByUsername(username);
		// Set<String> roles =userAuthService.findStringRoles(user)
		// Set<String> permissions =
		// userAuthService.findStringPermissions(user)
		Set<String> roles = new HashSet<String>();
		Set<String> permissions = new HashSet<String>();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(roles);
		authorizationInfo.setStringPermissions(permissions);
		logger.info("roles:{},permissions:{}", roles, permissions);
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername().trim();
		String password = "";
		if (upToken.getPassword() != null) {
			password = new String(upToken.getPassword());
		}
//		User user = null;
//		try {
//			user = userService.login(username, password);
//		} catch (UserNotExistsException e) {
//			throw new UnknownAccountException(e.getMessage(), e);
//		} catch (UserPasswordNotMatchException e) {
//			throw new AuthenticationException(e.getMessage(), e);
//		} catch (UserPasswordRetryLimitExceedException e) {
//			throw new ExcessiveAttemptsException(e.getMessage(), e);
//		} catch (UserBlockedException e) {
//			throw new LockedAccountException(e.getMessage(), e);
//		} catch (Exception e) {
//			log.error("login error", e);
//			throw new AuthenticationException(new UserException(
//					"user.unknown.error", null));
//		}
		SimpleAuthenticationInfo info = null;
		// info = new SimpleAuthenticationInfo(user.getUsername(), password.toCharArray(), getName());
		return info;
	}

}
