package com.shixun.mapper;

import com.shixun.bean.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色映射接口
 */
public interface RoleMapper {
    List<Role> roles();

    int addNewRole(@Param("role") String role, @Param("roleZh") String roleZh);

    int deleteRoleById(Long rid);
}
