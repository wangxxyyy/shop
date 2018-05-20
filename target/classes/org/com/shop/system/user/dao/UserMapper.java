package org.com.shop.system.user.dao;

import java.util.List;
import java.util.Map;

import org.com.shop.system.user.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User login(String loginName,String loginPassword);

	User getById(String id);

	User getByName(String name);

	void saveModifyPassword(String logiName,String newPassword);

	User queryByLoginName(String logiName);

	int getListCount(Map<String, Object> param);

	List<User> getList(Map<String, Object> param);

	void resetPassword(String userId, String password);
}