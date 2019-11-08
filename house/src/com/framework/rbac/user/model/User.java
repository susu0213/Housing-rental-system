package com.framework.rbac.user.model;

/**
 * 用户信息
 * id:用户id
 * account:用户名
 * password:密码
 * address:地址
 * tel:电话
 * email:邮箱
 * type:用户类型
 * Created by Jaylan on 2017-3-6.
 */
public class User {

    private Integer id;
    private String account;
    private String password;
    private String address;
    private String tel;
    private String email;
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
