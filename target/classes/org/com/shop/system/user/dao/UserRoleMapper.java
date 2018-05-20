package org.com.shop.system.user.dao;

import java.util.List;

import org.com.shop.system.user.model.UserRole;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);

	void deleteById(String userId);

	List<UserRole> getByUserRoleListUserId(String userId);
}