package com.framework.rbac.house.model;

/**
 * 房屋信息
 * id:房屋id
 * houseName:小区名称
 * houseAddress:小区地址
 * houseMoney:租金
 * houseArea:面积
 * houseType:户型
 * houseLord:房东姓名
 * houseTel:房东电话
 * houseAdmin:审核管理员
 * houseCustom:求租人
 * status:是否出租
 * Created by Jaylan on 2017-3-6.
 */
public class House {
    private Integer id;
    private String houseName;
    private String houseAddress;
    private String houseMoney;
    private String houseArea;
    private String houseType;
    private String houseLord;
    private String houseTel;
    private String houseAdmin;
    private String houseCustom;
    private String houseImage;
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    public String getHouseMoney() {
        return houseMoney;
    }

    public void setHouseMoney(String houseMoney) {
        this.houseMoney = houseMoney;
    }

    public String getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(String houseArea) {
        this.houseArea = houseArea;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getHouseLord() {
        return houseLord;
    }

    public void setHouseLord(String houseLord) {
        this.houseLord = houseLord;
    }

    public String getHouseTel() {
        return houseTel;
    }

    public void setHouseTel(String houseTel) {
        this.houseTel = houseTel;
    }

    public String getHouseAdmin() {
        return houseAdmin;
    }

    public void setHouseAdmin(String houseAdmin) {
        this.houseAdmin = houseAdmin;
    }

    public String getHouseCustom() {
        return houseCustom;
    }

    public void setHouseCustom(String houseCustom) {
        this.houseCustom = houseCustom;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	public String getHouseImage() {
		return houseImage;
	}

	public void setHouseImage(String houseImage) {
		this.houseImage = houseImage;
	}
    
}
