package com.shixun.controller.personnel;

import com.shixun.bean.Position;
import com.shixun.bean.RespBean;
import com.shixun.bean.RewardPunishment;
import com.shixun.common.EmailRunnable;
import com.shixun.service.EmpService;
import com.shixun.service.RewardPunishmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 员工奖惩控制器
 */
@RestController
@RequestMapping("/personnel/rp")
public class RewardPunishmentController {

    @Autowired
    private RewardPunishmentService rewardPunishmentService;
    @Autowired
    private EmpService empService;


    @RequestMapping(value = "/verifyWorkIDAndName", method = RequestMethod.GET)
    public RespBean verifyWorkIDAndName(@RequestParam("workID") Long workID, @RequestParam("name") String name) {
        Long eid = empService.verifyWorkIDAndName(workID, name);
        if (eid != null) {
            Map<String, String> map = new HashMap<>();
            map.put("eid", eid.toString());
            return RespBean.ok("验证成功！").setObj(map);
        }
        return RespBean.error("验证失败！");
    }

    @RequestMapping(value = "/addRP", method = RequestMethod.POST)
    public RespBean addRP(RewardPunishment rp) {
        if (rewardPunishmentService.addRP(rp) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @RequestMapping(value = "/getRPByPage", method = RequestMethod.GET)
    public Map<String, Object> getRPByPage(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            @RequestParam(value = "keywords", defaultValue = "") String keywords,
            @RequestParam(value = "rpType", required = false) Integer rpType,
            @RequestParam(value = "beginDateScope", required = false) String beginDateScope) {
        Map<String, Object> map = new HashMap<>();
        keywords = keywords.trim();
        Long count = rewardPunishmentService.getCountByKeywords(keywords, rpType, beginDateScope);
        List<RewardPunishment> rps = rewardPunishmentService.getRPByPage(page, size, keywords, rpType, beginDateScope);
        map.put("count", count);
        map.put("rps", rps);
        return map;
    }

    @RequestMapping(value = "/updateRP", method = RequestMethod.PUT)
    public RespBean updateRP(RewardPunishment rp) {
        if (rewardPunishmentService.updateRP(rp) != 0) {
            return RespBean.ok("更新成功！");
        } else return RespBean.error("更新失败！");
    }

    @RequestMapping(value = "/deleteRPByIds/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteRPByIds(@PathVariable String ids) {
        if (rewardPunishmentService.deleteRPByIds(ids)) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }
}
