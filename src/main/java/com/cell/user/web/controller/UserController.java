package com.cell.user.web.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.cell.user.ifacade.facade.GetRoleFacade;
import com.cell.user.ifacade.request.GetRoleReq;
import com.cell.user.ifacade.response.GetRoleRsp;
import com.cell.user.vo.single.RoleVo;
import com.cell.user.web.support.BeanSupport;
import com.cell.user.web.support.Result;
import com.cell.user.web.support.RetCodeConst;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/services/user")
public class UserController extends BeanSupport {

	@Resource
	private GetRoleFacade getRoleFacade;

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "删除消息")
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("user/add");
		return view;
	}

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "删除消息")
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	@ResponseBody
	public Result<RoleVo> getRoleById(
			@RequestParam(value = "id", required = true) Long id) {
		if (id == null)
			return fail("id异常");
		// // 获取远程服务代理
		GetRoleReq req = new GetRoleReq();
		req.setId(new Long(105));
		GetRoleRsp rsp = getRoleFacade.getRole(req);
		 logger.info("req:{},rsp:{}", req, rsp); 
		if (rsp == null || RetCodeConst.FAIL.equals(rsp.getRetCode())) {
			return fail("返回异常");
		}
		return success(rsp.getRole());
	}

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "删除消息")
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public Result<RoleVo> test() {
		// // 获取远程服务代理
		GetRoleReq req = new GetRoleReq();
		req.setId(new Long(105));
		GetRoleRsp rsp = getRoleFacade.getRole(req);
		String result = JSON.toJSONString(rsp);
		 logger.info("req:{},rsp:{}", req, rsp); 
		if (rsp == null || RetCodeConst.FAIL.equals(rsp.getRetCode()))
			return fail("返回异常");
		return success(rsp.getRole());
	}

	// public static void main(String[] args) throws Exception {
	// ClassPathXmlApplicationContext context = new
	// ClassPathXmlApplicationContext(
	// new String[] { "spring-dubbo-consumer.xml" });
	// GetRoleFacade demoService = (GetRoleFacade) context
	// .getBean("demoService"); // 获取远程服务代理
	// GetRoleReq req = new GetRoleReq();
	// req.setId(new Long(105));
	// GetRoleRsp rsp = demoService.getRole(req);
	// System.out.println(JSON.toJSONString(rsp));
	//
	// }
}
