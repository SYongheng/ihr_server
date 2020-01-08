package com.shixun.service;

import com.shixun.bean.RPScore;
import com.shixun.bean.RewardPunishment;
import com.shixun.mapper.EmpMapper;
import com.shixun.mapper.RewardPunishmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 奖惩类服务层
 */
@Service
@Transactional
public class RewardPunishmentService {

    @Autowired
    private RewardPunishmentMapper rewardPunishmentMapper;
    @Autowired
    private EmpMapper empMapper;
    //构造方法的字符格式这里如果小数不足2位,会以0补足。
    DecimalFormat decimalFormat = new DecimalFormat(".00");

    SimpleDateFormat birthdayFormat = new SimpleDateFormat("yyyy-MM-dd");

    public int addRP(RewardPunishment rp) {
        return rewardPunishmentMapper.addRP(rp);
    }

    public Long getCountByKeywords(String keywords, Integer rpType, String beginDateScope) {
        Date startRPDate = null;
        Date endRPDate = null;
        if (beginDateScope != null && beginDateScope.contains(",")) {
            try {
                String[] split = beginDateScope.split(",");
                startRPDate = birthdayFormat.parse(split[0]);
                endRPDate = birthdayFormat.parse(split[1]);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return rewardPunishmentMapper.getCountByKeywords(keywords, rpType, startRPDate, endRPDate);
    }

    public List<RewardPunishment> getRPByPage(Integer page, Integer size, String keywords, Integer rpType, String beginDateScope) {
        int start = (page - 1) * size;
        Date startRPDate = null;
        Date endRPDate = null;
        if (beginDateScope != null && beginDateScope.contains(",")) {
            try {
                String[] split = beginDateScope.split(",");
                startRPDate = birthdayFormat.parse(split[0]);
                endRPDate = birthdayFormat.parse(split[1]);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return rewardPunishmentMapper.getRPByPage(start, size, keywords, rpType, startRPDate, endRPDate);
    }

    public int updateRP(RewardPunishment rp) {
        return rewardPunishmentMapper.updateRP(rp);
    }

    public boolean deleteRPByIds(String ids) {
        String[] idsArr = ids.split(",");
        return rewardPunishmentMapper.deleteRPByIds(idsArr) == idsArr.length;
    }

    public Map<String, Object> getPreviewRPScore() {
        Map<String, Object> map = null;
        //奖惩记录总数
        long rpCount = rewardPunishmentMapper.getCountByKeywords("", null, null, null);
        if (rpCount != 0) {
            map = new HashMap<>();
            List<RPScore> rpScores = rewardPunishmentMapper.getPRScoreByPage(null, null, 1, "");
            //分数总值
            int scoreSum = 0;
            for (RPScore rpScore : rpScores) {
                scoreSum += rpScore.getRpScore();
            }
            //总人数
            long count = empMapper.getCount();
            //无奖惩记录的人数，分数默认为0
            long blankCount = count - rpScores.size();
            //分数均值
            float averageScore = ((float) scoreSum) / ((float) count);
            averageScore = Float.valueOf(decimalFormat.format(averageScore));
            //大于等于均值人数
            long moreThanAverage = 0;
            //小于均值人数
            long lessThanAverage = 0;
            //最大分数值
            int maxScore = rpScores.get(rpScores.size() - 1).getRpScore();
            //最小分数值
            int minScore = rpScores.get(0).getRpScore();
            for (RPScore rpScore : rpScores) {
                moreThanAverage = rpScore.getRpScore() >= averageScore ? moreThanAverage + 1 : moreThanAverage;
                lessThanAverage = rpScore.getRpScore() < averageScore ? lessThanAverage + 1 : lessThanAverage;
            }
            if (averageScore < 0)
                moreThanAverage += blankCount;
            else
                lessThanAverage += blankCount;
            map.put("count", count);
            map.put("blankCount", blankCount);

            map.put("averageScore", averageScore);
            map.put("moreThanAverage", moreThanAverage);
            map.put("lessThanAverage", lessThanAverage);
            map.put("maxScore", maxScore);
            map.put("minScore", minScore);
        }
        return map;
    }

    public Long getCountOfPRScoreByKeywords(String keywords) {
        return rewardPunishmentMapper.getCountOfPRScoreByKeywords(keywords);
    }

    public List<RPScore> getPRScoreByPage(Integer page, Integer size, Integer order, String keywords) {
        Integer start = (page - 1) * size;
        return rewardPunishmentMapper.getPRScoreByPage(start, size, order, keywords);
    }

    public Map<String, List<String>> getDetailsByEid(Long eid) {
        /*
            List[
                [key:"rpDate",value:日期；key:"rpScore",value:分数]
                [key:"rpDate",value:日期；key:"rpScore",value:分数]
            ]
         */
        List<Map<String, Object>> mapList = rewardPunishmentMapper.getDetailsByEid(eid);
        //key:日期,value:分数
        TreeMap<String, Integer> detailsTreeMaps = new TreeMap<>();
        for (int i = 0; i < mapList.size(); i++) {
            Map<String, Object> temp = mapList.get(i);
            detailsTreeMaps.put(temp.get("rpDate").toString(), Integer.valueOf(temp.get("rpScore").toString()));
        }

        List<String> rpDateList = new ArrayList<>();
        List<String> rpScoreList = new ArrayList<>();
        Set keys = detailsTreeMaps.keySet();
        int sum = 0;
        for (Object key : keys) {
            rpDateList.add(key.toString());
            sum += detailsTreeMaps.get(key);
            rpScoreList.add(String.valueOf(sum));
        }
        /*
            key:"rpDate",value:日期列表（String类型）
            key:"rpScore",value:分数列表（String类型）
         */
        Map<String, List<String>> mapRpDateAndRpScoreList = new HashMap<>();
        mapRpDateAndRpScoreList.put("rpDate", rpDateList);
        mapRpDateAndRpScoreList.put("rpScore", rpScoreList);
        return mapRpDateAndRpScoreList;
    }
}
