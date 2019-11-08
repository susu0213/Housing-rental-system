package com.framework.rbac.bargain.model;

/**
 * 合同
 * id:合同id
 * customName:租客姓名
 * customTel:租客电话
 * lordName:房东姓名
 * lordTel:房东电话
 * houseId:房屋id
 * adminName:审核管理员姓名
 * Created by Jaylan on 2017-3-6.
 */
public class Bargain {
    private Integer id;
    private String customName;
    private String customTel;
    private String lordName;
    private String lordTel;
    private Integer houseId;
    private String adminName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName;
    }

    public String getCustomTel() {
        return customTel;
    }

    public void setCustomTel(String customTel) {
        this.customTel = customTel;
    }

    public String getLordName() {
        return lordName;
    }

    public void setLordName(String lordName) {
        this.lordName = lordName;
    }

    public String getLordTel() {
        return lordTel;
    }

    public void setLordTel(String lordTel) {
        this.lordTel = lordTel;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
}
