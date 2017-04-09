package com.cell.user.web.controller.permission;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cell.user.ifacade.facade.SysPermissionFacade;
import com.cell.user.web.support.BeanSupport;

@RestController
@RequestMapping("/admin/permission")
public class SysPermissionController extends BeanSupport {

	@Resource
	private SysPermissionFacade permissionService;

	private Logger logger = LoggerFactory
			.getLogger(SysPermissionController.class);

}
