package com.cell.user.web.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysRoleResourcePermissionFacade;
import com.cell.user.ifacade.request.relation.FindRoleResourcePermissionReq;
import com.cell.user.ifacade.response.relation.FindRoleResourcePermissionRsp;
import com.cell.user.vo.single.SysRoleResourcePermissionVo;

@Service
public class RelationService {

	@Resource
	private SysRoleResourcePermissionFacade relationService;

	public List<SysRoleResourcePermissionVo> findRelations(Set<Long> roleIds) {
		List<SysRoleResourcePermissionVo> relations = null;

		FindRoleResourcePermissionReq req = new FindRoleResourcePermissionReq();
		req.setRoleIds(roleIds);

		FindRoleResourcePermissionRsp rsp = relationService
				.findRoleResourcePermissionByRoleIds(req);

		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			relations = rsp.getRelations();
		} else {
			relations = null;
		}
		return relations;
	}
}
