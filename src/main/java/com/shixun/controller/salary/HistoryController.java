package com.shixun.controller.salary;

import com.shixun.bean.Department;
import com.shixun.service.DepartmentService;
import com.shixun.service.SalarySumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 历史薪资控制器
 */

@RestController
@RequestMapping("/salary/history")
public class HistoryController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private SalarySumService salarySumService;

    @RequestMapping("/deps")
    public List<Department> departments() {
        return departmentService.getAllDeps();
    }

    @RequestMapping(value = "/getHistorySalarySumByPage", method = RequestMethod.GET)
    public Map<String, Object> getHistorySalarySumByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                         @RequestParam(value = "size", defaultValue = "10") Integer size,
                                                         @RequestParam(value = "keywords", defaultValue = "") String keywords,
                                                         @RequestParam(value = "date", required = false) Date date,
                                                         @RequestParam(value = "departmentId") Long departmentId) {
        return salarySumService.getSalarySumByPage(page, size, keywords, date, departmentId, 1);
    }
}
