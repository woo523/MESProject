package com.itwillbs.ship.domain;

import java.sql.Timestamp;

public class ShipDTO {
	private int shipId;						// 출하관리 기본키
	private int ordId;						// 수주관리 기본키
	private int ordInfoId;				// 수주정보 기본키
	private int shipQty;					// 출하량
	private Timestamp shipDt;		// 출하일자
	private String shipNum;			// 출하번호
	private String barcord;				// 바코드
	private String insertId;				// 등록자
	private Timestamp insertDt;		// 등록일
	private String updateId;			// 변경자
	private Timestamp updateDt;	// 변경일
	public int getShipId() {
		return shipId;
	}
	public void setShipId(int shipId) {
		this.shipId = shipId;
	}
	public int getOrdId() {
		return ordId;
	}
	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}
	public int getOrdInfoId() {
		return ordInfoId;
	}
	public void setOrdInfoId(int ordInfoId) {
		this.ordInfoId = ordInfoId;
	}
	public int getShipQty() {
		return shipQty;
	}
	public void setShipQty(int shipQty) {
		this.shipQty = shipQty;
	}
	public Timestamp getShipDt() {
		return shipDt;
	}
	public void setShipDt(Timestamp shipDt) {
		this.shipDt = shipDt;
	}
	public String getShipNum() {
		return shipNum;
	}
	public void setShipNum(String shipNum) {
		this.shipNum = shipNum;
	}
	public String getBarcord() {
		return barcord;
	}
	public void setBarcord(String barcord) {
		this.barcord = barcord;
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
