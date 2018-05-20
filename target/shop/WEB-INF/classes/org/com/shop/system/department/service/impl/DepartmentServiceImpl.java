package org.com.shop.system.department.service.impl;

import org.com.shop.common.CommonUtil;
import org.com.shop.system.department.dao.DepartmentMapper;
import org.com.shop.system.department.model.Department;
import org.com.shop.system.department.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Resource
	DepartmentMapper departmentMapper;

	@Override
	public List<Department> getList(Map<String, Object> param) {
		List<Department> list = departmentMapper.getList(param);
		return list;
	}
	//保存部门
	@Override
	public int saveOrUpdateDepartment(Department department) {
		if(department.getId()!=null&&!"".equals(department.getId())){
			departmentMapper.updateByPrimaryKey(department);
		}else{
			department.setId(CommonUtil.getUUID());
			department.setCreateDate(new Date());
			departmentMapper.insertSelective(department);
		}
		return 1;
	}
	
	//删除部门
	@Override
	public void deleteDepartment(String id) {
		departmentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int getListCount(Map<String, Object> param) {
		return departmentMapper.getListCount(param);
	}
}	
	
