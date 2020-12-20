package com.bean;

public class Togetcher {
		private String tripDepname;
		private String tripDate;
		private String tripArrname;
		private String carriage;
		private String seatNo;
		private String tripMemo;
		public String getTripDepname() {
			return tripDepname;
		}
		public void setTripDepname(String tripDepname) {
			this.tripDepname = tripDepname;
		}
		public String gettripDate() {
			return tripDate;
		}
		public void settripDate(String tripDate) {
			this.tripDate = tripDate;
		}
		public String getTripArrname() {
			return tripArrname;
		}
		public void setTripArrname(String tripArrname) {
			this.tripArrname = tripArrname;
		}
		public String getCarriage() {
			return carriage;
		}
		public void setCarriage(String carriage) {
			this.carriage = carriage;
		}
		public String getSeatNo() {
			return seatNo;
		}
		public void setSeatNo(String seatNo) {
			this.seatNo = seatNo;
		}
		public String gettripMemo() {
			return tripMemo;
		}
		public void settripMemo(String tripMemo) {
			this.tripMemo = tripMemo;
		}
		public Togetcher(String tripDepname, String tripDate, String tripArrname, String carriage, String seatNo,
				String tripMemo) {
			this.tripDepname = tripDepname;
			this.tripDate = tripDate;
			this.tripArrname = tripArrname;
			this.carriage = carriage;
			this.seatNo = seatNo;
			this.tripMemo = tripMemo;
		}
}
