package com.cell.user.web.controller.system.role;

import io.swagger.annotations.Api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cell.user.web.support.BeanSupport;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/role")
public class SysRoleController  extends BeanSupport {

}
