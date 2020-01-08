package com.shixun.controller.salary;

import com.shixun.bean.Employee;
import com.shixun.bean.RespBean;
import com.shixun.bean.Salary;
import com.shixun.service.EmpService;
import com.shixun.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 员工基本账套控制器
 */
@RestController
@RequestMapping("/salary/sobcfg")
public class SalaryEmpController {
    @Autowired
    SalaryService salaryService;
    @Autowired
    EmpService empService;

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public RespBean updateEmpSalary(Integer sid, Long eid) {
        if (salaryService.updateEmpSalary(sid, eid) == 1) {
            return RespBean.ok("修改成功!");
        }
        return RespBean.error("修改失败!");
    }

    @RequestMapping(value = "/salaries", method = RequestMethod.GET)
    public List<Salary> salaries() {
        return salaryService.getAllSalary();
    }

    @RequestMapping(value = "/emp", method = RequestMethod.GET)
    public Map<String, Object> getEmployeeByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                 @RequestParam(value = "size", defaultValue = "10") Integer size,
                                                 @RequestParam(value = "keywords", defaultValue = "") String keywords,
                                                 @RequestParam(value = "departmentId", required = false) Long departmentId) {
        Map<String, Object> map = new HashMap<>();
        List<Employee> employeeByPage = empService.getEmployeeByPageShort(page, size, keywords, departmentId);
        Long count = empService.getCountByKeywords(keywords, null, null, null, null, null, departmentId, null);
        map.put("emps", employeeByPage);
        map.put("count", count);
        return map;
    }
}
