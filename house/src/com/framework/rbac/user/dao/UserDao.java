package com.framework.rbac.user.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.user.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户 DAO层
 * Created by Jaylan on 2017-3-6.
 */
public class UserDao {

    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //登录
    public User login(String username, String password){
        String sql = "SELECT * FROM user WHERE account=? AND password=?";
        User user = new User();
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,username);
            this.ps.setObject(2,password);
            this.rs = this.ps.executeQuery();
            while(this.rs.next()){
                user.setId(this.rs.getInt("id"));
                user.setAccount(this.rs.getString("account"));
                user.setPassword(this.rs.getString("password"));
                user.setAddress(this.rs.getString("address"));
                user.setTel(this.rs.getString("tel"));
                user.setEmail(this.rs.getString("email"));
                user.setType(this.rs.getInt("type"));
            }
            if(user.getAccount()==null){
                throw new RuntimeException("用户名或密码错误");
            }
        } catch (SQLException e) {
            throw new RuntimeException("用户名或密码错误");
        }finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
                if(this.rs!=null){
                    this.rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭资源失败,原因为:"+e.getMessage());
            }
        }

        return user;
    }

    //登录
    public User loginAdmin(String username, String password){
        String sql = "SELECT * FROM user WHERE account=? AND password=? AND type='2'";
        User user = new User();
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,username);
            this.ps.setObject(2,password);
            this.rs = this.ps.executeQuery();
            while(this.rs.next()){
                user.setId(this.rs.getInt("id"));
                user.setAccount(this.rs.getString("account"));
                user.setPassword(this.rs.getString("password"));
                user.setAddress(this.rs.getString("address"));
                user.setTel(this.rs.getString("tel"));
                user.setEmail(this.rs.getString("email"));
                user.setType(this.rs.getInt("type"));
            }
            if(user.getAccount()==null){
                throw new RuntimeException("用户名或密码错误");
            }
        } catch (SQLException e) {
            throw new RuntimeException("用户名或密码错误");
        }finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
                if(this.rs!=null){
                    this.rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭资源失败,原因为:"+e.getMessage());
            }
        }

        return user;
    }

    //添加用户
    public void userAdd(String account,String password,String address,String tel,String email,Integer type){

        String sql = "INSERT INTO user(account,password,address,tel,email,type)VALUES(?,?,?,?,?,?)";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,account);
            this.ps.setObject(2,password);
            this.ps.setObject(3,address);
            this.ps.setObject(4,tel);
            this.ps.setObject(5,email);
            this.ps.setObject(6,type);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("添加失败,原因为:"+e.getMessage());
        }finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭资源失败,原因为:"+e.getMessage());
            }
        }
    }

    //修改用户信息
    public  void userUpdate(String account,String password,String address,String tel,String email,Integer id){
        String sql = "UPDATE user SET account=?,password=?,address=?,tel=?,email=? WHERE id=?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,account);
            this.ps.setObject(2,password);
            this.ps.setObject(3,address);
            this.ps.setObject(4,tel);
            this.ps.setObject(5,email);
            this.ps.setObject(6,id);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("修改失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭资源失败,原因为"+e.getMessage());
            }
        }

    }

    //查询用户信息

    public User QueryOne(Integer id){
        User user = new User();
        String sql = "SELECT * FROM user WHERE id="+id;
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (rs.next()){
                user.setAccount(this.rs.getString("account"));
                user.setType(this.rs.getInt("type"));
                user.setAddress(this.rs.getString("address"));
                user.setEmail(this.rs.getString("email"));
                user.setId(this.rs.getInt("id"));
                user.setPassword(this.rs.getString("password"));
                user.setTel(this.rs.getString("tel"));
            }
        } catch (SQLException e) {
            throw new RuntimeException("查询失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
                if(this.rs!=null){
                    this.rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
            }
        }
        return user;
    }

    public Pager Query(Pager pager){
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setAccount(this.rs.getString("account"));
                user.setType(this.rs.getInt("type"));
                user.setAddress(this.rs.getString("address"));
                user.setEmail(this.rs.getString("email"));
                user.setId(this.rs.getInt("id"));
                user.setPassword(this.rs.getString("password"));
                user.setTel(this.rs.getString("tel"));
                list.add(user);
            }
            pager.setDatas(list);
        } catch (SQLException e) {
            throw new RuntimeException("查询失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
                if(this.rs!=null){
                    this.rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
            }
        }
        return pager;
    }

    public Integer queryCount(){
        String sqlCount = "SELECT COUNT(*)num FROM user";
        try {
            int totalCount = 0;
            this.ps = this.conn.prepareStatement(sqlCount);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                totalCount = this.rs.getInt("num");
            }
            return totalCount;
        } catch (SQLException e) {
            throw new RuntimeException("查询失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
                if(this.rs!=null){
                    this.rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
            }
        }
    }

    //删除方法
    public void userDelete(Integer id){

        String sql = "DELETE FROM user WHERE id='"+id+"'";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("删除失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
            }
        }
    }

}
