package org.com.shop.system.security.dao;

import org.com.shop.system.security.model.RoleMenu;

public interface RoleMenuMapper {
   
    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

	void deleteByRoleId(String roleId);
}