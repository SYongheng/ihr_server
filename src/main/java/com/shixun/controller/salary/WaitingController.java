package com.shixun.controller.salary;

import com.shixun.bean.Department;
import com.shixun.bean.RespBean;
import com.shixun.service.DepartmentService;
import com.shixun.service.SalarySumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 代发工资控制器
 */
@RestController
@RequestMapping("/salary/waiting")
public class WaitingController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private SalarySumService salarySumService;

    @RequestMapping("/deps")
    public List<Department> departments() {
        return departmentService.getAllDeps();
    }

    @RequestMapping(value = "/createSalarySum", method = RequestMethod.POST)
    public RespBean createSalarySum(@RequestParam("departmentId") Long departmentId,
                                    @RequestParam("date") Date date,
                                    @RequestParam("senior") Float senior,
                                    @RequestParam("subSenior") Float subSenior,
                                    @RequestParam("intermediate") Float intermediate,
                                    @RequestParam("primary") Float primary,
                                    @RequestParam("junior") Float junior,
                                    @RequestParam("rpScorePer") Float rpScorePer) {
        if (salarySumService.createSalarySum(departmentId, date, senior, subSenior, intermediate,
                primary, junior, rpScorePer))
            return RespBean.ok("一键生成成功！");
        else return RespBean.error("一键生成失败！");
    }

    @RequestMapping(value = "/getWaitingSalarySumByPage", method = RequestMethod.GET)
    public Map<String, Object> getWaitingSalarySumByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                         @RequestParam(value = "size", defaultValue = "10") Integer size,
                                                         @RequestParam(value = "keywords", defaultValue = "") String keywords,
                                                         @RequestParam(value = "date", required = false) Date date,
                                                         @RequestParam(value = "departmentId") Long departmentId) {
        return salarySumService.getSalarySumByPage(page, size, keywords, date, departmentId, 0);
    }

    @RequestMapping(value = "/handOutSalarySumByIds/{ids}", method = RequestMethod.PUT)
    public RespBean handOutSalarySumByIds(@PathVariable("ids") String ids) {
        if (salarySumService.handOutSalarySumByIds(ids)) {
            return RespBean.ok("薪资发放成功!");
        } else return RespBean.error("薪资发放失败!");
    }
}
