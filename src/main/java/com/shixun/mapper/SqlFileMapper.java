package com.shixun.mapper;

import com.shixun.bean.SqlFile;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SqlFileMapper {

    int addSqlFile(SqlFile sqlFile);

    Long getSqlFileByCreateDate(@Param("createDate") Date createDate);

    List<SqlFile> getSqlFileByPage(@Param("start") Integer start, @Param("size") Integer size, @Param("createDate") Date createDate);

    SqlFile getSqlFileById(@Param("id") Long id);

    int deleteSqlFileByIds(@Param("ids") String[] ids);
}
