package com.framework.rbac.reason.web;

import com.framework.rbac.reason.dao.ReasonDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-11.
 */
@WebServlet("/BReasonServletAdd.do")
public class BReasonServletAdd extends HttpServlet {
    ReasonDao reasonDao = new ReasonDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer houseId = Integer.valueOf(request.getParameter("houseId"));
        String houseLord = request.getParameter("houseLord");
        String type = request.getParameter("type");
        String reason = request.getParameter("reason");
        this.reasonDao.messageAdd(houseLord,reason,houseId,type);
        request.getRequestDispatcher("background/main1.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
