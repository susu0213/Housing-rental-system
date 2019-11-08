package com.framework.rbac.collect.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.collect.model.Collect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 收藏 DAO层
 * Created by Jaylan on 2017-3-9.
 */
public class CollectDao {
    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //查询方法
    public Pager Query(Pager pager,String userName){
        List<Collect> list = new ArrayList<Collect>();
        String params = "";
        if(userName!=null){
            params = params + " AND user_name='"+userName+"'";
        }
        String sql = "SELECT * FROM collect WHERE 1=1"+params+" LIMIT ?,?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,pager.getOffSet());
            this.ps.setObject(2,pager.getPageSize());
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                Collect collect = new Collect();
                collect.setId(this.rs.getInt("id"));
                collect.setHouseId(this.rs.getInt("house_id"));
                collect.setUserName(this.rs.getString("user_name"));
                list.add(collect);
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

    public Collect queryOne(Integer houseId,String userName){
        Collect collect = new Collect();
        String sql = "SELECT * FROM collect WHERE 1=1 AND house_id=? AND user_name=?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1, houseId);
            this.ps.setObject(2, userName);
            this.rs = this.ps.executeQuery();
            while (rs.next()){
                collect.setUserName(this.rs.getString("user_name"));
            }
            return  collect;
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
    public Integer QueryCount(String userName){
        String params = "";
        if(userName!=null){
            params = params + " AND user_name='"+userName+"'";
        }
        String sqlCount = "SELECT COUNT(*)num FROM collect WHERE 1=1 "+params;
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

    //删除方法
    public void houseDelete(Integer id,String userName){

        String sql = "DELETE FROM collect WHERE house_id='"+id+"' AND user_name='"+userName+"'";
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

    //收藏
    public void collectAdd(Integer houseId,String userName){

        String sql = "INSERT INTO collect(house_id,user_name)VALUES(?,?)";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,houseId);
            this.ps.setObject(2,userName);
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

}
