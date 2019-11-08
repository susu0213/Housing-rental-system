package com.framework.rbac.house.dao;

import com.framework.base.jdbc.JDBC;
import com.framework.base.pager.Pager;
import com.framework.rbac.house.model.House;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 房屋信息 DAO层
 * Created by Jaylan on 2017-3-6.
 */
public class HouseDao {

    PreparedStatement ps;
    ResultSet rs;
    Connection conn = JDBC.getConn();

    //查询方法
    public Pager Query(Pager pager,Integer id,String houseName,String houseAddress,String houseMoney,String houseArea,String houseType,String houseLord,String houseTel,String type){
        List<House> list = new ArrayList<House>();
        String params = "";
        if(type=="1") {
            params = params + " AND house_admin IS NOT NULL";
        }
        if(type=="2") {
            params = params + " AND house_admin IS NULL";
        }
        if(type=="3") {
            params = params + " AND house_admin IS NOT NULL AND (house_custom IS NULL OR house_custom='') AND status IS NULL";
        }
        if(houseName!=null&&houseName!=""){
            params = params + " AND house_name='"+houseName+"'";
        }
        if(houseAddress!=null&&houseAddress!=""){
            params = params + " AND house_address='"+houseAddress+"'";
        }
        if(houseMoney!=null&&houseMoney!=""){
            params = params + " AND house_money='"+houseMoney+"'";
        }
        if(houseArea!=null&&houseArea!=""){
            params = params + " AND house_area='"+houseArea+"'";
        }
        if(houseType!=null&&houseType!=""){
            params = params + " AND house_type='"+houseType+"'";
        }
        if(houseLord!=null&&houseLord!=""){
            params = params + " AND house_lord='"+houseLord+"'";
        }
        if(houseTel!=null&&houseTel!=""){
            params = params + " AND house_tel='"+houseTel+"'";
        }
        if(id!=null){
            params = params + " AND id="+id;
        }
        String sql = "SELECT * FROM house WHERE 1=1"+params+" LIMIT ?,?";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setObject(1,pager.getOffSet());
            this.ps.setObject(2,pager.getPageSize());
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                House house = new House();
                house.setId(this.rs.getInt("id"));
                house.setHouseName(this.rs.getString("house_name"));
                house.setHouseAddress(this.rs.getString("house_address"));
                house.setHouseArea(this.rs.getString("house_area"));
                house.setHouseMoney(this.rs.getString("house_money"));
                house.setHouseType(this.rs.getString("house_type"));
                house.setHouseLord(this.rs.getString("house_lord"));
                house.setHouseTel(this.rs.getString("house_tel"));
                house.setHouseCustom(this.rs.getString("house_custom"));
                house.setHouseAdmin(this.rs.getString("house_admin"));
                house.setStatus(this.rs.getString("status"));
                house.setHouseImage(this.rs.getString("house_image"));
                list.add(house);
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

    public House QueryOne(Integer id){
        House house = new House();
        String sql = "SELECT * FROM house WHERE id='"+id+"'";
        try {
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()){
                house.setId(this.rs.getInt("id"));
                house.setHouseName(this.rs.getString("house_name"));
                house.setHouseAddress(this.rs.getString("house_address"));
                house.setHouseArea(this.rs.getString("house_area"));
                house.setHouseMoney(this.rs.getString("house_money"));
                house.setHouseType(this.rs.getString("house_type"));
                house.setHouseLord(this.rs.getString("house_lord"));
                house.setHouseTel(this.rs.getString("house_tel"));
                house.setHouseCustom(this.rs.getString("house_custom"));
                house.setHouseAdmin(this.rs.getString("house_admin"));
                house.setStatus(this.rs.getString("status"));
                house.setHouseImage(this.rs.getString("house_image"));
            }
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

        return house;
    }

    //查询数量
    public Integer queryCount(Integer id,String houseName,String houseAddress,String houseMoney,String houseArea,String houseType,String houseLord,String houseTel,String type){
        String params = "";
        if(type=="1") {
                params = " AND house_admin IS NOT NULL";
        }
        if(type=="2") {
            params = params + " AND house_admin IS NULL";
        }
        if(type=="3") {
            params = params + " AND house_admin IS NOT NULL AND (house_custom IS NULL OR house_custom='') AND status IS NULL";
        }
        if(houseName!=null&&houseName!=""){
            params = params + " AND house_name='"+houseName+"'";
        }
        if(houseAddress!=null&&houseAddress!=""){
            params = params + " AND house_address='"+houseAddress+"'";
        }
        if(houseMoney!=null&&houseMoney!=""){
            params = params + " AND house_money='"+houseMoney+"'";
        }
        if(houseArea!=null&&houseArea!=""){
            params = params + " AND house_area='"+houseArea+"'";
        }
        if(houseType!=null&&houseType!=""){
            params = params + " AND house_type='"+houseType+"'";
        }
        if(houseLord!=null&&houseLord!=""){
            params = params + " AND house_lord='"+houseLord+"'";
        }
        if(houseTel!=null&&houseTel!=""){
            params = params + " AND house_tel='"+houseTel+"'";
        }
        if(id!=null){
            params = params + " AND id="+id;
        }
        String sqlCount = "SELECT COUNT(*)num FROM house WHERE 1=1 "+params;
        try {
            int totalCount = 0;
            this.ps = this.conn.prepareStatement(sqlCount);
            this.rs = this.ps.executeQuery();
            while(rs.next()) {
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

    //添加方法
    public void houseAdd(String houseName,String houseAddress,String houseMoney,String houseArea,String houseType,String houseLord,String houseTel,String houseImage){

        String sql = "INSERT INTO house (house_name,house_address,house_money,house_area,house_type,house_lord,house_tel,house_image)VALUES(?,?,?,?,?,?,?,?)";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,houseName);
            this.ps.setObject(2,houseAddress);
            this.ps.setObject(3,houseMoney);
            this.ps.setObject(4,houseArea);
            this.ps.setObject(5,houseType);
            this.ps.setObject(6,houseLord);
            this.ps.setObject(7,houseTel);
            this.ps.setObject(8,houseImage);
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
    public void houseDelete(Integer id){

        String sql = "DELETE FROM house WHERE id='"+id+"'";
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

    public void houseUpdate(Integer id,String houseName,String houseAddress,String houseMoney,String houseArea,String houseType,String houseLord,String houseTel){

        String sql = "UPDATE house SET house_name=?,house_address=?,house_Money=?,house_area=?,house_type=?,house_lord=?,house_tel=? WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,houseName);
            this.ps.setObject(2,houseAddress);
            this.ps.setObject(3,houseMoney);
            this.ps.setObject(4,houseArea);
            this.ps.setObject(5,houseType);
            this.ps.setObject(6,houseLord);
            this.ps.setObject(7,houseTel);
            this.ps.setObject(8,id);
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

    public void houseUpdateCustom(Integer id,String houseCustom){

        String sql = "UPDATE house SET house_custom=? WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,houseCustom);
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

    public void houseUpdateAdmin(Integer id,String houseAdmin){

        String sql = "UPDATE house SET house_admin=? WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,houseAdmin);
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

    public void houseUpdateStatus(Integer id){

        String sql = "UPDATE house SET status='1' WHERE id=?";
        try {
            this.ps = conn.prepareStatement(sql);
            this.ps.setObject(1,id);
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
