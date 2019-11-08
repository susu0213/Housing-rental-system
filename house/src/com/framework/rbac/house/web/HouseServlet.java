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
 * House层载入 Servlet
 * Created by Jaylan on 2017-3-7.
 */
@WebServlet("/HouseServlet.do")
public class HouseServlet extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        try {
            String search = request.getParameter("search");
            Pager pager = new Pager();
            pager.setPageNow(Integer.parseInt(request.getParameter("pageNow")));
            switch (type){
                case "小区名称":
                    String houseName = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,houseName,null,null,null,null,null,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,houseName,null,null,null,null,null,null,"3"));
                    break;
                case "小区地址":
                    String houseAddress = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,houseAddress,null,null,null,null,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,houseAddress,null,null,null,null,null,"3"));
                    break;
                case "租金":
                    String houseMoney = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,null,houseMoney,null,null,null,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,null,houseMoney,null,null,null,null,"3"));
                    break;
                case "面积":
                    String houseArea = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,null,null,houseArea,null,null,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,houseArea,null,null,null,"3"));
                    break;
                case "户型":
                    String houseType = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,null,null,null,houseType,null,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,houseType,null,null,"3"));
                    break;
                case "房东姓名":
                    String houseLord = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,null,null,null,null,houseLord,null,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,houseLord,null,"3"));
                    break;
                case "房东电话":
                    String houseTel = request.getParameter("search");
                    pager = this.houseDao.Query(pager,null,null,null,null,null,null,null,houseTel,"3");
                    pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,null,houseTel,"3"));
                    break;
                    default:
                        pager = this.houseDao.Query(pager,null,null,null,null,null,null,null,null,"3");
                        pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,null,null,"3"));
                        break;

            }
            request.setAttribute("type",type);
            request.setAttribute("searchLast",search);
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("pro_sel.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        try{
            Pager pager = new Pager();
            pager = this.houseDao.Query(pager,null,null,null,null,null,null,null,null,"3");
            pager.setTotalCount(this.houseDao.queryCount(null,null,null,null,null,null,null,null,"3"));
            request.setAttribute("pager",pager);
        }catch (RuntimeException e){

            request.setAttribute("message",e.getMessage());

        }

            request.getRequestDispatcher("pro_sel.jsp").forward(request,response);
    }
}
