package com.bean;

public class Data {
    private int id;
	private String Date;
	private String Province;
	private String City;
	private String Current_num;
	private String Confirmed_num;
	private String Yisi_num;
	private String Cured_num;
	private String Dead_num;
	private String Code;
    private String Continents;
   
    public String getContinents() {
		return Continents;
	}
	public void setContinents(String continents) {
		Continents = continents;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getCurrent_num() {
		return Current_num;
	}
	public void setCurrent_num(String current_num) {
		Current_num = current_num;
	}
	public String getConfirmed_num() {
		return Confirmed_num;
	}
	public void setConfirmed_num(String confirmed_num) {
		Confirmed_num = confirmed_num;
	}
	public String getYisi_num() {
		return Yisi_num;
	}
	public void setYisi_num(String yisi_num) {
		Yisi_num = yisi_num;
	}
	public String getCured_num() {
		return Cured_num;
	}
	public void setCured_num(String cured_num) {
		Cured_num = cured_num;
	}
	public String getDead_num() {
		return Dead_num;
	}
	public void setDead_num(String dead_num) {
		Dead_num = dead_num;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	public Data( String date, String continents , String province, String current_num, String confirmed_num, String yisi_num,String cured_num, String dead_num) {
		super();

		Date = date;
		Province = province;
		Current_num = current_num;
		Confirmed_num = confirmed_num;
		Yisi_num = yisi_num;
		Cured_num = cured_num;
		Dead_num = dead_num;
		Continents = continents;
	}
    public Data(String Date,String Province,String Confirmed_num,String Yisi_num,String Cured_num,String Dead_num) {
    	this.Province = Province;
    	this.Confirmed_num = Confirmed_num;
    	this.Yisi_num = Yisi_num;
    	this.Cured_num = Cured_num;
    	this.Dead_num = Dead_num;
    }
	public Data( String date, String province, String current_num, String confirmed_num, String yisi_num,String cured_num, String dead_num) {
		super();
	
		Date = date;
		Province = province;
		Current_num = current_num;
		Confirmed_num = confirmed_num;
		Yisi_num = yisi_num;
		Cured_num = cured_num;
		Dead_num = dead_num;
	}
    
}
