package com.cell.user.web.controller.system.relation;

import io.swagger.annotations.Api;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cell.user.ifacade.facade.SysRoleResourcePermissionFacade;
import com.cell.user.web.support.BeanSupport;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/relation")
public class RoleResourcePermissionController   extends BeanSupport{

	
	@Resource
	private SysRoleResourcePermissionFacade roleResourcePermissionService;

	private Logger logger = LoggerFactory
			.getLogger(RoleResourcePermissionController.class);
}
