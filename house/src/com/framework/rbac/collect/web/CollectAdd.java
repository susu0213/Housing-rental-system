package com.framework.rbac.collect.web;

import com.framework.rbac.collect.dao.CollectDao;
import com.framework.rbac.collect.model.Collect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/CollectAdd.do")
public class CollectAdd extends HttpServlet {
    CollectDao collectDao = new CollectDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        Integer houseId = Integer.valueOf(request.getParameter("houseId"));
        String userName = request.getParameter("userName");
        Collect collect = this.collectDao.queryOne(houseId,userName);

        try{
                this.collectDao.collectAdd(houseId, userName);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("IndexServlet.do").forward(request,response
        );
    }
}
