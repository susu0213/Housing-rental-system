package com.framework.rbac.house.web;

import com.framework.rbac.house.dao.HouseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/HouseAgree.do")
public class HouseAgree extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        String houseAdmin = request.getParameter("houseAdmin");
        System.out.println(houseAdmin);
        this.houseDao.houseUpdateAdmin(id,houseAdmin);
        request.getRequestDispatcher("BHouseServlet.do").forward(request,response);

    }
}
