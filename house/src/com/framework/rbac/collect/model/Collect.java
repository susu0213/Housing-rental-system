package com.framework.rbac.collect.model;

/**
 * 收藏表
 *  id:收藏id
 *  houseId:房屋id
 *  userName:用户名
 * Created by Jaylan on 2017-3-6.
 */
public class Collect {

    private Integer id;
    private Integer houseId;
    private String userName;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
