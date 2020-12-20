package com.bean;

public class WorldSum {
	private String date;
	private String confirmed_num;
	private String cured_num;
	private String dead_num;
	private String currentt;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getConfirmed_num() {
		return confirmed_num;
	}
	public void setConfirmed_num(String confirmed_num) {
		this.confirmed_num = confirmed_num;
	}
	public String getCured_num() {
		return cured_num;
	}
	public void setCured_num(String cured_num) {
		this.cured_num = cured_num;
	}
	public String getDead_num() {
		return dead_num;
	}
	public void setDead_num(String dead_num) {
		this.dead_num = dead_num;
	}
	public String getCurrentt() {
		return currentt;
	}
	public void setCurrentt(String currentt) {
		this.currentt = currentt;
	}
	public WorldSum(String date, String confirmed_num, String cured_num, String dead_num, String currentt) {
		super();
		this.date = date;
		this.confirmed_num = confirmed_num;
		this.cured_num = cured_num;
		this.dead_num = dead_num;
		this.currentt = currentt;
	}

}
