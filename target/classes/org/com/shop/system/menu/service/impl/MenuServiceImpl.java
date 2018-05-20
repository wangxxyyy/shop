package org.com.shop.system.menu.service.impl;

import org.com.shop.common.CommonUtil;
import org.com.shop.system.menu.dao.MenuMapper;
import org.com.shop.system.menu.model.Menu;
import org.com.shop.system.menu.service.MenuService;
import org.com.shop.system.user.dao.UserRoleMapper;
import org.com.shop.system.user.model.UserRole;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	MenuMapper menuMapper;
	
	@Resource
	UserRoleMapper userRoleMapper;
	
	@Override
	public List<Menu> getListes() {
		List<Menu> list = menuMapper.getListes();
		return list;
	}

	@Override
	public int saveOrUpdateMenu(Menu menu) {
		if(menu.getId()!=null&&!"".equals(menu.getId())){
			menuMapper.updateByPrimaryKeySelective(menu);
		}else{
			menu.setCreateDate(new Date());
			menu.setId(CommonUtil.getUUID());
			menuMapper.insertSelective(menu);
		}
		return 1;
	}

	@Override
	public void deleteMenu(String id) {
		menuMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Menu> getByUserId(String userId) {
		List<UserRole> userRoleList = userRoleMapper.getByUserRoleListUserId(userId);
		List<String> roleIds = new ArrayList<String>();
		for(int i=0;i<userRoleList.size();i++){
			UserRole userRole = userRoleList.get(i);
			roleIds.add(userRole.getRoleId());
//			roleIds.add(userRoleList.get(i).getRoleId());
		}
		
		
//		Iterator<UserRole> iterator = userRoleList.iterator();	
//		List<String> roleIds = new ArrayList<String>();
//		while(iterator.hasNext()){
//			UserRole userRole = iterator.next();
//			roleIds.add(userRole.getRoleId());
//		}
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("roleIds", roleIds);
        
		List<Menu> menuList = menuMapper.getMenuListByRoleIds(param);
		return menuList;
	}
}
