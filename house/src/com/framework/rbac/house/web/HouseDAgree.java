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
@WebServlet("/HouseDAgree.do")
public class HouseDAgree extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        String houseLord = request.getParameter("houseLord");
        this.houseDao.houseDelete(id);
        request.setAttribute("houseId",id);
        request.setAttribute("houseLord",houseLord);
        request.getRequestDispatcher("background/Reason.jsp").forward(request,response);

    }
}
