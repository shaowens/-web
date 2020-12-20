package com.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.*;
import com.jdbc.Util;


public class Dao {
	
	public List<Data> list(String Date) { // ��ѯ������Ϣ


		List<Data> list = new ArrayList<Data>(); // ��������
		Connection conn = Util.getConn();
		String sql = "select * from province_map where  date = '" + Date + "'"; // SQL��ѯ���

		try {

			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			
			Data data = null;
			while (rs.next()) {

      
				String Province = rs.getString("provinceName");
				
				String Confirmed_num = rs.getString("confirmedCount");
				
				String Yisi_num = rs.getString("suspectedCount");
				
				String Cured_num = rs.getString("curedCount");
				
				String Dead_num = rs.getString("deadCount");
				
				String Current_num = rs.getString("currentConfirmedCount");
				

	                data = new Data(Date,Province,Current_num,Confirmed_num,Yisi_num,Cured_num,Dead_num);
	                list.add(data);
				

			}


			rs.close(); // �ر�

			pst.close(); // �ر�

		} catch (SQLException e1) {

			e1.printStackTrace(); // �׳��쳣

		}

		return list; // ����һ������

	}
	public List<Data> wlist(String Date) { // ��ѯ������Ϣ


        
		List<Data> list = new ArrayList<Data>(); // ��������
		Connection conn = Util.getConn();
		String sql = "select * from world_map where  date = '" + Date + "'";// SQL��ѯ���

		try {

			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			
			Data data = null;
			while (rs.next()) {

				
  
    			String Continents = rs.getString("continents");
    			
				String Province = rs.getString("provinceName");
				
				String Confirmed_num = rs.getString("confirmedCount");
				
				String Yisi_num = rs.getString("suspectedCount");
				
				String Cured_num = rs.getString("curedCount");
				
				String Dead_num = rs.getString("deadCount");
				
				String Current_num = rs.getString("currentConfirmedCount");
				

	            data = new Data(Date,Continents,Province,Current_num,Confirmed_num,Yisi_num,Cured_num,Dead_num);
	            list.add(data);
				

			}

			rs.close(); // �ر�

			pst.close(); // �ر�

		} catch (SQLException e1) {

			e1.printStackTrace(); // �׳��쳣

		}

		return list; // ����һ������

	}

	public List<Data> list(String Date,String Province) { // ��ѯ������Ϣ

        
		List<Data> list = new ArrayList<Data>(); // ��������
		Connection conn = Util.getConn();
		String sql = "select * from province_map";

		try {

			PreparedStatement pst = conn.prepareStatement(sql);
			
			
			ResultSet rs = pst.executeQuery();
			
			Data data = null;
			while (rs.next()) {

				String Province2 = rs.getString("provinceName");
				
				String Confirmed_num = rs.getString("confirmedCount");
				
				String Yisi_num = rs.getString("suspectedCount");
				
				String Cured_num = rs.getString("curedCount");
				
				String Dead_num = rs.getString("deadCount");
				
				String Date2 = rs.getString("date");
	
				
				if(Date==""&&Province!="") {
					if(Province.equals(Province2))
					{
		                data = new Data(Date2,Province,Confirmed_num,Yisi_num,Cured_num,Dead_num);
		                list.add(data);
					}
				}
				if(Province==""&&Date!="") {
					if(Date.equals(Date2))
					{
		                data = new Data(Date,Province2,Confirmed_num,Yisi_num,Cured_num,Dead_num);
		                list.add(data);
					}
				}
				if(Province==""&&Date=="") {
		
		                data = new Data(Date2,Province2,Confirmed_num,Yisi_num,Cured_num,Dead_num);
		                list.add(data);
					
				}
				if(Province!=""&&Date!="") {
					if(Date.equals(Date2)&&Province.equals(Province2))
					{
		                data = new Data(Date,Province,Confirmed_num,Yisi_num,Cured_num,Dead_num);
		                list.add(data);
					}
				}


			}

			rs.close(); // �ر�

			pst.close(); // �ر�

		} catch (SQLException e1) {

			e1.printStackTrace(); // �׳��쳣

		}

		return list; // ����һ������

	}


	public List<City> clist(String Date,String Province) { // ��ѯ������Ϣ

		String begin="";
        String []s=Date.split("-");
        for(int i=0;i<s.length;i++)
            begin+=s[i].toString();
        int bg=Integer.valueOf(begin);
        
		List<City> list = new ArrayList<City>(); // ��������
		Connection conn = Util.getConn();
		String sql = "select * from city_map where  date = '" + Date + "'and provinceShortName = '" + Province +"'"; // SQL��ѯ���

		try {

			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			
		    City city = null;
			int index=1;
			while (rs.next()) {

                
    			
            	String New_Confirmed_num = rs.getString("currentConfirmedCount");
            	
				String Confirmed_num = rs.getString("confirmedCount");
				
				String Yisi_num = rs.getString("suspectedCount");
				
				String Cured_num = rs.getString("curedCount");
				
				String Dead_num = rs.getString("deadCount");
				
				String City = rs.getString("cityName");

	                city = new City(Date,City,New_Confirmed_num,Confirmed_num,Yisi_num,Cured_num,Dead_num);
	                list.add(city);
				}

			

			rs.close(); // �ر�

			pst.close(); // �ر�

		} catch (SQLException e1) {

			e1.printStackTrace(); // �׳��쳣

		}

		return list; // ����һ������

	}
	
	
	public List<WorldSum> slist() { // ��ѯ������Ϣ


		List<WorldSum> list = new ArrayList<WorldSum>(); // ��������
		Connection conn = Util.getConn();
		String sql = "select * from conturysum "; // SQL��ѯ���

		try {

			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();
			
			WorldSum worldsum = null;
			
			while (rs.next()) {

                
				String date = rs.getString("date");
				
				String confirmed= rs.getString("confirmed");
				
				String currentt = rs.getString("currentt");
				
				String cured = rs.getString("cured");
				
				String dead = rs.getString("dead");
				

	                worldsum = new WorldSum(date,confirmed,cured,dead,currentt);
	            
	            list.add(worldsum);
           
			}

			rs.close(); // �ر�

			pst.close(); // �ر�

		} catch (SQLException e1) {

			e1.printStackTrace(); // �׳��쳣

		}

		return list; // ����һ������

	}
	public List<word> selectRC(){
		Connection conn = Util.getConn(); //连接数据库
	    List<word> list = new ArrayList<word>();
	    try {
	        String sql="select * from rcs";
	        Statement pstmt = (Statement) conn.createStatement();
	        ResultSet rs = (ResultSet) pstmt.executeQuery(sql);
	        while(rs.next()) {
	        	word word=new word();
	        	word.setName(rs.getString("name"));//热词
	        	word.setValue(rs.getInt("value"));//频率
	            list.add(word);
	        }
	        System.out.println("Dao Success!!");
	        rs.close();
	        pstmt.close();
	        conn.close();

	    }catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	public List<Togetcher>  together(String tiff,String number) {
		List<Togetcher> list = new ArrayList<Togetcher>();
		Connection conn = Util.getConn();
		String sql = "select * from covid_virus_trip where  tripType = '" + tiff + "' and tripNo = '" + number + "'   ";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			Togetcher togetcher=null;
			while (rs.next()) {
                String tripDepname=rs.getString("tripDepname");
				String tripDate = rs.getString("tripDate");
				String tripArrname = rs.getString("tripArrname");
				String carriage = rs.getString("carriage");
				String seatNo = rs.getString("seatNo");
				String tripMemo = rs.getString("tripMemo");
	            togetcher = new Togetcher(tripDepname,tripDate,tripArrname,carriage,seatNo,tripMemo);
	            list.add(togetcher);
			}
			rs.close(); // 锟截憋拷
			pst.close(); // 锟截憋拷
		} catch (SQLException e1) {
			e1.printStackTrace(); // 锟阶筹拷锟届常
		}
		return list;
	}
	
	
}
