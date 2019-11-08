package com.framework.rbac.user.web;

import com.framework.rbac.user.dao.UserDao;
import com.framework.rbac.user.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/UserInf.do")
public class UserInf extends HttpServlet {
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        Integer id = Integer.valueOf(request.getParameter("id"));
        this.userDao.userUpdate(account,password,address,tel,email,id);
        request.getRequestDispatcher("UserInf.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        try{
            User user = this.userDao.QueryOne(id);
            request.setAttribute("User",user);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("UserInf.jsp").forward(request,response);

    }
}
