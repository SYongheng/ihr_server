package com.shixun.mapper;

import com.shixun.bean.Hr;
import com.shixun.bean.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 人事经理类映射接口
 */
public interface HrMapper {
    Hr loadUserByUsername(String username);

    List<Role> getRolesByHrId(Long id);

    int register(@Param("username") String username, @Param("password") String password);

    List<Hr> getHrsByKeywords(@Param("keywords") String keywords);

    int updateHr(Hr hr);

    int deleteRoleByHrId(Long hrId);

    int addRolesForHr(@Param("hrId") Long hrId, @Param("rids") Long[] rids);

    Hr getHrById(Long hrId);

    int deleteHr(Long hrId);

    List<Hr> getAllHr(@Param("currentId") Long currentId);

    Hr findHrById(Long id);

}
