package com.cell.user.web.service;

import javax.annotation.PostConstruct;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cell.user.vo.single.SysUserVo;
import com.cell.user.web.common.utils.security.Md5Utils;

/**
 * <p>
 * 密码的加解密
 * <p>
 * User:Tony
 * <p>
 * Date: 13-3-12 上午7:18
 * <p>
 * Version: 1.0
 */

@Service
public class PasswordService {

	/**
	 * <p>
	 * 密码的加密
	 * <p>
	 * User:Tony
	 * <p>
	 * Date: 13-3-12 上午7:18
	 * <p>
	 * Version: 1.0
	 */

	@Autowired
	private CacheManager ehcacheManager;

	private Cache loginRecordCache;

	private Logger logger = LoggerFactory.getLogger(PasswordService.class);

	@Value(value = "${user.password.maxRetryCount}")
	private int maxRetryCount = 10;

	public void setMaxRetryCount(int maxRetryCount) {
		this.maxRetryCount = maxRetryCount;
	}

	@PostConstruct
	public void init() {
		loginRecordCache = ehcacheManager.getCache("loginRecordCache");
	}

	public void validate(SysUserVo user, String password) {
		String username = user.getUsername();

		int retryCount = 0;

		Element cacheElement = loginRecordCache.get(username);
		if (cacheElement != null) {
			retryCount = (Integer) cacheElement.getObjectValue();
			if (retryCount >= maxRetryCount) {
				logger.info(
						username,
						"passwordError",
						"password error, retry limit exceed! password: {},max retry count {}",
						password, maxRetryCount);
				// throw new
				// UserPasswordRetryLimitExceedException(maxRetryCount);
			}
		}

		if (!matches(user, password)) {
			loginRecordCache.put(new Element(username, ++retryCount));
			logger.info(username, "passwordError",
					"password error! password: {} retry count: {}", password,
					retryCount);
			// throw new UserPasswordNotMatchException();
		} else {
			clearLoginRecordCache(username);
		}
	}

	public boolean matches(SysUserVo user, String newPassword) {
		return user.getPassword()
				.equals(encryptPassword(user.getUsername(), newPassword,
						user.getSalt()));
	}

	public void clearLoginRecordCache(String username) {
		loginRecordCache.remove(username);
	}

	public String encryptPassword(String username, String password, String salt) {
		return Md5Utils.hash(username + password + salt);
	}

	public static void main(String[] args) {
		System.out.println(new PasswordService().encryptPassword("monitor",
				"123456", "iY71e4d123"));
	}

}
