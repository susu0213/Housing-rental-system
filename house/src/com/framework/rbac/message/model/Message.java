package com.framework.rbac.message.model;

/**
 * 留言板
 * id:留言id
 * userMessage:用户留言
 * adminMessage:管理员回复
 * Created by Jaylan on 2017-3-6.
 */
public class Message {

    private Integer id;
    private String userMessage;
    private String adminMessage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

    public String getAdminMessage() {
        return adminMessage;
    }

    public void setAdminMessage(String adminMessage) {
        this.adminMessage = adminMessage;
    }
}
