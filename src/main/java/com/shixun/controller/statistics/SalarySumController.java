package com.shixun.controller.statistics;

import com.shixun.bean.SalarySum;
import com.shixun.service.SalarySumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 应发薪资统计控制器
 */
@RestController
@RequestMapping("/statistics/salary")
public class SalarySumController {
    @Autowired
    private SalarySumService salarySumService;

    @RequestMapping(value = "/getPreviewSalarySum", method = RequestMethod.GET)
    public Map<String, List<String>> getPreviewSalarySum(@RequestParam("departmentId") Long departmentId) {
        return salarySumService.getPreviewSalarySum(departmentId);
    }

    @RequestMapping(value = "/getEmpSalarySumByPage", method = RequestMethod.GET)
    public Map<String, Object> getEmpSalarySumByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                     @RequestParam(value = "size", defaultValue = "10") Integer size,
                                                     @RequestParam(value = "order", defaultValue = "1") Integer order,
                                                     @RequestParam(value = "keywords", defaultValue = "") String keywords) {
        Map<String, Object> map = new HashMap<>();
        Long count = salarySumService.getCountOfEmpSalarySumByKeywords(keywords);
        List<SalarySum> empSalarySums = salarySumService.getEmpSalarySumByPage(page, size, order, keywords);
        map.put("count", count);
        map.put("empSalarySums", empSalarySums);
        return map;
    }

    @RequestMapping(value = "/getDetailsByEid", method = RequestMethod.GET)
    public Map<String, List<String>> getDetailsByEid(@RequestParam("eid") Long eid) {
        return salarySumService.getDetailsByEid(eid);
    }
}
