package org.com.shop.system.menu.service;

import org.com.shop.system.menu.model.Menu;

import java.util.List;

public interface MenuService {

	int saveOrUpdateMenu(Menu menu);

	void deleteMenu(String id);

	List<Menu> getByUserId(String id);

	List<Menu> getListes();
}
