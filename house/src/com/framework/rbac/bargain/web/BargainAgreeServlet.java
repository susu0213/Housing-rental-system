package com.framework.rbac.bargain.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.bargain.dao.BargainDao;
import com.framework.rbac.bargain.model.Bargain;
import com.framework.rbac.house.dao.HouseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/BargainAgreeServlet.do")
public class BargainAgreeServlet extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    BargainDao bargainDao = new BargainDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        Pager pager = new Pager();
        pager = this.bargainDao.Query(pager,null,null,id);
        List<Bargain> list = (List<Bargain>) pager.getDatas();
        Bargain bargain = list.get(0);
        String lordName = request.getParameter("lordName");
        String lordTel = request.getParameter("lordTel");
        String houseAdmin = request.getParameter("houseAdmin");
        try {
            this.bargainDao.bargainUpdate(bargain.getId(), bargain.getCustomName(), bargain.getCustomTel(), lordName, lordTel, bargain.getHouseId(), houseAdmin);
            this.houseDao.houseUpdateStatus(id);
        }catch (RuntimeException e){
            request.setAttribute("messager",e.getMessage());
        }
        request.getRequestDispatcher("success.jsp").forward(request,response);

    }
}
