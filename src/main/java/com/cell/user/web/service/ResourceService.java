package com.cell.user.web.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.AopContext;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.dubbo.common.utils.CollectionUtils;
import com.alibaba.fastjson.JSON;
import com.cell.user.constant.Constants;
import com.cell.user.ifacade.facade.SysResourceFacade;
import com.cell.user.ifacade.request.resource.FindSysResourceReq;
import com.cell.user.ifacade.request.resource.GetSysResourceReq;
import com.cell.user.ifacade.response.resource.FindSysResourceRsp;
import com.cell.user.ifacade.response.resource.GetSysResourceRsp;
import com.cell.user.vo.single.SysResourceVo;

@Service
public class ResourceService {

	private Logger logger = LoggerFactory.getLogger(ResourceService.class);

	@Resource
	private SysResourceFacade resourceService;

	public SysResourceVo findResource(Long id) {

		SysResourceVo vo = new SysResourceVo();
		GetSysResourceReq req = new GetSysResourceReq();
		req.setId(id);
		GetSysResourceRsp rsp = resourceService.getSysResource(req);

		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			vo = rsp.getResource();
		} else {
			vo = null;
		}
		return vo;
	}

	public boolean findSysResourceByParentId(Long parentId) {

		List<SysResourceVo> resources = new ArrayList<SysResourceVo>();
		FindSysResourceReq req = new FindSysResourceReq();
		Set<Long> parentIds = new HashSet<Long>();
		parentIds.add(parentId);
		req.setParentIds(parentIds);
		FindSysResourceRsp rsp = resourceService.findSysResources(req);
		if (rsp.getRetCode().equals(Constants.RESPONSE_SUCCESS_CODE)) {
			resources = rsp.getResources();
		}
		return CollectionUtils.isNotEmpty(resources);
	}

	/**
	 * 得到真实的资源标识 即 父亲:儿子
	 * 
	 * @param resource
	 * @return
	 */
	public String findActualResourceIdentity(SysResourceVo resource) {

		if (resource == null) {
			return null;
		}
		StringBuilder s = new StringBuilder(resource.getIdentity());
		boolean hasResourceIdentity = !StringUtils.isEmpty(resource
				.getIdentity());
		ResourceService service = ((ResourceService) AopContext.currentProxy());
		SysResourceVo parent = service.findResource(resource.getParentId());
		while (parent != null) {
			if (!StringUtils.isEmpty(parent.getIdentity())) {
				s.insert(0, parent.getIdentity() + ":");
				hasResourceIdentity = true;
			}
			parent = service.findResource(parent.getParentId());
		}
		// 如果用户没有声明 资源标识 且父也没有，那么就为空
		if (!hasResourceIdentity) {
			return "";
		}
		// 如果最后一个字符是: 因为不需要，所以删除之
		int length = s.length();
		if (length > 0 && s.lastIndexOf(":") == length - 1) {
			s.deleteCharAt(length - 1);
		}
		// 如果有儿子 最后拼一个*
		if (service.findSysResourceByParentId(resource.getId())) {
			s.append(":*");
		}
		logger.info("findActualResourceIdentity  result:{}",
				JSON.toJSONString(s));
		return s.toString();
	}
}
