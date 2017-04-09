package com.cell.user.web.controller.authority;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.cell.user.ifacade.facade.SysAuthorityFacade;
import com.cell.user.ifacade.request.authority.CreateSysAuthorityReq;
import com.cell.user.ifacade.response.authority.CreateSysAuthorityRsp;
import com.cell.user.web.support.BeanSupport;
import com.cell.user.web.support.Result;
import com.cell.user.web.support.RetCodeConst;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/authority")
public class SysAuthorityController extends BeanSupport {

	@Resource
	private SysAuthorityFacade authorityService;
	private Logger logger = LoggerFactory
			.getLogger(SysAuthorityController.class);

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "创建用户权限")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Result<String> createSysAuthority() {
		CreateSysAuthorityReq req = new CreateSysAuthorityReq();
		req.setGroupId(0L);
		req.setJobId(2L);
		req.setOrganizationId(3L);
		Set<Long> roleIds = new HashSet<Long>();
		roleIds.add(new Long(1));
		roleIds.add(new Long(2));
		roleIds.add(new Long(3));
		req.setRoleIds(roleIds);
		req.setType(true);
		req.setUserId(1L);
		CreateSysAuthorityRsp rsp = authorityService.createSysAuthority(req);
		String result = JSON.toJSONString(rsp);
		logger.info("req:{},rsp:{}", JSON.toJSONString(req),
				JSON.toJSONString(rsp));
		if (rsp == null || RetCodeConst.FAIL.equals(rsp.getRetCode()))
			return fail("返回异常");
		return success(result);
	}
}
