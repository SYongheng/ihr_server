package com.shixun.mapper;

import com.shixun.bean.Menu;

import java.util.List;

/**
 * 菜单类映射接口
 */
public interface MenuMapper {
    List<Menu> getAllMenu();

    List<Menu> getMenusByHrId(Long hrId);

    List<Menu> menuTree();

    List<Long> getMenusByRid(Long rid);
}
