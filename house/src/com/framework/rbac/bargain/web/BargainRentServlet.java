package com.framework.rbac.bargain.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.bargain.dao.BargainDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/BargainRentServlet.do")
public class BargainRentServlet extends HttpServlet {
    BargainDao bargainDao = new BargainDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String lordName = request.getParameter("lordName");
        try {
            Pager pager = new Pager();
            pager = this.bargainDao.Query(pager,null,lordName,null);
            pager.setTotalCount(this.bargainDao.QueryCount(null,lordName));
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("BargainRent.jsp").forward(request,response);
    }

}
