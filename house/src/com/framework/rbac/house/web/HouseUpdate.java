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
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/HouseUpdate.do")
public class HouseUpdate extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        String houseName = request.getParameter("houseName");
        String houseAddress = request.getParameter("houseAddress");
        String houseMoney = request.getParameter("houseMoney");
        String houseArea = request.getParameter("houseArea");
        String houseType = request.getParameter("houseType");
        String houseLord = request.getParameter("houseLord");
        String houseTel = request.getParameter("houseTel");
        try{
            this.houseDao.houseUpdate(id,houseName,houseAddress,houseMoney,houseArea,houseType,houseLord,houseTel);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("success.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        try {
            House house = this.houseDao.QueryOne(id);
            request.setAttribute("house",house);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("HouseRentUpdate.jsp").forward(request,response);
    }
}
