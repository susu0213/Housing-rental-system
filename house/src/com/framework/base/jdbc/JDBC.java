package com.framework.base.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * JDBC 驱动文件
 * Created by Jaylan on 2017-3-6.
 * USERNAME 数据库用户名
 * PASSWORD 数据库密码
 * URL 数据库连接地址
 * DRIVER JDBC驱动包位置
 */
public class JDBC {

    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/house?useUnicode=true&characterEncoding=utf8";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static Connection conn;

    //私有构造方法,防止外部调用
    private JDBC(){};

    //加载驱动,自动执行
    static{
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("加载驱动失败,原因为:"+e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException("数据库连接失败,原因为:"+e.getMessage());
        }

    }

    //外部调用,获取接口方法
    public static Connection getConn(){
        return conn;
    }

    //外部调用,关闭接口方法
    public static void close(){
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException("数据库关闭失败,原因为:"+e.getMessage());
            }
        }
    }
}
