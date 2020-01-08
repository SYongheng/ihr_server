package com.shixun.mapper;

import com.shixun.bean.JobLevel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 职称类映射接口
 */
public interface JobLevelMapper {
    JobLevel getJobLevelByName(String name);

    int addJobLevel(@Param("jobLevel") JobLevel jobLevel);

    List<JobLevel> getAllJobLevels();

    int deleteJobLevelById(@Param("ids") String[] ids);

    int updateJobLevel(@Param("jobLevel") JobLevel jobLevel);

    String getNameById(Long id);

    String getTitleLevelById(Long id);
}
