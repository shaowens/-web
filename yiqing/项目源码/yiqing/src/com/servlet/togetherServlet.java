package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.City;
import com.bean.Togetcher;
import com.dao.Dao;
import com.google.gson.Gson;

/**
 * Servlet implementation class togetherServlet
 */
@WebServlet("/togetherServlet")
public class togetherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public togetherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String tiff=request.getParameter("tiff");
        String number=request.getParameter("number");
        System.out.println(tiff);
		Dao dao = new Dao();
		List<Togetcher> list;
		list=dao.together(tiff,number);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        System.out.println(json);
        response.getWriter().write(json);
	}

}
