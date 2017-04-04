package com.cell.user.web.controller.system.role;

import io.swagger.annotations.Api;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cell.user.ifacade.facade.SysRoleFacade;
import com.cell.user.web.support.BeanSupport;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/role")
public class SysRoleController extends BeanSupport {

	@Resource
	private SysRoleFacade roleService;

	private Logger logger = LoggerFactory.getLogger(SysRoleController.class);
}
