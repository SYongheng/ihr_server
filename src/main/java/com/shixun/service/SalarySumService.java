package com.shixun.service;

import com.shixun.bean.Employee;
import com.shixun.bean.RPScore;
import com.shixun.bean.SalarySum;
import com.shixun.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.*;

/**
 * 应发薪资类服务层
 */
@Service
@Transactional
public class SalarySumService {

    @Autowired
    private SalarySumMapper salarySumMapper;
    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private JobLevelMapper jobLevelMapper;
    @Autowired
    private RewardPunishmentMapper rewardPunishmentMapper;
    //构造方法的字符格式这里如果小数不足2位,会以0补足。
    DecimalFormat decimalFormat = new DecimalFormat(".00");

    public boolean createSalarySum(Long departmentId, Date date, Float senior, Float subSenior,
                                   Float intermediate, Float primary, Float junior, Float rpScorePer) {
        //获取带有基础薪资账套的员工列表
        List<Employee> employees = empMapper.getEmployeeByPageShort(null, null, "", departmentId);
        int flag = 0;
        for (Employee employee : employees) {
            SalarySum salarySum = new SalarySum();
            //基础账套总薪资
            Float basicSalary = employee.getSalary().getAllSalary();
            //职称等级提成
            Float titleLevelCommission = 0F;
            switch (jobLevelMapper.getTitleLevelById(employee.getJobLevelId())) {
                case "正高级":
                    titleLevelCommission = senior;
                    break;
                case "副高级":
                    titleLevelCommission = subSenior;
                    break;
                case "中级":
                    titleLevelCommission = intermediate;
                    break;
                case "初级":
                    titleLevelCommission = primary;
                    break;
                case "员级":
                    titleLevelCommission = junior;
                    break;

            }
            RPScore rpScore = rewardPunishmentMapper.getPRScoreByEidAndDate(employee.getId(),date);
            //奖惩分数
            Integer rpScoreValue = 0;
            if (rpScore != null)
                rpScoreValue = rpScore.getRpScore();
            //奖惩提成 = 奖惩分数 * 系数
            Float rpCommission = rpScoreValue * rpScorePer;
            //应发薪资 = 基础账套总薪资 + 职称等级提成 + 奖惩提成
            Float allSalary = basicSalary + titleLevelCommission + rpCommission;
            salarySum.setEid(employee.getId());
            salarySum.setWorkID(employee.getWorkID());
            salarySum.setEname(employee.getName());
            salarySum.setBasicSalary(basicSalary);
            salarySum.setTitleLevelCommission(titleLevelCommission);
            salarySum.setRpCommission(rpCommission);
            salarySum.setAllSalary(allSalary);
            salarySum.setCreateDate(date);
            salarySum.setStatus(0);
            int i = salarySumMapper.addSalarySum(salarySum);
            flag += i;
        }
        return flag == employees.size();
    }

    public Map<String, Object> getSalarySumByPage(Integer page, Integer size, String keywords,
                                                  Date date, Long departmentId, Integer status) {
        Integer start = (page - 1) * size;
        //时区问题
        List<SalarySum> salarySums = salarySumMapper.getSalarySumByPage(start, size, keywords, date, departmentId, status);
        Long count = salarySumMapper.getCountByCondition(keywords, date, departmentId, status);
        Map<String, Object> map = new HashMap<>();
        map.put("salarySums", salarySums);
        map.put("count", count);
        map.put("date", date);
        map.put("departmentId", departmentId);
        return map;
    }

    public boolean handOutSalarySumByIds(String ids) {
        String[] spilts = ids.split(",");
        return salarySumMapper.handOutSalarySumByIds(spilts) == spilts.length;
    }


    public Map<String, List<String>> getPreviewSalarySum(Long departmentId) {
        /*
            List[
                [key:"min",value:最小值；key:"max",value:最大值；key:"average",value:平均值；key:"createDate",value:日期]
                [key:"min",value:最小值；key:"max",value:最大值；key:"average",value:平均值；key:"createDate",value:日期]
            ]
         */
        List<Map<String, Object>> mapList = salarySumMapper.getPreviewSalarySum(departmentId);
        //key:日期,value:"最小值,最大值,平均值"
        TreeMap<String, String> salaryTreeMaps = new TreeMap<>();
        for (Map<String, Object> map : mapList) {
            StringBuilder sb = new StringBuilder();
            //拼接value，格式:"最小值,最大值,平均值"
            sb.append(map.get("min")).append(",").append(map.get("max")).append(",").append(decimalFormat.format(map.get("average")));
            String key = map.get("createDate").toString().substring(0, 7);
            String value = sb.toString();
            //放入TreeMap，以日期createDate为键有序存储
            salaryTreeMaps.put(key, value);
        }
        List<String> createDates = new ArrayList<>();
        List<String> mins = new ArrayList<>();
        List<String> maxs = new ArrayList<>();
        List<String> averages = new ArrayList<>();
        //遍历TreeMap
        Set<String> keyset = salaryTreeMaps.keySet();
        for (String key : keyset) {
            String[] values = salaryTreeMaps.get(key).split(",");
            createDates.add(key);
            mins.add(values[0]);
            maxs.add(values[1]);
            averages.add(values[2]);
        }
        Map<String, List<String>> map = new HashMap<>();
        map.put("createDates", createDates);
        map.put("mins", mins);
        map.put("maxs", maxs);
        map.put("averages", averages);
        return map;
    }

    public Long getCountOfEmpSalarySumByKeywords(String keywords) {
        return salarySumMapper.getCountOfEmpSalarySumByKeywords(keywords);
    }

    public List<SalarySum> getEmpSalarySumByPage(Integer page, Integer size, Integer order, String keywords) {
        Integer start = (page - 1) * size;
        return salarySumMapper.getEmpSalarySumByPage(start, size, order, keywords);
    }

    public Map<String, List<String>> getDetailsByEid(Long eid) {
        /*
            List[
                [key:"createDate",value:日期；key:"allSalary",value:应发工资]
                [key:"createDate",value:日期；key:"allSalary",value:应发工资]
            ]
         */
        List<Map<String, Object>> mapList = salarySumMapper.getDetailsByEid(eid);
        //key:日期,value:应发工资
        TreeMap<String, Float> detailsTreeMaps = new TreeMap<>();
        for (int i = 0; i < mapList.size(); i++) {
            Map<String, Object> temp = mapList.get(i);
            detailsTreeMaps.put(temp.get("createDate").toString(), Float.valueOf(temp.get("allSalary").toString()));
        }
        List<String> createDateList = new ArrayList<>();
        List<String> salarySumList = new ArrayList<>();
        Set keys = detailsTreeMaps.keySet();
        for (Object key : keys) {
            createDateList.add(key.toString());
            salarySumList.add(detailsTreeMaps.get(key).toString());
        }
        /*
            key:"createDate",value:日期列表（String类型）
            key:"salarySum",value:应发工资列表（String类型）
         */
        Map<String, List<String>> mapCreateDateAndSalarySumList = new HashMap<>();
        mapCreateDateAndSalarySumList.put("createDate", createDateList);
        mapCreateDateAndSalarySumList.put("salarySum", salarySumList);
        return mapCreateDateAndSalarySumList;
    }
}
