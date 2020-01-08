package com.shixun.mapper;

import com.shixun.bean.EmpRemove;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 员工调动类映射接口
 */
public interface EmpRemoveMapper {
    int addEmpRemove(EmpRemove empRemove);

    Long getEmpRemoveCount(@Param("keywords") String keywords, @Param("sourceDepId") Long sourceDepId,
                                      @Param("sourcePosId") Long sourcePosId, @Param("sourceJobId") Long sourceJobId,
                                      @Param("targetDepId") Long targetDepId, @Param("targetPosId") Long targetPosId,
                                      @Param("targetJobId") Long targetJobId);

    List<EmpRemove> getEmpRemoveByPage(@Param("start") Integer start, @Param("size") Integer size,
                                       @Param("keywords") String keywords, @Param("sourceDepId") Long sourceDepId,
                                       @Param("sourcePosId") Long sourcePosId, @Param("sourceJobId") Long sourceJobId,
                                       @Param("targetDepId") Long targetDepId, @Param("targetPosId") Long targetPosId,
                                       @Param("targetJobId") Long targetJobId);

    //获取调动人数
    Long getDistinctEmpRemoveCount();

    //获取离职人数
    Long getDismissionCount();
}
