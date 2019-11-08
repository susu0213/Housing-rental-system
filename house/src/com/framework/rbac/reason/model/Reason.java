package com.framework.rbac.reason.model;

/**
 * 反馈信息
 * Created by Jaylan on 2017-3-11.
 */
public class Reason {

    private Integer id;
    private String reason;
    private Integer hosueId;
    private String type;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getHosueId() {
        return hosueId;
    }

    public void setHosueId(Integer hosueId) {
        this.hosueId = hosueId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
