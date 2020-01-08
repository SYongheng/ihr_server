package com.shixun.bean;

import java.util.Date;

/**
 * 员工奖惩类
 */
public class RewardPunishment {
    //id
    private Long id;
    //员工编号
    private Long eid;
    //员工工号
    private String workID;
    //员工姓名
    private String ename;
    //奖罚日期
    private Date rpDate;
    //奖罚分
    private Integer rpPoint;
    //奖罚类别 0：罚，1：奖
    private Integer rpType;
    //备注
    private String remark;

    public RewardPunishment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEid() {
        return eid;
    }

    public void setEid(Long eid) {
        this.eid = eid;
    }

    public String getWorkID() {
        return workID;
    }

    public void setWorkID(String workID) {
        this.workID = workID;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Date getRpDate() {
        return rpDate;
    }

    public void setRpDate(Date rpDate) {
        this.rpDate = rpDate;
    }

    public Integer getRpPoint() {
        return rpPoint;
    }

    public void setRpPoint(Integer rpPoint) {
        this.rpPoint = rpPoint;
    }

    public Integer getRpType() {
        return rpType;
    }

    public void setRpType(Integer ecType) {
        this.rpType = ecType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
