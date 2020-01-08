package com.shixun.controller.statistics;

import com.shixun.bean.RPScore;
import com.shixun.service.RewardPunishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * 分数统计控制器
 */
@RestController
@RequestMapping("/statistics/score")
public class ScoreController {
    @Autowired
    private RewardPunishmentService rewardPunishmentService;

    //分数提要
    @RequestMapping(value = "/getPreviewRPScore", method = RequestMethod.GET)
    public Map<String, Object> getPreviewRPScore() {
        return rewardPunishmentService.getPreviewRPScore();
    }

    /**
     * 分数详情
     *
     * @param page
     * @param size
     * @param order 排列顺序，0表示降序，1表示正序
     * @return
     */
    @RequestMapping(value = "/getRPScoreByPage", method = RequestMethod.GET)
    public Map<String, Object> getRPScoreByPage(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            @RequestParam(value = "order", defaultValue = "1") Integer order,
            @RequestParam(value = "keywords", defaultValue = "") String keywords) {
        Map<String, Object> map = new HashMap<>();
        Long count = rewardPunishmentService.getCountOfPRScoreByKeywords(keywords);
        List<RPScore> rpScores = rewardPunishmentService.getPRScoreByPage(page, size, order, keywords);
        map.put("count", count);
        map.put("rpScores", rpScores);
        return map;
    }

    @RequestMapping(value = "/getDetailsByEid", method = RequestMethod.GET)
    public Map<String, List<String>> getDetailsByEid(@RequestParam("eid") Long eid) {
        return rewardPunishmentService.getDetailsByEid(eid);
    }
}
