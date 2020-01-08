package com.shixun.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * 角色菜单映射接口
 */
public interface MenuRoleMapper {
    int deleteMenuByRid(@Param("rid") Long rid);

    int addMenu(@Param("rid") Long rid, @Param("mids") Long[] mids);
}
