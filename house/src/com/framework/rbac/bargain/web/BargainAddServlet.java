package com.framework.rbac.bargain.web;

import com.framework.rbac.bargain.dao.BargainDao;
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
@WebServlet("/BargainAddServlet.do")
public class BargainAddServlet extends HttpServlet {
    BargainDao bargainDao = new BargainDao();
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String houseCustom = request.getParameter("houseCustom");
        String customTel = request.getParameter("customTel");
        Integer id = Integer.valueOf(request.getParameter("id"));
        this.bargainDao.houseAdd(houseCustom,customTel,null,null,id,null);
        this.houseDao.houseUpdateCustom(id,houseCustom);
        request.getRequestDispatcher("IndexServlet.do").forward(request,response);
    }
}
