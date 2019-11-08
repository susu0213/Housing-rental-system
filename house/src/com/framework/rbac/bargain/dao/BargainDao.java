package com.framework.rbac.bargain.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.bargain.model.Bargain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 合同 Dao层
 * Created by Jaylan on 2017-3-6.
 */
public class BargainDao {

    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //查询方法
    public Pager Query(Pager pager,String customName,String LordName,Integer houseId){


        List<Bargain> list = new ArrayList<Bargain>();
        String params = "";
        if(customName!=null){
            params = params + " AND custom_name='"+customName+"'";
        }
        if(LordName!=null){
            params = params + " AND lord_name='"+LordName+"'";
        }
        if(houseId!=null){
            params = params + " AND house_id='"+houseId+"'";
        }
        String sql = "SELECT * FROM bargain WHERE 1=1"+params+" LIMIT ?,?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,pager.getOffSet());
            this.ps.setObject(2,pager.getPageSize());
            this.rs = ps.executeQuery();
            while (this.rs.next()){
                Bargain bargain = new Bargain();
                bargain.setId(this.rs.getInt("id"));
                bargain.setCustomName(this.rs.getString("custom_name"));
                bargain.setCustomTel(this.rs.getString("custom_tel"));
                bargain.setLordName(this.rs.getString("lord_name"));
                bargain.setLordTel(this.rs.getString("lord_tel"));
                bargain.setHouseId(this.rs.getInt("house_id"));
                bargain.setAdminName(this.rs.getString("admin_name"));
                list.add(bargain);
            }
            pager.setDatas(list);
        } catch (SQLException e) {
            throw new RuntimeException("查询信息失败,原因为:"+e.getMessage());
        } finally {
            try {
                if(this.ps!=null){
                    ps.close();
                }
                if(this.rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
            }
        }

        return pager;
    }


    //查询方法
    public Integer QueryCount(String customName,String lordName){
        String params = "";
        if(customName!=null){
            params = params + " AND custom_name='"+customName+"'";
        }
        if(lordName!=null){
            params = params + " AND lord_name='"+lordName+"'";
        }
        String sqlCount = "SELECT COUNT(*)num FROM bargain WHERE 1=1 "+params;
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
    //添加方法
    public void houseAdd(String customName, String customTel, String lordName,String lordTel,Integer houseId, String adminName){

        String sql = "INSERT INTO bargain (custom_name,custom_tel,lord_name,lord_tel,house_id,admin_name)VALUES(?,?,?,?,?,?)";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,customName);
            this.ps.setObject(2,customTel);
            this.ps.setObject(3,lordName);
            this.ps.setObject(4,lordTel);
            this.ps.setObject(5,houseId);
            this.ps.setObject(6,adminName);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("添加失败,原因为:"+e.getMessage());
        } finally {
            if(this.ps!=null){
                try {
                    this.ps.close();
                } catch (SQLException e) {
                    throw new RuntimeException("关闭接口失败,原因为:"+e.getMessage());
                }
            }
        }


    }

    //删除方法
    public void houseDelete(Integer id,String houseCustom){

        String sql = "DELETE FROM bargain WHERE house_id=? AND custom_name=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,id);
            this.ps.setObject(2,houseCustom);
            ps.executeUpdate();
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

    public void bargainUpdate(Integer id,String customName, String customTel, String lordName,String lordTel, Integer houseId, String adminName){

        String sql = "UPDATE bargain SET custom_name=?,custom_tel=?,lord_name=?,lord_tel=?,house_id=?,admin_name=? WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,customName);
            this.ps.setObject(2,customTel);
            this.ps.setObject(3,lordName);
            this.ps.setObject(4,lordTel);
            this.ps.setObject(5,houseId);
            this.ps.setObject(6,adminName);
            this.ps.setObject(7,id);
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
