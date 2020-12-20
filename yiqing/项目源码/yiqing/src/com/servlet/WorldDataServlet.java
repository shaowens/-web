package com.servlet;




import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.google.gson.Gson;
import com.bean.*;


@WebServlet("/WorldDataServlet")
public class WorldDataServlet extends HttpServlet { // ��ʾȫ������



	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		this.doPost(req, resp);

	}



	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
        String Date=req.getParameter("time");
        System.out.println(Date);
		Dao dao = new Dao();
		List<Data> list=null;
	
		list=dao.wlist(Date);
		req.setAttribute("list",list); 
        Gson gson = new Gson();
        String json = gson.toJson(list);

        System.out.println(json);
        resp.getWriter().write(json);

	}

}