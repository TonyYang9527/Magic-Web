package com.cell.user.web.controller;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.cell.user.ifacade.facade.GetRoleFacade;
import com.cell.user.ifacade.request.GetRoleReq;
import com.cell.user.ifacade.response.GetRoleRsp;

public class UserController {

	public static void main(String[] args) throws Exception {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "spring-dubbo-consumer.xml" });
		GetRoleFacade demoService = (GetRoleFacade) context
				.getBean("demoService"); // 获取远程服务代理
		GetRoleReq req = new GetRoleReq();
		req.setId(new Long(105));
		GetRoleRsp rsp = demoService.getRole(req);
		System.out.println(JSON.toJSONString(rsp));

	}
}
