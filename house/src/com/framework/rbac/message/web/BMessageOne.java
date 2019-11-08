package com.framework.rbac.message.web;

import com.framework.rbac.house.model.House;
import com.framework.rbac.message.dao.MessageDao;
import com.framework.rbac.message.model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/BMessageOne.do")
public class BMessageOne extends HttpServlet {
    MessageDao messageDao = new MessageDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        try{
            Integer id = Integer.valueOf(request.getParameter("id"));
            Message message = this.messageDao.queryOne(id);
            request.setAttribute("message",message);
        }catch (RuntimeException e){

            request.setAttribute("message",e.getMessage());

        }

        request.getRequestDispatcher("background/MessageEdit.jsp").forward(request,response);
    }
}
