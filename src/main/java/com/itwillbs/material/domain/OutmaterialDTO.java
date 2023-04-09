package com.itwillbs.material.domain;

import java.sql.Timestamp;

public class OutmaterialDTO {
	private int outmtrlId;	// 자재출고 기본키
	private int itemId;		// 품목관리 기본키
	private int clntId;		// 거래처정보 기본키
	private String outmtrlNum;	// 출고번호
	private String outmtrlDt;	// 출고일자
	private int outmtrlQty;	// 출고수량
	private String note;	// 비고
	private String insertId;	// 등록자
	private Timestamp insertDt;	// 등록일
	private String updateId; // 변경한 사람
	private Timestamp updateDt; // 변경일
	
	public int getOutmtrlId() {
		return outmtrlId;
	}
	public void setOutmtrlId(int outmtrlId) {
		this.outmtrlId = outmtrlId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getClntId() {
		return clntId;
	}
	public void setClntId(int clntId) {
		this.clntId = clntId;
	}
	public String getOutmtrlNum() {
		return outmtrlNum;
	}
	public void setOutmtrlNum(String outmtrlNum) {
		this.outmtrlNum = outmtrlNum;
	}
	public String getOutmtrlDt() {
		return outmtrlDt;
	}
	public void setOutmtrlDt(String outmtrlDt) {
		this.outmtrlDt = outmtrlDt;
	}
	public int getOutmtrlQty() {
		return outmtrlQty;
	}
	public void setOutmtrlQty(int outmtrlQty) {
		this.outmtrlQty = outmtrlQty;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
	
}
