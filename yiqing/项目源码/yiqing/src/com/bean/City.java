package com.bean;

public class City {

	    private int id;
		private String Date;
		private String City;
		private String New_Confirmed_num;
		private String Confirmed_num;
		private String Zhong_num;
		private String Cured_num;
		private String Dead_num;


	    public int getId() {
	        return id;
	    }
	    public void SetId(int id)
	    {
	        this.id=id;
	    }
	    public String getDate() {
	    	return Date;
	    }
	    public void SetDate(String Date) {
	    	this.Date = Date;
	    }
	    public String getCity() {
	    	return City;
	    }
	    public void SetCity(String City) {
	    	this.City = City;
	    }
	    public String getNew_Confirmed_num() {
	    	return New_Confirmed_num;
	    }
	    public void SetNew_Confirmed_num(String New_Confirmed_num) {
	    	this.New_Confirmed_num = New_Confirmed_num;
	    }
	    public String getConfirmed_num() {
	    	return Confirmed_num;
	    }
	    public void SetConfirmed_num(String Confirmed_num) {
	    	this.Confirmed_num = Confirmed_num;
	    }
	    public String getYisi_num() {
	    	return Zhong_num;
	    }
	    public void SetYisi_num(String Yisi_num) {
	    	this.Zhong_num = Yisi_num;
	    }
	    public String getCured_num() {
	    	return Cured_num;
	    }
	    public void SetCured_num(String Cured_num) {
	    	this.Cured_num = Cured_num;
	    }
	    public String getDead_num() {
	    	return Dead_num;
	    }
	    public void SetDead_num(String Dead_num) {
	    	this.Dead_num = Dead_num;
	    }

	    
	    public City(int id,String Date,String City,String New_Confirmed_num,String Confirmed_num,String Zhong_num,String Cured_num,String Dead_num) {
	    	this.id=id;
	    	this.Date = Date;
	    	this.City = City;
	    	this.New_Confirmed_num = New_Confirmed_num;
	    	this.Confirmed_num = Confirmed_num;
	    	this.Zhong_num = Zhong_num;
	    	this.Cured_num = Cured_num;
	    	this.Dead_num = Dead_num;
	    }
	    public City(String Date,String City,String New_Confirmed_num,String Confirmed_num,String Zhong_num,String Cured_num,String Dead_num) {
	    	this.id=id;
	    	this.Date = Date;
	    	this.City = City;
	    	this.New_Confirmed_num = New_Confirmed_num;
	    	this.Confirmed_num = Confirmed_num;
	    	this.Zhong_num = Zhong_num;
	    	this.Cured_num = Cured_num;
	    	this.Dead_num = Dead_num;
	    }
	    public City(int id,String City,String New_Confirmed_num,String Confirmed_num,String Zhong_num,String Cured_num,String Dead_num) {
	    	this.id=id;
	    	this.City = City;
	    	this.New_Confirmed_num = New_Confirmed_num;
	    	this.Confirmed_num = Confirmed_num;
	    	this.Zhong_num = Zhong_num;
	    	this.Cured_num = Cured_num;
	    	this.Dead_num = Dead_num;
	    }
	}
