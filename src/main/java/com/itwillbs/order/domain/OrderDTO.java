package com.itwillbs.order.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderDTO {
	private int ord_id; 		 // auto_increament 수주관리 기본키
	private int clnt_id; 		 // FK 거래처정보 기본키
	private int user_id;  		 // FK 사용자관리 기본키
	private Date order_dt; 		 // 수주일자  
	private Date dlvry_dt; 		 // 납품예정일
	private int csmtr_ord_num; 	 // 고객수주번호
	private String ord_num; 	 // 수주번호
	private String insert_id; 	 // 등록자
	private Timestamp insert_dt; // 등록일
	private String update_id; 	 // 변경자 
	private Timestamp update_dt; // 변경일
	
	public int getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}
	public int getClnt_id() {
		return clnt_id;
	}
	public void setClnt_id(int clnt_id) {
		this.clnt_id = clnt_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(Date order_dt) {
		this.order_dt = order_dt;
	}
	public Date getDlvry_dt() {
		return dlvry_dt;
	}
	public void setDlvry_dt(Date dlvry_dt) {
		this.dlvry_dt = dlvry_dt;
	}
	public int getCsmtr_ord_num() {
		return csmtr_ord_num;
	}
	public void setCsmtr_ord_num(int csmtr_ord_num) {
		this.csmtr_ord_num = csmtr_ord_num;
	}
	public String getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(String ord_num) {
		this.ord_num = ord_num;
	}
	public String getInsert_id() {
		return insert_id;
	}
	public void setInsert_id(String insert_id) {
		this.insert_id = insert_id;
	}
	public Timestamp getInsert_dt() {
		return insert_dt;
	}
	public void setInsert_dt(Timestamp insert_dt) {
		this.insert_dt = insert_dt;
	}
	public String getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}
	public Timestamp getUpdate_dt() {
		return update_dt;
	}
	public void setUpdate_dt(Timestamp update_dt) {
		this.update_dt = update_dt;
	}
	
}
