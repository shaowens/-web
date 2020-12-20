package com.servlet;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.City;
import com.dao.Dao;
import com.google.gson.Gson;

/**
 * Servlet implementation class CitySort
 */
@WebServlet("/CitySort")
public class CitySort extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CitySort() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
		        String Date=request.getParameter("time");
		        String btn=request.getParameter("id");
		        //System.out.println("kanyikan");
		        System.out.println(btn);
		        String province="河北";
				Dao dao = new Dao();
				List<City> list=null;
			
				list=dao.clist(Date,province);
				switch (btn) {
				case "1":
					System.out.println("����confirm");
					list.sort(new Comparator<City>() {
					public int compare(City o1,City o2) {
						Integer i1=Integer.parseInt(o1.getConfirmed_num());
						Integer i2=Integer.parseInt(o2.getConfirmed_num());
						return i2-i1;
					}
					});
					
					//System.out.println(list);
					break;
				case "2":
					System.out.println("����dead");
					list.sort(new Comparator<City>() {
					public int compare(City o1,City o2) {
						Integer i1=Integer.parseInt(o1.getDead_num());
						Integer i2=Integer.parseInt(o2.getDead_num());
						return i2-i1;
					}

					});
					//System.out.println(list);
					break;
				case "3":
					System.out.println("����cured");
					list.sort(new Comparator<City>() {
					public int compare(City o1,City o2) {
						Integer i1=Integer.parseInt(o1.getCured_num());
						Integer i2=Integer.parseInt(o2.getCured_num());
						return i2-i1;
					}
					});
					//System.out.println(list);
					break;
				case "4":
					System.out.println("����now");
					list.sort(new Comparator<City>() {
					public int compare(City o1,City o2) {
						Integer i1=Integer.parseInt(o1.getNew_Confirmed_num());
						Integer i2=Integer.parseInt(o2.getNew_Confirmed_num());
						return i2-i1;
					}
					});
					//System.out.println(list);
					break;
				default:
					break;
				}
		        Gson gson = new Gson();
		        String json = gson.toJson(list);

		        System.out.println(json);
		        response.getWriter().write(json);
			}
	}


