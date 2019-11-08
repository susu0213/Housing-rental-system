package com.framework.rbac.reason.web;

import com.framework.base.pager.Pager;
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
@WebServlet("/ReasonBargain.do")
public class ReasonBargain extends HttpServlet {
    ReasonDao reasonDao = new ReasonDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        Pager pager = new Pager();
        pager.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
        pager = this.reasonDao.Query(pager,name,"2");
        pager.setTotalCount(this.reasonDao.QueryCount(name,"2"));
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("ReasonBargain.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        Pager pager = new Pager();
        pager = this.reasonDao.Query(pager,name,"2");
        pager.setTotalCount(this.reasonDao.QueryCount(name,"2"));
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("ReasonBargain.jsp").forward(request,response);

    }
}
