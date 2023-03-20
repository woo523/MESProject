package com.itwillbs.work.domain;

import java.sql.Timestamp;

public class PerformDTO { // 생산실적

	private int performId; // 생산실적 번호
	private int instrId; // 작업지시 번호
	private int lineId; // 라인정보 번호
	private int itemId; // 품목관리 번호
	private Timestamp performDate; // 실적일자
	private int inputQty; // 투입량
	private String gbYn; // 양불여부
	private int performQty; // 실적수량
	private String dbReason; // 불량사유
	private String note; // 비고
	private String insertId; // 등록한 사람
	private Timestamp insertDate; // 등록일
	private String updateId; // 변경한 사람
	private Timestamp updateDate; // 변경일
	
	public int getPerformId() {
		return performId;
	}
	public void setPerformId(int performId) {
		this.performId = performId;
	}
	public int getInstrId() {
		return instrId;
	}
	public void setInstrId(int instrId) {
		this.instrId = instrId;
	}
	public int getLineId() {
		return lineId;
	}
	public void setLineId(int lineId) {
		this.lineId = lineId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public Timestamp getPerformDate() {
		return performDate;
	}
	public void setPerformDate(Timestamp performDate) {
		this.performDate = performDate;
	}
	public int getInputQty() {
		return inputQty;
	}
	public void setInputQty(int inputQty) {
		this.inputQty = inputQty;
	}
	public String getGbYn() {
		return gbYn;
	}
	public void setGbYn(String gbYn) {
		this.gbYn = gbYn;
	}
	public int getPerformQty() {
		return performQty;
	}
	public void setPerformQty(int performQty) {
		this.performQty = performQty;
	}
	public String getDbReason() {
		return dbReason;
	}
	public void setDbReason(String dbReason) {
		this.dbReason = dbReason;
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
	public Timestamp getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Timestamp insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
