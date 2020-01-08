package com.shixun.controller;

import com.shixun.bean.RespBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录控制器
 */
@RestController
public class LoginController {
    @RequestMapping("/loginPage")
    public RespBean loginPage() {
        return RespBean.error("尚未登录，请登录!");
    }
}
