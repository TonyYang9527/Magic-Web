package com.cell.user.web.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysRoleFacade;
import com.cell.user.ifacade.request.role.FindSysRoleReq;
import com.cell.user.ifacade.response.role.FindSysRoleRsp;
import com.cell.user.vo.single.SysRoleVo;

@Service
public class RoleService {

	@Resource
	private SysRoleFacade roleService;

	public List<SysRoleVo> findSysRoleByIds(Set<Long> roleIds) {
		List<SysRoleVo> roles = null;
		FindSysRoleReq req = new FindSysRoleReq();
		req.setIds(roleIds);
		FindSysRoleRsp rsp = roleService.findSysRoleByIds(req);

		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			roles = rsp.getRoles();
		} else {
			roles = null;
		}
		return roles;
	}

}
