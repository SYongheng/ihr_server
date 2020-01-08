package com.shixun.service;

import com.shixun.bean.Salary;
import com.shixun.mapper.SalaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.List;

/**
 * 基本薪资账套类服务层
 */
@Service
@Transactional
public class SalaryService {
    @Autowired
    SalaryMapper salaryMapper;
    //构造方法的字符格式这里如果小数不足2位,会以0补足。
    DecimalFormat decimalFormat = new DecimalFormat(".00");

    public int addSalary(Salary salary) {
        Float allSalary = salary.getBasicSalary() + salary.getTrafficSalary()
                + salary.getLunchSalary() + salary.getBonus()
                - salary.getMedicalBase() * salary.getMedicalPer()
                - salary.getPensionBase() * salary.getPensionPer()
                - salary.getAccumulationFundBase() * salary.getAccumulationFundPer();
        allSalary = Float.valueOf(decimalFormat.format(allSalary));
        salary.setAllSalary(allSalary);
        return salaryMapper.addSalary(salary);
    }

    public List<Salary> getAllSalary() {
        return salaryMapper.getAllSalary();
    }

    public int updateSalary(Salary salary) {
        Float allSalary = salary.getBasicSalary() + salary.getTrafficSalary()
                + salary.getLunchSalary() + salary.getBonus()
                - salary.getMedicalBase() * salary.getMedicalPer()
                - salary.getPensionBase() * salary.getPensionPer()
                - salary.getAccumulationFundBase() * salary.getAccumulationFundPer();
        allSalary = Float.valueOf(decimalFormat.format(allSalary));
        salary.setAllSalary(allSalary);
        return salaryMapper.updateSalary(salary);
    }

    public int deleteSalary(String ids) {
        String[] split = ids.split(",");
        return salaryMapper.deleteSalary(split);
    }

    public int updateEmpSalary(Integer sid, Long eid) {
        salaryMapper.deleteSalaryByEid(eid);
        return salaryMapper.addSidAndEid(sid, eid);
    }
}
