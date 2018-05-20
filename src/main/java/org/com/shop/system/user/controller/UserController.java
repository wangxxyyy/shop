package org.com.shop.system.user.controller;

import org.com.shop.system.security.model.Role;
import org.com.shop.system.security.service.RoleService;
import org.com.shop.system.user.model.User;
import org.com.shop.system.user.model.UserRole;
import org.com.shop.system.user.service.UserSerive;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@Resource
	UserSerive userServiceImpl;
	
	@Resource
	RoleService roleServiceImpl;
	
	/**
	 * �û�����ҳ����ת
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView view = new ModelAndView();
		view.setViewName("user/userIndex");
		return view;
	}
	
	/**
	 * �˳�ҳ����ת
	 * @return
	 */
	@RequestMapping("/quitHome")
	public ModelAndView quitHome(HttpServletRequest request,HttpServletResponse response){
		ModelAndView view = new ModelAndView();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		view.setViewName("login");
		return view;
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public int login(HttpServletRequest request,HttpServletResponse response,User user){
		int state = 0;
		try{
			String loginName = user.getLoginName();
			String password = user.getLoginPassword();
			if(loginName!=null&&!"".equals(loginName)
					&&password!=null&&!"".equals(password)){
				User loginUser = userServiceImpl.login(user);
				if(loginUser!=null){
					HttpSession session = request.getSession();
					session.setAttribute("user", loginUser);
					state = 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
	}
	
	/**
	 * �г��û��б�
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> list(HttpServletRequest request,User user){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("start", (page-1)*rows);
			param.put("rows", rows);
			param.put("name", user.getName());
			param.put("email", user.getEmail());
			List<User> list = userServiceImpl.getList(param);
			int count = userServiceImpl.getListCount(param);
			
			result.put("rows", list);
			result.put("total", count);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * ��������û�
	 * @return
	 */
	@RequestMapping("/saveOrUpdateUser")
	@ResponseBody
	public int saveOrUpdateUser(HttpServletRequest request,User user){
		int state = 0;
		try{
			HttpSession session = request.getSession();
			User _user = (User) session.getAttribute("user");
			user.setCreateUserId(_user.getId());
			state = userServiceImpl.saveOrUpdateUser(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	/**
	 * ��֤�û����Ƿ��ظ�
	 * @return
	 */
	@RequestMapping("/verification")
	@ResponseBody
	public int verification(HttpServletRequest request,HttpServletResponse response){
		int state = 0;
		try{
			String name = request.getParameter("name");
			state = userServiceImpl.verification(name);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	/**
	 * ɾ���û�
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public int deleteUser(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		int state = 0;
		try{
			userServiceImpl.deleteUser(id);
			state = 1;
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
     }
	
	//�޸�����
	@RequestMapping("/saveModifyPassword")
	@ResponseBody
	public int saveModifyPassword(HttpServletRequest request,String oldPassword,String newPassword){
		int state = 0;
		try{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if(user.getLoginPassword().equals(oldPassword)){
				state = userServiceImpl.modifyPassword(user.getId(),newPassword);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	//�г��û������е�Ȩ��
	@RequestMapping("/listRole")
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
	
	//�����û�����Ȩ��
	@RequestMapping("/saveUserRole")
	@ResponseBody
	public int saveUserRole(UserRole userRole,String userId,String roleIds){
		int state = 0;
		try{
			state = userServiceImpl.saveUserRole(userRole, userId,roleIds);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	//��������
	@RequestMapping("/resetPassword")
	@ResponseBody
	public int resetPassword(String userId){
		int state = 0;
		try{
			 state = userServiceImpl.resetPassword(userId);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
}