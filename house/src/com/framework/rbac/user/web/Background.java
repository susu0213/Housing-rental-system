package com.framework.rbac.user.web;

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
@WebServlet("/Background.do")
public class Background extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("Admin");
        String page = "";
        if(user==null){
            page = "background/login.jsp";
        }
        else{
            page = "background/index.jsp";
        }
        request.getRequestDispatcher(page).forward(request,response);
    }
}
