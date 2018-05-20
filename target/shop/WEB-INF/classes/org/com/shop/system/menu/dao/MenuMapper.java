package org.com.shop.system.menu.dao;

import org.com.shop.system.menu.model.Menu;

import java.util.List;
import java.util.Map;

public interface MenuMapper {
    int deleteByPrimaryKey(String id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

	List<Menu> getLists(Menu menu);

	List<Menu> getMenuListByRoleIds(Map<String, Object> param);

    List<Menu> getListes();
}