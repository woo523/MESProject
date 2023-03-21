package com.itwillbs.material.domain;

import java.sql.Timestamp;

public class InmaterialDTO {
	private int inmtrlId;	// 자재입고 기본키
	private int itemId;		// 품목관리 기본키
	private int clntId;		// 거래처정보 기본키
	private String inmtrlNum;	// 입고번호
	private Timestamp inmtrlDt;		// 입고일자
	private int inmtrlQty;	// 입고수량
	private int inmtrlLot;	// 입고
//	private String whouse;	// 입고창고
//	private int curStock;	// 현재고
//	private int realQty;	// 실사량
	private String note;	// 비고
	private String insertId;	// 등록자
	private Timestamp insertDt;	// 등록일
	private String updateId; // 변경한 사람
	private Timestamp updateDt; // 변경일
	
	public int getInmtrlId() {
		return inmtrlId;
	}
	public void setInmtrlId(int inmtrlId) {
		this.inmtrlId = inmtrlId;
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
	public String getInmtrlNum() {
		return inmtrlNum;
	}
	public void setInmtrlNum(String inmtrlNum) {
		this.inmtrlNum = inmtrlNum;
	}
	public Timestamp getInmtrlDt() {
		return inmtrlDt;
	}
	public void setInmtrlDt(Timestamp inmtrlDt) {
		this.inmtrlDt = inmtrlDt;
	}
	public int getInmtrlQty() {
		return inmtrlQty;
	}
	public void setInmtrlQty(int inmtrlQty) {
		this.inmtrlQty = inmtrlQty;
	}
	public int getInmtrlLot() {
		return inmtrlLot;
	}
	public void setInmtrlLot(int inmtrlLot) {
		this.inmtrlLot = inmtrlLot;
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
