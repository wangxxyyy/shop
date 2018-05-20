package org.com.shop.system.department.dao;



import java.util.List;
import java.util.Map;

import org.com.shop.system.department.model.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(String id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

	List<Department> getList(Map<String, Object> param);

	int getListCount(Map<String, Object> param);
	
}