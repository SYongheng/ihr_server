package com.shixun.common;

import com.shixun.bean.Hr;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 获取当前登录的人事经理类
 */
public class HrUtils {
    public static Hr getCurrentHr() {
        return (Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
