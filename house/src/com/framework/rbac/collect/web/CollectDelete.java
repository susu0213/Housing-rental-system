package com.framework.rbac.collect.web;

import com.framework.rbac.collect.dao.CollectDao;
import com.framework.rbac.user.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/CollectDelete.do")
public class CollectDelete extends HttpServlet {
    CollectDao collectDao = new CollectDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("User");
        try{
            this.collectDao.houseDelete(id,user.getAccount());
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("success.jsp").forward(request,response);

    }
}
