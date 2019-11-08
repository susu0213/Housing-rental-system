package com.framework.rbac.house.web;

import com.framework.rbac.house.dao.HouseDao;
import com.framework.rbac.house.model.House;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-8.
 */
@WebServlet("/HouseOne.do")
public class HouseOne extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try{
            Integer id = Integer.valueOf(request.getParameter("id"));
            House house = this.houseDao.QueryOne(id);
            request.setAttribute("house",house);
        }catch (RuntimeException e){

            request.setAttribute("message",e.getMessage());

        }

        request.getRequestDispatcher("pro_shop.jsp").forward(request,response);
    }
}
