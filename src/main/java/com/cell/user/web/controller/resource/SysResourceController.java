package com.cell.user.web.controller.resource;

import io.swagger.annotations.Api;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cell.user.ifacade.facade.SysResourceFacade;
import com.cell.user.web.support.BeanSupport;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/resource")
public class SysResourceController extends BeanSupport {

	@Resource
	private SysResourceFacade resourceService;

	private Logger logger = LoggerFactory
			.getLogger(SysResourceController.class);
}
