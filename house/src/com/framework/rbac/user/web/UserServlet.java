package com.framework.rbac.user.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.user.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/UserServlet.do")
public class UserServlet extends HttpServlet {
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pager pager = new Pager();
        pager.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
        pager = this.userDao.Query(pager);
        pager.setTotalCount(this.userDao.queryCount());
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("background/UserTable.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Pager pager = new Pager();
        pager = this.userDao.Query(pager);
        pager.setTotalCount(this.userDao.queryCount());
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("background/UserTable.jsp").forward(request,response);

    }
}
