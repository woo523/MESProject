package com.itwillbs.order.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderDTO {
	private int ord_id; 		 // auto_increament ��二쇨�由� 湲곕낯��
	private int clnt_id; 		 // FK 嫄곕��泥���蹂� 湲곕낯��
	private int user_id;  		 // FK �ъ�⑹��愿�由� 湲곕낯��
	private Date order_dt; 		 // ��二쇱�쇱��  
	private Date dlvry_dt; 		 // �⑺��������
	private int csmtr_ord_num; 	 // 怨�媛���二쇰���
	private String ord_num; 	 // ��二쇰���
	private String insert_id; 	 // �깅���
	private Timestamp insert_dt; // �깅���
	private String update_id; 	 // 蹂�寃쎌�� 
	private Timestamp update_dt; // 蹂�寃쎌��
	
	private int ord_info;
	private int item_id;
	private int ord_qty;
	private String cmplt_yn;
	private String note;
	
	private String clnt_nm;
	private String user_nm;
	private String item_nm;
	private String invnt_unit;
	 
	
	
	public String getClnt_nm() {
		return clnt_nm;
	}
	public void setClnt_nm(String clnt_nm) {
		this.clnt_nm = clnt_nm;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getItem_nm() {
		return item_nm;
	}
	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
	}
	public String getInvnt_unit() {
		return invnt_unit;
	}
	public void setInvnt_unit(String invnt_unit) {
		this.invnt_unit = invnt_unit;
	}
	public int getOrd_info() {
		return ord_info;
	}
	public void setOrd_info(int ord_info) {
		this.ord_info = ord_info;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getOrd_qty() {
		return ord_qty;
	}
	public void setOrd_qty(int ord_qty) {
		this.ord_qty = ord_qty;
	}
	public String getCmplt_yn() {
		return cmplt_yn;
	}
	public void setCmplt_yn(String cmplt_yn) {
		this.cmplt_yn = cmplt_yn;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
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
