package com.cell.user.web.controller.user;

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

import com.cell.user.ifacade.facade.SysUserFacade;
import com.cell.user.web.support.BeanSupport;
import com.cell.user.web.support.Result;

@Api(tags = { "消息服务" })
@RestController
@RequestMapping("/admin/user")
public class SysUserController extends BeanSupport {

	@Resource
	private SysUserFacade userService;

	private Logger logger = LoggerFactory.getLogger(SysUserController.class);

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "删除消息")
	@RequestMapping(value = "/add", method = RequestMethod.POST)
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
	@RequestMapping(value = "/get", method = RequestMethod.POST)
	@ResponseBody
	public Result<?> getRoleById(
			@RequestParam(value = "id", required = true) Long id) {
//		if (id == null)
//			return fail("id异常");
//		// // 获取远程服务代理
//		GetRoleReq req = new GetRoleReq();
//		req.setId(new Long(105));
//		GetRoleRsp rsp = getRoleFacade.getRole(req);
//		logger.info("req:{},rsp:{}", req, rsp);
//		if (rsp == null || RetCodeConst.FAIL.equals(rsp.getRetCode())) {
//			return fail("返回异常");
//		}
//		
//		return success(rsp.getRole());
		return  null;
	}

	/**
	 * 获取role
	 * 
	 * @param id
	 */
	@ApiOperation(value = "删除消息")
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	@ResponseBody
	public Result<?> test() {
		// 获取远程服务代理
//		GetRoleReq req = new GetRoleReq();
//		req.setId(new Long(105));
//		GetRoleRsp rsp = getRoleFacade.getRole(req);
//		String result = JSON.toJSONString(rsp);
//		logger.info("req:{},rsp:{},result:{}", req, rsp, result);
//		if (rsp == null || RetCodeConst.FAIL.equals(rsp.getRetCode()))
//			return fail("返回异常");
//		return success(rsp.getRole());
		return  null;
	}
}
