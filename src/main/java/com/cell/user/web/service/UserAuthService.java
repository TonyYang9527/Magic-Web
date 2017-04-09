package com.cell.user.web.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.dubbo.common.utils.CollectionUtils;
import com.cell.user.vo.single.SysPermissionVo;
import com.cell.user.vo.single.SysResourceVo;
import com.cell.user.vo.single.SysRoleResourcePermissionVo;
import com.cell.user.vo.single.SysRoleVo;
import com.cell.user.vo.single.SysUserVo;
import com.google.common.collect.Sets;

@Service
public class UserAuthService {
	@Resource
	private PermissionService permissionService;
	@Resource
	private RelationService relationService;
	@Resource
	private ResourceService resourceService;
	@Resource
	private RoleService roleService;
	@Resource
	private AuthorityService authorityService;

	public Set<String> findStringRoles(SysUserVo user) {
		if (user == null) {
			return Sets.newHashSet();
		}
		Set<String> roles = Sets.newHashSet();
		Set<Long> roleIds = authorityService.findRoles(user);
		List<SysRoleVo> sysRoleVos = roleService.findSysRoleByIds(roleIds);

		if (CollectionUtils.isNotEmpty(sysRoleVos)) {
			for (SysRoleVo vo : sysRoleVos) {
				roles.add(vo.getRole());
			}
		} else {
			roles = null;
		}
		return roles;
	}

	public Set<String> findStringPermissions(SysUserVo user) {
		if (user == null) {
			return null;
		}
		Set<String> result = Sets.newHashSet();
		Set<Long> roleIds = authorityService.findRoles(user);
		
		List<SysRoleResourcePermissionVo> relations = relationService
				.findRelations(roleIds);

		if (CollectionUtils.isNotEmpty(relations)) {
			for (SysRoleResourcePermissionVo vo : relations) {

				SysResourceVo resource = resourceService.findResource(vo
						.getResourceId());

				String actualResourceIdentity = resourceService
						.findActualResourceIdentity(resource);

				// 不可用 即没查到 或者标识字符串不存在
				if (resource == null
						|| StringUtils.isEmpty(actualResourceIdentity)
						|| Boolean.FALSE.equals(resource.getDisplay())) {
					continue;
				}

				List<SysPermissionVo> permissions = permissionService
						.findPermissions(vo.getPermissionIds());

				for (SysPermissionVo permission : permissions) {
					// 不可用
					if (permission == null
							|| Boolean.FALSE.equals(permission.getDisplay())) {
						continue;
					}
					result.add(actualResourceIdentity + ":"
							+ permission.getPermission());

				}

			}
		}
		return result;
	}
}