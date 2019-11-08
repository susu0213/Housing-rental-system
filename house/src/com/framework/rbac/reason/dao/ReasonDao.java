package com.framework.rbac.reason.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.message.model.Message;
import com.framework.rbac.reason.model.Reason;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 反馈信息 DAO层
 * Created by Jaylan on 2017-3-11.
 */
public class ReasonDao {

    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //查询方法
    public Pager Query(Pager pager,String name,String type){
        List<Reason> list = new ArrayList<Reason>();
        String params = "";
        String sql = "SELECT * FROM reason WHERE 1=1 AND lord=? AND type=?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,name);
            this.ps.setObject(2,type);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                Reason reason = new Reason();
                reason.setId(this.rs.getInt("id"));
                reason.setName(this.rs.getString("lord"));
                reason.setReason(this.rs.getString("reason"));
                reason.setHosueId(this.rs.getInt("house_id"));
                reason.setType(this.rs.getString("type"));
                list.add(reason);
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

    //查询方法
    public Integer QueryCount(String name,String type){
        String sqlCount = "SELECT COUNT(*)num FROM reason WHERE 1=1 AND lord=? AND type=?";
        try {
            int totalCount = 0;
            this.ps = this.conn.prepareStatement(sqlCount);
            this.ps.setObject(1,name);
            this.ps.setObject(2,type);
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
    public void messageAdd(String name,String reason,Integer houseId,String type){

        String sql = "INSERT INTO reason(lord,reason,house_id,type)VALUES(?,?,?,?)";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,name);
            this.ps.setObject(2,reason);
            this.ps.setObject(3,houseId);
            this.ps.setObject(4,type);
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

    //删除方法
    public void houseDelete(Integer id){

        String sql = "DELETE FROM reason WHERE id='"+id+"'";
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
