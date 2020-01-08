package com.shixun.bean;

import java.util.Date;

/**
 * 员工调动记录类
 */
public class EmpRemove {
    //员工调动记录编号
    private Long id;
    //员工编号
    private Long eid;
    //员工工号
    private String workID;
    //员工姓名
    private String ename;
    //原部门编号
    private Long sourceDepId;
    //原职称编号
    private Long sourceJobId;
    //原职位编号
    private Long sourcePosId;
    //原部门名称
    private String sourceDepName;
    //原职称名称
    private String sourceJobName;
    //原职位名称
    private String sourcePosName;
    //现部门编号
    private Long targetDepId;
    //现职称编号
    private Long targetJobId;
    //现职位编号
    private Long targetPosId;
    //现部门名称
    private String targetDepName;
    //现职称名称
    private String targetJobName;
    //现职位名称
    private String targetPosName;
    //调动日期
    private Date removeDate;
    //备注
    private String remark;

    public EmpRemove() {
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

    public Long getSourceDepId() {
        return sourceDepId;
    }

    public void setSourceDepId(Long sourceDepId) {
        this.sourceDepId = sourceDepId;
    }

    public Long getSourceJobId() {
        return sourceJobId;
    }

    public void setSourceJobId(Long sourceJobId) {
        this.sourceJobId = sourceJobId;
    }

    public Long getSourcePosId() {
        return sourcePosId;
    }

    public void setSourcePosId(Long sourcePosId) {
        this.sourcePosId = sourcePosId;
    }

    public String getSourceDepName() {
        return sourceDepName;
    }

    public void setSourceDepName(String sourceDepName) {
        this.sourceDepName = sourceDepName;
    }

    public String getSourceJobName() {
        return sourceJobName;
    }

    public void setSourceJobName(String sourceJobName) {
        this.sourceJobName = sourceJobName;
    }

    public String getSourcePosName() {
        return sourcePosName;
    }

    public void setSourcePosName(String sourcePosName) {
        this.sourcePosName = sourcePosName;
    }

    public Long getTargetDepId() {
        return targetDepId;
    }

    public void setTargetDepId(Long targetDepId) {
        this.targetDepId = targetDepId;
    }

    public Long getTargetJobId() {
        return targetJobId;
    }

    public void setTargetJobId(Long targetJobId) {
        this.targetJobId = targetJobId;
    }

    public Long getTargetPosId() {
        return targetPosId;
    }

    public void setTargetPosId(Long targetPosId) {
        this.targetPosId = targetPosId;
    }

    public String getTargetDepName() {
        return targetDepName;
    }

    public void setTargetDepName(String targetDepName) {
        this.targetDepName = targetDepName;
    }

    public String getTargetJobName() {
        return targetJobName;
    }

    public void setTargetJobName(String targetJobName) {
        this.targetJobName = targetJobName;
    }

    public String getTargetPosName() {
        return targetPosName;
    }

    public void setTargetPosName(String targetPosName) {
        this.targetPosName = targetPosName;
    }

    public Date getRemoveDate() {
        return removeDate;
    }

    public void setRemoveDate(Date removeDate) {
        this.removeDate = removeDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
