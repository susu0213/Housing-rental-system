package com.framework.rbac.message.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.message.dao.MessageDao;
import com.framework.rbac.message.model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/MessageServlet.do")
public class MessageServlet extends HttpServlet {
    MessageDao messageDao = new MessageDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            Pager pager = new Pager();
            pager = this.messageDao.Query(pager);
            pager.setTotalCount(this.messageDao.QueryCount());
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("MessageTable.jsp").forward(request,response);
    }
}
