package com.shixun.controller.system;

import com.shixun.bean.RespBean;
import com.shixun.bean.SqlFile;
import com.shixun.service.SqlFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/system/database")
public class DatabaseController {

    @Autowired
    private SqlFileService sqlFileService;

    @RequestMapping(value = "/getSqlFileByPage", method = RequestMethod.GET)
    public Map<String, Object> getSqlFileByPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                @RequestParam(value = "size", defaultValue = "10") Integer size,
                                                @RequestParam(value = "createDate", required = false) Date createDate) {
        Map<String, Object> map = new HashMap<>();
        Long count = sqlFileService.getSqlFileByCreateDate(createDate);
        List<SqlFile> databases = sqlFileService.getSqlFileByPage(page, size, createDate);
        map.put("count", count);
        map.put("databases", databases);
        return map;
    }

    @RequestMapping(value = "/backup", method = RequestMethod.POST)
    public RespBean backup() {
        try {
            if (sqlFileService.backup()) {
                return RespBean.ok("备份成功！");
            } else
                return RespBean.error("备份失败！");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return RespBean.error("备份失败！");
    }

    @RequestMapping(value = "/recover", method = RequestMethod.POST)
    public RespBean recover(@RequestParam("id") Long id) {
        try {
            if (sqlFileService.recover(id)) {
                return RespBean.ok("恢复成功！");
            } else
                return RespBean.error("恢复失败！");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return RespBean.error("恢复失败！");
    }

    @RequestMapping(value = "/deleteSqlFileByIds/{ids}",method = RequestMethod.DELETE)
    public RespBean deleteSqlFileByIds(@PathVariable("ids") String ids) {
        if (sqlFileService.deleteSqlFileByIds(ids))
            return RespBean.ok("删除成功！");
        else return RespBean.error("删除失败！");
    }
}
