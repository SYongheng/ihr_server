package com.shixun.controller.statistics;

import com.shixun.bean.EmpRemove;
import com.shixun.service.EmpRemoveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 奖惩统计控制器
 */

@RestController
@RequestMapping("/statistics/record")
public class RecordController {

    @Autowired
    private EmpRemoveService empRemoveService;

    @RequestMapping(value = "/getPreviewEmpRemove", method = RequestMethod.GET)
    private Map<String, Object> getPreviewEmpRemove() {
        return empRemoveService.getPreviewEmpRemove();
    }

    @RequestMapping(value = "/getEmpRemoveByPage", method = RequestMethod.GET)
    public Map<String, Object> getEmpRemoveByPage(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            @RequestParam(value = "keywords", defaultValue = "") String keywords,
            @RequestParam(value = "sourceDepId", required = false) Long sourceDepId,
            @RequestParam(value = "sourcePosId", required = false) Long sourcePosId,
            @RequestParam(value = "sourceJobId", required = false) Long sourceJobId,
            @RequestParam(value = "targetDepId", required = false) Long targetDepId,
            @RequestParam(value = "targetPosId", required = false) Long targetPosId,
            @RequestParam(value = "targetJobId", required = false) Long targetJobId) {
        Long count = empRemoveService.getEmpRemoveCount(keywords, sourceDepId, sourcePosId,
                sourceJobId, targetDepId, targetPosId, targetJobId);
        List<EmpRemove> empRemoves = empRemoveService.getEmpRemoveByPage(page, size, keywords,
                sourceDepId, sourcePosId, sourceJobId, targetDepId, targetPosId, targetJobId);
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("empRemoves", empRemoves);
        return map;
    }
}
