package com.shixun.controller;

import com.shixun.bean.Hr;
import com.shixun.bean.RespBean;
import com.shixun.service.HrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * 人事经理个人中心控制器
 */
@RestController
@RequestMapping("/hrCenter")
public class HrCenterController {

    @Autowired
    private HrService hrService;

    @RequestMapping(value = "/basicPage", method = RequestMethod.GET)
    public Map<String, String> basicPage(@RequestParam("id") Long id) {
        Map<String, String> hrMap = new HashMap<>();
        Hr hr = hrService.findHrById(id);
        hrMap.put("userface", hr.getUserface());
        hrMap.put("username", hr.getUsername());
        hrMap.put("name", hr.getName());
        hrMap.put("phone", hr.getPhone());
        hrMap.put("telephone", hr.getTelephone());
        hrMap.put("address", hr.getAddress());
        hrMap.put("remark", hr.getRemark());
        return hrMap;
    }

    @RequestMapping(value = "/updateHr", method = RequestMethod.PUT)
    public RespBean updateHr(Hr hr) {
        hr.setEnabled(true);
        if (hrService.updateHr(hr) == 1) {
            return RespBean.ok("修改成功");
        } else return RespBean.error("修改失败");
    }

    @RequestMapping(value = "/updateHrPassword", method = RequestMethod.PUT)
    public RespBean updateHr(@RequestParam("oldPassword") String oldPassword, Hr hr) {
        hr.setEnabled(true);
        if (hrService.updateHrPassword(oldPassword, hr) == 1) {
            return RespBean.ok("密码修改成功");
        } else return RespBean.error("密码修改失败");
    }

    @RequestMapping(value = "/updateHrUserface", method = RequestMethod.POST)
    public RespBean updateHrUserface(@RequestParam("file") MultipartFile userface, Hr hr) {
        hr.setEnabled(true);
        try {
            if (hrService.updateHrUserface(userface, hr) == 1) {
                String url = hr.getUserface();
                Map<String, String> map = new HashMap<>();
                map.put("url", url);
                return RespBean.ok("头像修改成功", map);
            } else return RespBean.error("头像修改失败");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return RespBean.error("头像修改失败");
    }

    @RequestMapping(value = "/image/{url}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] getImage(@PathVariable("url") String url) {
        String basePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\userface\\";
        String filePath = basePath + url;

        File file = new File(filePath);
        byte[] bytes = null;
        try {
            FileInputStream fis = new FileInputStream(file);
            bytes = new byte[fis.available()];
            fis.read(bytes, 0, fis.available());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bytes;
    }
}
