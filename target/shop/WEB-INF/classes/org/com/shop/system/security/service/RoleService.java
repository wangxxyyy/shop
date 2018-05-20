package org.com.shop.system.security.service;

import java.util.List;

import org.com.shop.system.security.model.Role;
import org.com.shop.system.security.model.RoleMenu;

public interface RoleService {

	List<Role> getList(Role role);

	int saveOrUpdateRole(Role role);

	void deleteRole(String id);

	int saveRoleMenu(RoleMenu roleMenu, String roleId, String menuIds);

}
