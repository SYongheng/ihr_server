package com.shixun.controller;

import com.shixun.bean.Hr;
import com.shixun.bean.MsgContent;
import com.shixun.bean.RespBean;
import com.shixun.bean.SysMsg;
import com.shixun.service.HrService;
import com.shixun.service.SysMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 处理通知消息的Controller
 * 登录即可访问
 */
@RestController
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    HrService hrService;
    @Autowired
    SysMsgService sysMsgService;

    @RequestMapping(value = "/hrs", method = RequestMethod.GET)
    public List<Hr> getAllHr() {
        return hrService.getAllHrExceptAdmin();
    }

    @RequestMapping(value = "/nf", method = RequestMethod.POST)
    public RespBean sendNf(MsgContent msg) {
        if (sysMsgService.sendMsg(msg)) {
            return RespBean.ok("发送成功!");
        }
        return RespBean.error("发送失败!");
    }

    @RequestMapping("/sysmsgs")
    public List<SysMsg> getSysMsg(@RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "size", defaultValue = "10") Integer size) {
        return sysMsgService.getSysMsgByPage(page, size);
    }

    /**
     * @param flag flag=-1时读取一条，其他读取所有
     * @return
     */
    @RequestMapping(value = "/markread", method = RequestMethod.PUT)
    public RespBean markRead(Long flag) {
        if (sysMsgService.markRead(flag)) {
            if (flag == -1) {
                return RespBean.ok("全部已读");
            } else {
                return RespBean.ok("已读一条");
            }
        } else {
            if (flag == -1) {
                return RespBean.error("系统错误，请重试！");
            } else {
                return RespBean.error("系统错误，请重试！");
            }
        }
    }

    @RequestMapping(value = "/deleteMsg", method = RequestMethod.DELETE)
    public RespBean deleteMsg(@RequestParam("id") Long id) {
        if (sysMsgService.getStateById(id)) {
            if (sysMsgService.deleteMsg(id))
                return RespBean.ok("删除成功！");
            else return RespBean.error("删除失败！");
        } else return RespBean.error("信息未读，不能删除！");
    }
}
