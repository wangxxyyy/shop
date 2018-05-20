package org.com.shop.system.department.service;

import java.util.List;
import java.util.Map;

import org.com.shop.system.department.model.Department;

public interface DepartmentService {

	List<Department> getList(Map<String, Object> param);

	int saveOrUpdateDepartment(Department department);

	void deleteDepartment(String id);

	int getListCount(Map<String, Object> param);

}
