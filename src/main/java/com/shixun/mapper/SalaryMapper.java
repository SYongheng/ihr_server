package com.shixun.mapper;

import com.shixun.bean.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 基本薪资账套映射接口
 */
public interface SalaryMapper {
    int addSalary(@Param("salary") Salary salary);

    List<Salary> getAllSalary();

    int updateSalary(@Param("salary") Salary salary);

    int deleteSalary(@Param("ids") String[] ids);

    int deleteSalaryByEid(@Param("eid") Long eid);

    int addSidAndEid(@Param("sid") Integer sid, @Param("eid") Long eid);
}
