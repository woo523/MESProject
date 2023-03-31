package com.itwillbs.order.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderDTO {
	private int ordId; 		 // auto_increament ��二쇨�由� 湲곕낯��
	private int clntId; 		 // FK 嫄곕��泥���蹂� 湲곕낯��
	private int userId;  		 // FK �ъ�⑹��愿�由� 湲곕낯��
	private Date orderDt; 		 // ��二쇱�쇱��  
	private Date dlvryDt; 		 // �⑺��������
	private String ordNum; 	 // ��二쇰���
	private String insertId; 	 // �깅���
	private Timestamp insertDt; // �깅���
	private String updateId; 	 // 蹂�寃쎌�� 
	private Timestamp updateDt; // 蹂�寃쎌��
	
	private int ordInfo;
	private int itemId;
	private int ordQty;
	private String cmpltYn;
	private String note;
	
	private String clntNm;
	private String userNm;
	private String userNum;
	private String itemNm;
	private String invntUnit;
	
	public int getOrdId() {
		return ordId;
	}
	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}
	public int getClntId() {
		return clntId;
	}
	public void setClntId(int clntId) {
		this.clntId = clntId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getOrderDt() {
		return orderDt;
	}
	public void setOrderDt(Date orderDt) {
		this.orderDt = orderDt;
	}
	public Date getDlvryDt() {
		return dlvryDt;
	}
	public void setDlvryDt(Date dlvryDt) {
		this.dlvryDt = dlvryDt;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public Timestamp getInsertDt() {
		return insertDt;
	}
	public void setInsertDt(Timestamp insertDt) {
		this.insertDt = insertDt;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public Timestamp getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(Timestamp updateDt) {
		this.updateDt = updateDt;
	}
	public int getOrdInfo() {
		return ordInfo;
	}
	public void setOrdInfo(int ordInfo) {
		this.ordInfo = ordInfo;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}
	public String getCmpltYn() {
		return cmpltYn;
	}
	public void setCmpltYn(String cmpltYn) {
		this.cmpltYn = cmpltYn;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getClntNm() {
		return clntNm;
	}
	public void setClntNm(String clntNm) {
		this.clntNm = clntNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getItemNm() {
		return itemNm;
	}
	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	 
	
	

}
