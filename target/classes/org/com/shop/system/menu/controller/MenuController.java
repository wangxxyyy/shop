package org.com.shop.system.menu.controller;

import org.com.shop.system.menu.model.Menu;
import org.com.shop.system.menu.service.MenuService;
import org.com.shop.system.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource
	MenuService menuServiceImpl;
	
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView view = new ModelAndView();
		try{
			view.setViewName("menu/menuIndex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return view;
		
	}
	
	//查出菜单列表
	@RequestMapping("/list")
	@ResponseBody
	public List<Menu> list(){
		List<Menu> list = null;
		try{
			list = menuServiceImpl.getListes();
		}catch(Exception e){
			e.printStackTrace();
 		}
		return list;
	}
	
	//保存菜单
	@RequestMapping("/saveOrUpdateMenu")
	@ResponseBody
	public int saveOrUpdateMenu(HttpServletRequest request,Menu menu){
		int state = 0;
		try{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			menu.setCreateUserId(user.getId());
			state = menuServiceImpl.saveOrUpdateMenu(menu);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	@RequestMapping("/deleteMenu")
	@ResponseBody
	public int deleteMenu(String id){
		int state = 0;
		try{
			menuServiceImpl.deleteMenu(id);
			state = 1;
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
	}
}
