package com.framework.rbac.user.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.house.dao.HouseDao;
import com.framework.rbac.message.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-11.
 */
@WebServlet("/IndexServlet.do")
public class IndexServlet extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    MessageDao messageDao = new MessageDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pager pagerHouse = new Pager();
        pagerHouse = this.houseDao.Query(pagerHouse,null,null,null,null,null,null,null,null,"3");
        request.setAttribute("pagerHouse",pagerHouse);
        Pager pagerMessage = new Pager();
        pagerMessage = this.messageDao.Query(pagerMessage);
        request.setAttribute("pagerMessage",pagerMessage);
        request.getRequestDispatcher("First.jsp").forward(request,response);

    }
}
