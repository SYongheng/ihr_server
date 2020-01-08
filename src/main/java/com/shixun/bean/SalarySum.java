package com.shixun.bean;

import java.util.Date;

/**
 * 应发薪资类
 */
public class SalarySum {
    private Long id;
    private Long eid;
    private String workID;
    private String ename;
    private Float basicSalary;
    private Float titleLevelCommission;
    private Float rpCommission;
    private Float allSalary;
    private Date createDate;
    private Integer status;

    public SalarySum() {
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

    public Float getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(Float basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Float getTitleLevelCommission() {
        return titleLevelCommission;
    }

    public void setTitleLevelCommission(Float titleLevelCommission) {
        this.titleLevelCommission = titleLevelCommission;
    }

    public Float getRpCommission() {
        return rpCommission;
    }

    public void setRpCommission(Float rpCommission) {
        this.rpCommission = rpCommission;
    }

    public Float getAllSalary() {
        return allSalary;
    }

    public void setAllSalary(Float allSalary) {
        this.allSalary = allSalary;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
