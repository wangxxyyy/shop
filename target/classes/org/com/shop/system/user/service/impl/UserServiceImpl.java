package org.com.shop.system.user.service.impl;


import org.com.shop.common.CommonUtil;
import org.com.shop.system.user.dao.UserMapper;
import org.com.shop.system.user.dao.UserRoleMapper;
import org.com.shop.system.user.model.User;
import org.com.shop.system.user.model.UserRole;
import org.com.shop.system.user.service.UserSerive;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements UserSerive {
	
	@Resource
	UserMapper userMapper;
	
	@Resource
	UserRoleMapper userRoleMapper;
	
	//��¼�û�
	@Override
	public User login(User user) {
		String loginName = user.getLoginName();
		String loginPassword = user.getLoginPassword();
		User loginUser = userMapper.login(loginName,loginPassword);
		return loginUser;
	}
	
	//��ѯ�����û���
	@Override
	public List<User> getList(Map<String, Object> param) {
		 List<User> list = userMapper.getList(param);
		 return list;
	}
	
	//��ӱ����û�
	@Override
	public int saveOrUpdateUser(User user) {
		if(user.getId()!=null&&!"".equals(user.getId())){
			userMapper.updateByPrimaryKeySelective(user);
		}else{
			user.setId(CommonUtil.getUUID());
			user.setLoginPassword("123456");
			user.setCreateDate(new Date());
			user.setCreateUserId(user.getId());
			userMapper.insertSelective(user);
		}
		return 1;
	}
	
	//��֤�û��Ƿ����
	@Override
	public int verification(String name) {
		User _user = userMapper.getByName(name);
		if(_user==null){
			return 1;
		}else{
			return 0;
		}
	}
	
	//ɾ���û�
	@Override
	public void deleteUser(String id) {
		userMapper.deleteByPrimaryKey(id);
	}
	
	//�޸�����
	@Override
	public int modifyPassword(String id,String newPassword) {
		userMapper.saveModifyPassword(id,newPassword);
		return 1;
	}

	@Override
	public int saveUserRole(UserRole userRole,String userId, String roleIds) {
		userRoleMapper.deleteById(userId);
		
		String[] role = roleIds.split(";");
		for(int i=0;i<role.length;i++){
			userRole.setId(CommonUtil.getUUID());
			userRole.setUserId(userId);
			userRole.setRoleId(role[i]);
			userRoleMapper.insertSelective(userRole);
		}
		return 1;
	}

	@Override
	public int getListCount(Map<String, Object> param) {
		return userMapper.getListCount(param);
	}

	@Override
	public int resetPassword(String userId) {
		String password = "123456";
		userMapper.resetPassword(userId,password);
		return 1;
	}

}
