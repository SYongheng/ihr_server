package com.shixun.service;

import com.shixun.bean.SqlFile;
import com.shixun.mapper.SqlFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SqlFileService {

    @Autowired
    private SqlFileMapper sqlFileMapper;

    private String ip = "localhost";
    private String port = "3306";
    private String dbName = "ihr";
    private String username = "root";
    private String password = "root";
    private String basePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\sql\\";
    private SimpleDateFormat birthdayFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public Long getSqlFileByCreateDate(Date createDate) {
        return sqlFileMapper.getSqlFileByCreateDate(createDate);
    }

    public List<SqlFile> getSqlFileByPage(Integer page, Integer size, Date createDate) {
        Integer start = (page - 1) * size;
        return sqlFileMapper.getSqlFileByPage(start, size, createDate);
    }

    public boolean backup() throws IOException {
        Date createDate = new Date(System.currentTimeMillis());
        String fileName = "ihr-sql-" + createDate.getTime() + ".sql";
        StringBuffer sb = new StringBuffer();
        sb.append("mysqldump");
        sb.append(" -h" + ip);
        sb.append(" -P" + port);
        sb.append(" -u" + username);
        sb.append(" -p" + password);
        sb.append(" --default-character-set=utf8");
        sb.append(" " + dbName + " > ");
        sb.append(basePath + fileName);
        Runtime runtime = Runtime.getRuntime();
        runtime.exec("cmd /c" + sb.toString());
        SqlFile sqlFile = new SqlFile();
        sqlFile.setName("ihr-sql-" + birthdayFormat.format(createDate));
        sqlFile.setCreateDate(createDate);
        sqlFile.setUrl(fileName);
        return sqlFileMapper.addSqlFile(sqlFile) == 1;
    }

    public boolean recover(Long id) throws IOException {
        SqlFile sqlFile = sqlFileMapper.getSqlFileById(id);
        StringBuffer sb = new StringBuffer();
        sb.append("mysql");
        sb.append(" -h" + ip);
        sb.append(" -P" + port);
        sb.append(" -u" + username);
        sb.append(" -p" + password);
        sb.append(" --default-character-set=utf8");
        sb.append(" " + dbName + " < ");
        sb.append(basePath + sqlFile.getUrl());
        Runtime runtime = Runtime.getRuntime();
        runtime.exec("cmd /c" + sb.toString());
        return true;
    }

    public boolean deleteSqlFileByIds(String ids) {
        String[] splits = ids.split(",");
        return sqlFileMapper.deleteSqlFileByIds(splits) == splits.length;
    }
}
