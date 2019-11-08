package com.framework.rbac.house.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.house.dao.HouseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/HouseAgreeServlet.do")
public class HouseAgreeServlet extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pager pager = new Pager();
        pager.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
        pager = this.houseDao.Query(pager,null,null,null,null,null,null,null,null,"1");
        pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,null,null,"1"));
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("background/HouseReaded.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        try{
            Pager pager = new Pager();
            pager = this.houseDao.Query(pager,null,null,null,null,null,null,null,null,"1");
            pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,null,null,"1"));
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){

            request.setAttribute("message",e.getMessage());

        }

        request.getRequestDispatcher("background/HouseReaded.jsp").forward(request,response);
    }

}
