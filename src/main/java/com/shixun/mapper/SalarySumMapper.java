package com.shixun.mapper;

import com.shixun.bean.SalarySum;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 应发薪资映射接口
 */
public interface SalarySumMapper {

    int addSalarySum(SalarySum salarySum);

    int updateSalarySum(SalarySum salarySum);

    List<SalarySum> getSalarySumByPage(@Param("start") Integer start, @Param("size") Integer size,
                                       @Param("keywords") String keywords, @Param("date") Date date,
                                       @Param("departmentId") Long departmentId, @Param("status") Integer status);

    Long getCountByCondition(@Param("keywords") String keywords, @Param("date") Date date,
                             @Param("departmentId") Long departmentId, @Param("status") Integer status);

    int handOutSalarySumByIds(@Param("ids") String[] ids);

    List<Map<String, Object>> getPreviewSalarySum(@Param("departmentId") Long departmentId);

    Long getCountOfEmpSalarySumByKeywords(@Param("keywords") String keywords);

    List<SalarySum> getEmpSalarySumByPage(@Param("start") Integer start, @Param("size") Integer size,
                                          @Param("order") Integer order, @Param("keywords") String keywords);

    List<Map<String, Object>> getDetailsByEid(@Param("eid") Long eid);
}
