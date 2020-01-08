package com.shixun.mapper;

import com.shixun.bean.Hr;
import com.shixun.bean.MsgContent;
import com.shixun.bean.SysMsg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 系统信息映射接口
 */
public interface SysMsgMapper {

    int sendMsg(MsgContent msg);

    int addMsg2AllHr(@Param("hrs") List<Hr> hrs, @Param("mid") Long mid);

    List<SysMsg> getSysMsg(@Param("start") Integer start, @Param("size") Integer size, @Param("hrid") Long hrid);

    int markRead(@Param("flag") Long flag, @Param("hrid") Long hrid);

    int deleteMsg(@Param("id") Long id);

    int getStateById(@Param("id") Long id);
}
