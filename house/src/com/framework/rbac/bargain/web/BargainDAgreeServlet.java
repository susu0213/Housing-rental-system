package com.framework.rbac.bargain.web;

import com.framework.rbac.bargain.dao.BargainDao;
import com.framework.rbac.house.dao.HouseDao;
import com.framework.rbac.house.model.House;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-10.
 */
@WebServlet("/BargainDAgreeServlet.do")
public class BargainDAgreeServlet extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    BargainDao bargainDao = new BargainDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.valueOf(request.getParameter("id"));
        String customName = request.getParameter("customName");
        this.bargainDao.houseDelete(id,customName);
        this.houseDao.houseUpdateCustom(id,"");
        request.setAttribute("houseId",id);
        request.setAttribute("houseLord",customName);
        request.getRequestDispatcher("Reason.jsp").forward(request,response);

    }
}
