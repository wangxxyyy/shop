package org.com.shop.system.security.service.impl;

import org.com.shop.common.CommonUtil;
import org.com.shop.system.security.dao.RoleMapper;
import org.com.shop.system.security.dao.RoleMenuMapper;
import org.com.shop.system.security.model.Role;
import org.com.shop.system.security.model.RoleMenu;
import org.com.shop.system.security.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Resource
	RoleMapper roleMapper;
	
	@Resource
	RoleMenuMapper roleMenuMapper;
	
	@Override
	public List<Role> getList(Role role) {
		List<Role> list = roleMapper.getList(role);
		return list;
	}

	@Override
	public int saveOrUpdateRole(Role role) {
		if(role.getId()!=null&&!"".equals(role.getId())){
			roleMapper.updateByPrimaryKeySelective(role);
		}else{
			role.setId(CommonUtil.getUUID());
			role.setCreateDate(new Date());
			roleMapper.insertSelective(role);
		}
		return 1;
	}

	@Override
	public void deleteRole(String id) {
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int saveRoleMenu(RoleMenu roleMenu, String roleId, String menuIds) {
		roleMenuMapper.deleteByRoleId(roleId);
		
		String [] menu = menuIds.split(";");
		for(int i=0;i<menu.length;i++){
			roleMenu.setId(CommonUtil.getUUID());
			roleMenu.setRoleId(roleId);
			roleMenu.setMenuId(menu[i]);
			roleMenuMapper.insertSelective(roleMenu);
		}
		return 1;
	}
}
