package org.com.shop.system.department.controller;

import org.com.shop.system.department.model.Department;
import org.com.shop.system.department.service.DepartmentService;
import org.com.shop.system.user.model.User;
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
@RequestMapping("/department")
public class DepartmentController {
	
	@Resource
	DepartmentService departmentServiceImpl;
	
	@RequestMapping("/index")
	public ModelAndView department(HttpServletRequest request,HttpServletResponse response){
		ModelAndView view = new ModelAndView();
	try{
		view.setViewName("department/departmentIndex");
	}catch(Exception e){
		e.printStackTrace();
	}
	return view;
  }
	
	//�г����в���
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> list(HttpServletRequest request,Department department){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			int page = Integer.parseInt(request.getParameter("page"));
			int rows = Integer.parseInt(request.getParameter("rows"));
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("start", (page-1)*rows);
			param.put("rows", rows);
			param.put("name", department.getName());
			param.put("number", department.getNumber());
			
			List<Department> list = departmentServiceImpl.getList(param);
			int count = departmentServiceImpl.getListCount(param);
			
			result.put("rows", list);
			result.put("total", count);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
	}
	
	//���沿��
	@RequestMapping("/saveOrUpdateDepartment")
	@ResponseBody
	public int saveOrUpdateDepartment(HttpServletRequest request,Department department){
		int state = 0;
		try{
			HttpSession session = request.getSession();
			User user =  (User) session.getAttribute("user");
			department.setCreateUserId(user.getId());
			state = departmentServiceImpl.saveOrUpdateDepartment(department);
		}catch(Exception e){
			e.printStackTrace();
		}
		return state;
	}
	
	//ɾ������
	@RequestMapping("/deleteDepartment")
	@ResponseBody
	public int deleteDepartment(String id){
		int state = 0;
		try{
			departmentServiceImpl.deleteDepartment(id);
			state = 1;
		}catch(Exception e){
			e.printStackTrace();
			state = -1;
		}
		return state;
	}
}
