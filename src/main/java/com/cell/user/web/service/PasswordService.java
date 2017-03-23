package com.cell.user.web.service;

import org.springframework.stereotype.Service;

import com.cell.user.web.common.utils.security.Md5Utils;


/**
 * <p>密码的加解密
* <p>User:Tony
* <p>Date: 13-3-12 上午7:18
* <p>Version: 1.0
*/

@Service
public class PasswordService {

	
	/**
	 * <p>密码的加密
	* <p>User:Tony
	* <p>Date: 13-3-12 上午7:18
	* <p>Version: 1.0
	*/
	
    public String encryptPassword(String username, String password, String salt) {
        return Md5Utils.hash(username + password + salt);
    }
//    
//    public boolean matches(User user, String newPassword) {
//        return user.getPassword().equals(encryptPassword(user.getUsername(), newPassword, user.getSalt()));
//    }

}
