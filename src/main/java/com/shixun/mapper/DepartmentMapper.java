package com.shixun.mapper;

import com.shixun.bean.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门映射接口
 */
public interface DepartmentMapper {
    void addDep(@Param("dep") Department department);

    void deleteDep(@Param("dep") Department department);

    List<Department> getDepByPid(Long pid);

    List<Department> getAllDeps();

    String getNameById(Long id);

    //获取离职部门id
    Long getDimissionId();
}
