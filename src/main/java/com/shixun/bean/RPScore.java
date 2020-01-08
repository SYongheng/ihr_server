package com.shixun.bean;

/**
 * 个人奖惩分数类
 */
public class RPScore {
    private Long eid;
    private String workID;
    private String ename;
    private Integer rpScore;

    public RPScore() {
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

    public Integer getRpScore() {
        return rpScore;
    }

    public void setRpScore(Integer rpScore) {
        this.rpScore = rpScore;
    }
}
