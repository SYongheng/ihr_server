package com.shixun.controller.personnel;

import com.shixun.bean.EmpRemove;
import com.shixun.bean.Employee;
import com.shixun.bean.RespBean;
import com.shixun.service.EmpRemoveService;
import com.shixun.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人事调动控制器
 */
@RestController
@RequestMapping("/personnel/empRemove")
public class EmpRemoveController {

    @Autowired
    private EmpService empService;
    @Autowired
    private EmpRemoveService empRemoveService;

    @RequestMapping(value = "/getEmployeeByPage", method = RequestMethod.GET)
    public Map<String, Object> getEmployeeByPage(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            @RequestParam(value = "keywords", defaultValue = "") String keywords,
            @RequestParam(value = "posId", required = false) Long posId,
            @RequestParam(value = "jobLevelId", required = false) Long jobLevelId,
            @RequestParam(value = "departmentId", required = false) Long departmentId) {
        Map<String, Object> map = new HashMap<>();
        List<Employee> employeeByPage = empService.getEmployeeByPage(page, size,
                keywords, null, null, posId, jobLevelId, null,
                departmentId, null);
        Long count = empService.getCountByKeywords(keywords, null, null,
                posId, jobLevelId, null, departmentId, null);
        map.put("emps", employeeByPage);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/updateEmpRemove", method = RequestMethod.PUT)
    public RespBean updateEmpRemove(Employee employee,
                                    @RequestParam(value = "removeDate") Date removeDate,
                                    @RequestParam(value = "remark", required = false) String remark) {
        if (empRemoveService.addEmpRemove(employee, removeDate, remark) != 0) {
            if (empService.updateEmp(employee) != 0) {
                return RespBean.ok("调动成功！");
            } else return RespBean.error("调动失败！");
        } else return RespBean.error("调动失败！");
    }

    @RequestMapping(value = "/deleteEmployee/{ids}", method = RequestMethod.DELETE)
    public RespBean deleteEmpById(@PathVariable String ids) {
        if (empRemoveService.addEmpRemove(ids) != 0) {
            if (empService.deleteEmpById(ids)) {
                return RespBean.ok("离职成功!");
            } else return RespBean.error("离职失败!");
        } else return RespBean.error("离职失败!");
    }
}
