package com.shixun.mapper;

import com.shixun.bean.Position;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 职位映射接口
 */
public interface PositionMapper {

    int addPos(@Param("pos") Position pos);

    Position getPosByName(@Param("name") String name);

    List<Position> getAllPos();

    int deletePosById(@Param("pids") String[] pids);

    int updatePosById(@Param("pos") Position position);

    String getNameById(@Param("id") Long id);
}
