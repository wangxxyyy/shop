package org.com.shop.system.security.controller;

import org.com.shop.system.menu.model.Menu;
import org.com.shop.system.menu.service.MenuService;
import org.com.shop.system.security.model.Role;
import org.com.shop.system.security.model.RoleMenu;
import org.com.shop.system.security.service.RoleService;
import org.com.shop.system.user.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	RoleService roleServiceImpl;
	
	@Resource
	MenuService menuServiceImpl;
	
	@RequestMapping("/index")
	public ModelAndView role(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		try{
			view.setViewName("role/roleIndex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return view;
	}
	
	//查出权限列表
	@RequestMapping("/list")
	@ResponseBody
	public List<Role> list(Role role){
		List<Role> list = null;
		try{
			list = roleServiceImpl.getList(role);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//添加或者修改权限
	@RequestMapping("/saveOrUpdateRole")
	@ResponseBody
	public int saveOrUpdateRole(HttpServletRequest request,Role role){
		int state = 0;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		role.setCreateUserId(user.getId());
		try{
			state = roleServiceImpl.saveOrUpdateRole(role);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	//删除权限
	@RequestMapping("/deleteRole")
	@ResponseBody
	public int deleteRole(String id){
		int state = 0;
		try{
			roleServiceImpl.deleteRole(id);
			state = 1;
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
	}
	
	//查出菜单列表
	@RequestMapping("/listMenu")
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
	
	//保存权利菜单
	@RequestMapping("/saveRoleMenu")
	@ResponseBody
	public int saveRoleMenu(RoleMenu roleMenu,String roleId,String menuIds){
		int state = 0;
		try{
			state = roleServiceImpl.saveRoleMenu(roleMenu, roleId, menuIds);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
}
