package com.framework.rbac.house.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.framework.rbac.house.dao.HouseDao;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebServlet("/HouseAdd.do")
@MultipartConfig
public class HouseAdd extends HttpServlet {
    HouseDao houseDao = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8");
        String houseName = request.getParameter("houseName");
        String houseAddress = request.getParameter("houseAddress");
        String houseMoney = request.getParameter("houseMoney");
        String houseArea = request.getParameter("houseArea");
        String houseType = request.getParameter("houseType");
        String houseLord = request.getParameter("houseLord");
        String houseTel = request.getParameter("houseTel");
            Part part = request.getPart("houseImage");
            String header = part.getHeader("Content-Disposition");
            String fileName = header.substring(header.indexOf("filename=\"") + 10,
                    header.lastIndexOf("\""));
            String path = request.getServletContext().getRealPath("/upload");
            this.houseDao.houseAdd(houseName,houseAddress,houseMoney,houseArea,houseType,houseLord,houseTel,fileName);
            part.write(path+"/"+fileName);
        request.getRequestDispatcher("success.jsp").forward(request,response);

    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        try{
            this.houseDao.houseDelete(id);
        }catch (RuntimeException e){
            request.setAttribute("message",e.getMessage());
        }
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }
}
