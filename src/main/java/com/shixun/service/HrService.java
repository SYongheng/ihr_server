package com.shixun.service;

import com.shixun.bean.Hr;
import com.shixun.common.HrUtils;
import com.shixun.mapper.HrMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;

/**
 * 人事经理类服务层
 */
@Service
@Transactional
public class HrService implements UserDetailsService {

    @Autowired
    HrMapper hrMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Hr hr = hrMapper.loadUserByUsername(s);
        if (hr == null) {
            throw new UsernameNotFoundException("用户名不对");
        }
        return hr;
    }

    public int register(String username, String password) {
        //如果用户名存在，返回错误
        if (hrMapper.loadUserByUsername(username) != null) {
            return -1;
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encode = encoder.encode(password);
        return hrMapper.register(username, encode);
    }

    public List<Hr> getHrsByKeywords(String keywords) {
        return hrMapper.getHrsByKeywords(keywords);
    }

    public int updateHr(Hr hr) {
        return hrMapper.updateHr(hr);
    }

    public int updateHrPassword(String oldPassword, Hr hr) {
        String databasePassword = hrMapper.getHrById(hr.getId()).getPassword();
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        //加密密码与旧密码进行匹配
        if (passwordEncoder.matches(oldPassword, databasePassword)) {
            //加密新密码
            hr.setPassword(passwordEncoder.encode(hr.getPassword()));
            return hrMapper.updateHr(hr);
        } else return 0;
    }

    public int updateHrUserface(MultipartFile userface, Hr hr) throws IOException {
        if (!userface.isEmpty()) {
            String basePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\userface\\";
            //文件名格式:id-时间戳-文件名
            String userfacePath = hr.getId() +"-" + System.currentTimeMillis() + "-" + userface.getOriginalFilename();
            String destPath = basePath + userfacePath;
            File desFile = new File(destPath);
            userface.transferTo(desFile);
            hr.setUserface("/hrCenter/image/" + userfacePath);
            return hrMapper.updateHr(hr);
        } else return 0;
    }

    public int updateHrRoles(Long hrId, Long[] rids) {
        int i = hrMapper.deleteRoleByHrId(hrId);
        return hrMapper.addRolesForHr(hrId, rids);
    }

    public Hr getHrById(Long hrId) {
        return hrMapper.getHrById(hrId);
    }

    public int deleteHr(Long hrId) {
        return hrMapper.deleteHr(hrId);
    }

    public List<Hr> getAllHrExceptAdmin() {
        return hrMapper.getAllHr(HrUtils.getCurrentHr().getId());
    }

    public List<Hr> getAllHr() {
        return hrMapper.getAllHr(null);
    }

    public Hr findHrById(Long id) {
        return hrMapper.findHrById(id);
    }
}
