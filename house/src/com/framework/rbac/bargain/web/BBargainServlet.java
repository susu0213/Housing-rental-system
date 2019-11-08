package com.framework.rbac.bargain.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.bargain.dao.BargainDao;
import com.framework.rbac.bargain.model.Bargain;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/BBargainServlet.do")
public class BBargainServlet extends HttpServlet {
    BargainDao bargainDao = new BargainDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pager pager = new Pager();
        pager.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
        pager = this.bargainDao.Query(pager,null,null,null);
        pager.setTotalCount(this.bargainDao.QueryCount(null,null));
        request.setAttribute("pager",pager);
        request.getRequestDispatcher("background/BargainTable.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String customName = request.getParameter("customName");
        try {
            Pager pager = new Pager();
            pager = this.bargainDao.Query(pager,null,null,null);
            pager.setTotalCount(this.bargainDao.QueryCount(null,null));
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("background/BargainTable.jsp").forward(request,response);

    }
}
