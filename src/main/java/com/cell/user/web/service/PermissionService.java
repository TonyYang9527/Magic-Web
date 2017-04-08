package com.cell.user.web.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysPermissionFacade;
import com.cell.user.ifacade.request.permission.FindSysPermissionReq;
import com.cell.user.ifacade.response.permission.FindSysPermissionRsp;
import com.cell.user.vo.single.SysPermissionVo;

@Service
public class PermissionService {
	
	@Resource
	private SysPermissionFacade permissionService;
	
	public List<SysPermissionVo> findPermissions(Set<Long> permissionIds) {
		List<SysPermissionVo> permissions = null;
		FindSysPermissionReq req = new FindSysPermissionReq();
		req.setIds(permissionIds);
		FindSysPermissionRsp rsp = permissionService.findStringPermissions(req);

		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			permissions = rsp.getPermissions();
		} else {
			permissions = null;
		}
		return permissions;
	}
}
