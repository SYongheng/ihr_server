package com.shixun.mapper;

import com.shixun.bean.RPScore;
import com.shixun.bean.RewardPunishment;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 奖惩类映射接口
 */
public interface RewardPunishmentMapper {

    int addRP(RewardPunishment rp);

    List<RewardPunishment> getRPByPage(@Param("start") Integer start, @Param("size") Integer size, @Param("keywords") String keywords, @Param("rpType") Integer rpType, @Param("startRPDate") Date startRPDate, @Param("endRPDate") Date endRPDate);

    Long getCountByKeywords(@Param("keywords") String keywords, @Param("rpType") Integer rpType, @Param("startRPDate") Date startRPDate, @Param("endRPDate") Date endRPDate);

    int deleteRPByIds(@Param("ids") String[] ids);

    int updateRP(RewardPunishment rp);

    List<RPScore> getPRScoreByPage(@Param("start") Integer start, @Param("size") Integer size, @Param("order") Integer order, @Param("keywords") String keywords);

    Long getCountOfPRScoreByKeywords(@Param("keywords") String keywords);

    List<Map<String, Object>> getDetailsByEid(@Param("eid") Long eid);

    RPScore getPRScoreByEidAndDate(@Param("eid") Long eid,@Param("date")Date date);
}
