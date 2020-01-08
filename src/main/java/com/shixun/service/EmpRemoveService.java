package com.shixun.service;

import com.shixun.bean.EmpRemove;
import com.shixun.bean.Employee;
import com.shixun.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 员工调动类服务层
 */
@Service
@Transactional
public class EmpRemoveService {

    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private EmpRemoveMapper empRemoveMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private JobLevelMapper jobLevelMapper;
    @Autowired
    private PositionMapper positionMapper;

    public int addEmpRemove(String ids) {
        String[] splits = ids.split(",");
        int flag = 0;
        for (String split : splits) {
            Long id = Long.valueOf(split);
            Employee employee = empMapper.getEmpRemoveById(id);
            EmpRemove empRemove = new EmpRemove();
            empRemove.setEid(id);
            empRemove.setSourceDepId(employee.getDepartmentId());
            empRemove.setSourceJobId(employee.getJobLevelId());
            empRemove.setSourcePosId(employee.getPosId());
            empRemove.setTargetDepId(departmentMapper.getDimissionId());
            empRemove.setRemoveDate(new Date(System.currentTimeMillis()));
            if (empRemoveMapper.addEmpRemove(empRemove) != 0)
                flag++;
        }
        if (flag == splits.length)
            return 1;
        else return 0;
    }

    public int addEmpRemove(Employee targetEmployee, Date removeDate, String remark) {
        Long id = targetEmployee.getId();
        Employee sourceEmployee = empMapper.getEmpRemoveById(id);
        EmpRemove empRemove = new EmpRemove();
        empRemove.setEid(id);
        empRemove.setSourceDepId(sourceEmployee.getDepartmentId());
        empRemove.setSourceJobId(sourceEmployee.getJobLevelId());
        empRemove.setSourcePosId(sourceEmployee.getPosId());
        empRemove.setTargetDepId(targetEmployee.getDepartmentId());
        empRemove.setTargetJobId(targetEmployee.getJobLevelId());
        empRemove.setTargetPosId(targetEmployee.getPosId());
        empRemove.setRemoveDate(removeDate);
        empRemove.setRemark(remark);
        return empRemoveMapper.addEmpRemove(empRemove);
    }

    /**
     * 调动人数 = 正常调动人数 + 离职人数
     * 公司员工人数 = 未调动人数 + 正常调动人数
     */
    public Map<String, Object> getPreviewEmpRemove() {
        Map<String, Object> map = null;
        //调动人数
        Long removeCount = empRemoveMapper.getDistinctEmpRemoveCount();
        if (removeCount != 0) {
            map = new HashMap<>();
            //公司员工人数
            Long count = empMapper.getCount();
            //离职人数
            Long dismissionCount = empRemoveMapper.getDismissionCount();
            //正常调动人数
            removeCount -= dismissionCount;
            //未调动人数
            Long staticCount = count - removeCount;
            map.put("removeCount", removeCount);
            map.put("staticCount", staticCount);
            map.put("dismissionCount", dismissionCount);
        }
        return map;
    }

    public List<EmpRemove> getEmpRemoveByPage(Integer page, Integer size, String keywords, Long sourceDepId,
                                              Long sourcePosId, Long sourceJobId, Long targetDepId,
                                              Long targetPosId, Long targetJobId) {
        Integer start = (page - 1) * size;
        List<EmpRemove> empRemoves = empRemoveMapper.getEmpRemoveByPage(start, size, keywords, sourceDepId,
                sourcePosId, sourceJobId, targetDepId, targetPosId, targetJobId);
        for (EmpRemove empRemove : empRemoves) {
            empRemove.setSourceDepName(departmentMapper.getNameById(empRemove.getSourceDepId()));
            empRemove.setSourceJobName(jobLevelMapper.getNameById(empRemove.getSourceJobId()));
            empRemove.setSourcePosName(positionMapper.getNameById(empRemove.getSourcePosId()));
            empRemove.setTargetDepName(departmentMapper.getNameById(empRemove.getTargetDepId()));
            empRemove.setTargetJobName(jobLevelMapper.getNameById(empRemove.getTargetJobId()));
            empRemove.setTargetPosName(positionMapper.getNameById(empRemove.getTargetPosId()));
        }
        return empRemoves;
    }

    public Long getEmpRemoveCount(String keywords, Long sourceDepId, Long sourcePosId,
                                  Long sourceJobId, Long targetDepId, Long targetPosId, Long targetJobId) {
        return empRemoveMapper.getEmpRemoveCount(keywords, sourceDepId, sourcePosId, sourceJobId,
                targetDepId, targetPosId, targetJobId);
    }
}