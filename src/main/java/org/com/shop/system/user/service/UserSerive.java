package org.com.shop.system.user.service;

import java.util.List;
import java.util.Map;

import org.com.shop.system.user.model.User;
import org.com.shop.system.user.model.UserRole;

public interface UserSerive {

	User login(User user);

	int saveOrUpdateUser(User user);

	int verification(String name);

	void deleteUser(String id);

	int modifyPassword(String id, String newPassword);

	int saveUserRole(UserRole userRole,String userId, String roleIds);

	int getListCount(Map<String, Object> param);

	List<User> getList(Map<String, Object> param);

	int resetPassword(String userId);
	
}
