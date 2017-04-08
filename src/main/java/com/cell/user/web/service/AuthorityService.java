package com.cell.user.web.service;

import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysAuthorityFacade;
import com.cell.user.ifacade.request.authority.FindSysAuthorityReq;
import com.cell.user.ifacade.response.authority.FindSysAuthorityRsp;
import com.cell.user.vo.single.SysAuthorityVo;
import com.cell.user.vo.single.SysUserVo;
import com.google.common.collect.Sets;

@Service
public class AuthorityService {

	@Resource
	private SysAuthorityFacade authorityService;
	
	public Set<Long> findRoles(SysUserVo user) {
		if (user == null) {
			return Sets.newHashSet();
		}
		Set<Long> roleIds = Sets.newHashSet();
		FindSysAuthorityReq req = new FindSysAuthorityReq();
		req.setUserId(user.getId());
		FindSysAuthorityRsp rsp = authorityService
				.findSysAuthorityByUserId(req);

		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			for (SysAuthorityVo vo : rsp.getAuthority()) {
				roleIds.addAll(vo.getRoleIds());
			}
		} else {
			roleIds = null;
		}
		return roleIds;
	}
	
}
