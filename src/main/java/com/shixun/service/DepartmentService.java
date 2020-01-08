package com.shixun.service;

import com.shixun.bean.Department;
import com.shixun.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 部门类服务层
 */
@Service
@Transactional
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public int addDep(Department department) {
        department.setEnabled(true);
        departmentMapper.addDep(department);
        return department.getResult();
    }

    public int deleteDep(Long did) {
        Department department = new Department();
        department.setId(did);
        departmentMapper.deleteDep(department);
        return department.getResult();
    }

    public List<Department> getDepByPid(Long pid) {
        List<Department> departments = departmentMapper.getDepByPid(pid);
        removeDep(departments);
        return departments;
    }

    public List<Department> getAllDeps() {
        List<Department> departments = departmentMapper.getAllDeps();
        for (Department department : departments) {
            if ("离职".equals(department.getName())) {
                departments.remove(department);
                break;
            }
        }
        return departments;
    }

    private static void removeDep(List<Department> departments) {
        int index = -1;
        for (int i = 0; i < departments.size(); i++) {
            Department department = departments.get(i);
            if ("离职".equals(department.getName())) {
                index = i;
                break;
            } else {
                if (department.getChildren() != null) {
                    removeDep(department.getChildren());
                }
            }
        }
        if (index >= 0) {
            departments.remove(index);
            return;
        }
    }
}
