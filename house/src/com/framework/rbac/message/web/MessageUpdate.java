package com.framework.rbac.message.web;

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
@WebServlet("/MessageUpdate.do")
public class MessageUpdate extends HttpServlet {
    MessageDao messageDao = new MessageDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String adminMessage = request.getParameter("adminMessage");
        Integer id = Integer.valueOf(request.getParameter("id"));
        this.messageDao.messageUpdate(id,adminMessage);
        request.getRequestDispatcher("background/main1.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	 request.setCharacterEncoding("UTF-8");
         try{
             Integer id = Integer.valueOf(request.getParameter("id"));
             System.out.println(id);
             Message message = this.messageDao.queryOne(id);
             request.setAttribute("message",message);
         }catch (RuntimeException e){

             request.setAttribute("message",e.getMessage());

         }

         request.getRequestDispatcher("MessageLook.jsp").forward(request,response);

     }
    	
}
