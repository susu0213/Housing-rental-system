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
 * Created by Jaylan on 2017-3-6.
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String page = "";
        HttpSession session = request.getSession();
        try{
            User user = this.userDao.login(username,password);
            session.setAttribute("User",user);
            page = "index.jsp";
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
            page = "login.jsp";
        }
        request.getRequestDispatcher(page).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            session.removeAttribute("User");
            request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
