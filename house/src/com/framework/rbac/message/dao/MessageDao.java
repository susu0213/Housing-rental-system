package com.framework.rbac.message.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.collect.model.Collect;
import com.framework.rbac.message.model.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 留言板 DAO层
 * Created by Jaylan on 2017-3-9.
 */
public class MessageDao {

    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //查询方法
    public Pager Query(Pager pager){
        List<Message> list = new ArrayList<Message>();
        String params = "";
        String sql = "SELECT * FROM message WHERE 1=1";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                Message message = new Message();
                message.setId(this.rs.getInt("id"));
                message.setUserMessage(this.rs.getString("user_message"));
                message.setAdminMessage(this.rs.getString("admin_message"));
                list.add(message);
            }
            pager.setDatas(list);
        } catch (SQLException e) {
            throw new RuntimeException("查询信息失败,原因为:"+e.getMessage());
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

    public Message queryOne(Integer id){
        Message message = new Message();
        String sql = "SELECT * FROM message WHERE 1=1 AND id=?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1, id);
            this.rs = this.ps.executeQuery();
            while (rs.next()){
                message.setId(this.rs.getInt("id"));
                message.setUserMessage(this.rs.getString("user_message"));
                message.setAdminMessage(this.rs.getString("admin_message"));
            }
            return  message;
        }catch (SQLException ex){
            throw new RuntimeException("查询失败");
        }finally {
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

    //查询方法
    public Integer QueryCount(){
        String sqlCount = "SELECT COUNT(*)num FROM message WHERE 1=1 ";
        try {
            int totalCount = 0;
            this.ps = this.conn.prepareStatement(sqlCount);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                totalCount = this.rs.getInt("num");
            }
            return totalCount;
        } catch (SQLException e) {
            throw new RuntimeException("查询信息失败,原因为:"+e.getMessage());
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

    //收藏
    public void messageAdd(String adminMessage,String userMessage){

        String sql = "INSERT INTO message(user_message,admin_message)VALUES(?,?)";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,userMessage);
            this.ps.setObject(2,adminMessage);
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
    public void messageUpdate(Integer id,String adminMessage){

        String sql = "UPDATE message SET admin_message=? WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,adminMessage);
            this.ps.setObject(2,id);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("修改失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    this.ps.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("接口关闭失败,原因为:"+e.getMessage());
            }
        }

    }

}
