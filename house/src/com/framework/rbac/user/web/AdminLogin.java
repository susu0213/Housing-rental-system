package com.framework.rbac.user.web;

import com.framework.rbac.user.dao.UserDao;
import com.framework.rbac.user.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/AdminLogin.do")
public class AdminLogin extends HttpServlet {
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String page = "";
        HttpSession session = request.getSession();
        try{
            User user = this.userDao.loginAdmin(username,password);
            session.setAttribute("Admin",user);
            page = "background/index.jsp";
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
            page = "background/login.jsp";
        }
        request.getRequestDispatcher(page).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("Admin");
        request.getRequestDispatcher("background/login.jsp").forward(request,response);

    }
}
