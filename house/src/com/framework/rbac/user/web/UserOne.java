package com.framework.rbac.user.web;

import com.framework.rbac.house.dao.HouseDao;
import com.framework.rbac.user.dao.UserDao;
import com.framework.rbac.user.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-11.
 */
@WebServlet("/UserOne.do")
public class UserOne extends HttpServlet {
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = this.userDao.QueryOne(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("background/UserEdit.jsp").forward(request,response);

    }
}
