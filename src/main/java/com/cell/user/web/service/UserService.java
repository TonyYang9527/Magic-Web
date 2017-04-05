package com.cell.user.web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysUserFacade;
import com.cell.user.ifacade.request.user.GetSysUserReq;
import com.cell.user.ifacade.response.user.GetSysUserRsp;
import com.cell.user.vo.single.SysUserVo;

@Service
public class UserService {

	@Resource
	private SysUserFacade userService;

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

}
