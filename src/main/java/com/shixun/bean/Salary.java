package com.shixun.bean;

import java.util.Date;

/**
 * 基本薪资状态类
 */
public class Salary {
    //薪资编号
    private Integer id;
    //工资账套名字
    private String name;
    //基本工资
    private Float basicSalary;
    //交通补助
    private Float trafficSalary;
    //午餐补助
    private Float lunchSalary;
    //账套奖金
    private Float bonus;
    //基础账套总薪资
    private Float allSalary;
    //养老金基数
    private Float pensionBase;
    //养老金比率
    private Float pensionPer;
    //医疗保险基数
    private Integer medicalBase;
    //医疗保险比率
    private Float medicalPer;
    //公积金基数
    private Float accumulationFundBase;
    //公积金比率
    private Float accumulationFundPer;
    //启用时间
    private Date createDate;

    public Salary() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getBonus() {
        return bonus;
    }

    public void setBonus(Float bonus) {
        this.bonus = bonus;
    }

    public Float getLunchSalary() {
        return lunchSalary;
    }

    public void setLunchSalary(Float lunchSalary) {
        this.lunchSalary = lunchSalary;
    }

    public Float getTrafficSalary() {
        return trafficSalary;
    }

    public void setTrafficSalary(Float trafficSalary) {
        this.trafficSalary = trafficSalary;
    }

    public Float getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(Float basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Float getAllSalary() {
        return allSalary;
    }

    public void setAllSalary(Float allSalary) {
        this.allSalary = allSalary;
    }

    public Float getPensionBase() {
        return pensionBase;
    }

    public void setPensionBase(Float pensionBase) {
        this.pensionBase = pensionBase;
    }

    public Float getPensionPer() {
        return pensionPer;
    }

    public void setPensionPer(Float pensionPer) {
        this.pensionPer = pensionPer;
    }

    public Integer getMedicalBase() {
        return medicalBase;
    }

    public void setMedicalBase(Integer medicalBase) {
        this.medicalBase = medicalBase;
    }

    public Float getMedicalPer() {
        return medicalPer;
    }

    public void setMedicalPer(Float medicalPer) {
        this.medicalPer = medicalPer;
    }

    public Float getAccumulationFundBase() {
        return accumulationFundBase;
    }

    public void setAccumulationFundBase(Float accumulationFundBase) {
        this.accumulationFundBase = accumulationFundBase;
    }

    public Float getAccumulationFundPer() {
        return accumulationFundPer;
    }

    public void setAccumulationFundPer(Float accumulationFundPer) {
        this.accumulationFundPer = accumulationFundPer;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}