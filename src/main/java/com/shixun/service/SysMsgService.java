package com.shixun.service;

import com.shixun.bean.Hr;
import com.shixun.bean.MsgContent;
import com.shixun.bean.SysMsg;
import com.shixun.common.HrUtils;
import com.shixun.mapper.SysMsgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统信息类服务层
 */
@Service
@Transactional
public class SysMsgService {
    @Autowired
    SysMsgMapper sysMsgMapper;
    @Autowired
    HrService hrService;

    @PreAuthorize("hasRole('ROLE_admin')")//只有管理员可以发送系统消息
    public boolean sendMsg(MsgContent msg) {
        int result = sysMsgMapper.sendMsg(msg);
        List<Hr> allHr = hrService.getAllHr();
        int result2 = sysMsgMapper.addMsg2AllHr(allHr, msg.getId());
        return result2 == allHr.size();
    }

    public List<SysMsg> getSysMsgByPage(Integer page, Integer size) {
        int start = (page - 1) * size;
        return sysMsgMapper.getSysMsg(start, size, HrUtils.getCurrentHr().getId());
    }

    public boolean markRead(Long flag) {
        if (flag != -1) {
            return sysMsgMapper.markRead(flag, HrUtils.getCurrentHr().getId()) == 1;
        }
        sysMsgMapper.markRead(flag, HrUtils.getCurrentHr().getId());
        return true;
    }

    public boolean getStateById(Long id) {
        return sysMsgMapper.getStateById(id) == 1;
    }

    public boolean deleteMsg(Long id) {
        return sysMsgMapper.deleteMsg(id) == 1;
    }
}
