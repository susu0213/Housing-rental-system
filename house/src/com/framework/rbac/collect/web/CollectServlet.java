package com.framework.rbac.collect.web;

import com.framework.base.pager.Pager;
import com.framework.rbac.collect.dao.CollectDao;
import com.framework.rbac.collect.model.Collect;
import com.framework.rbac.house.dao.HouseDao;
import com.framework.rbac.house.model.House;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/CollectServlet.do")
public class CollectServlet extends HttpServlet {
    CollectDao collectDao = new CollectDao();
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Pager pager = new Pager();
        String userName = request.getParameter("userName");
        pager = this.collectDao.Query(pager,userName);
        pager.setTotalCount(this.collectDao.QueryCount(userName));
        List<Collect> list = (List<Collect>) pager.getDatas();
        List<House> house = new ArrayList<>();
        for(Collect collect : list){
            House house1 = this.houseDao.QueryOne(collect.getHouseId());
            house.add(house1);
        }
        request.setAttribute("pager",pager);
        request.setAttribute("house",house);
        request.getRequestDispatcher("CollectTable.jsp").forward(request,response);
    }
}
