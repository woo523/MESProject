package com.itwillbs.material.domain;

import java.sql.Timestamp;

public class StockDTO {
	private int stockId;		// 창고관리 번호
	private int itemId;			// 품목관리 번호		  		
	private String whouse; 		// 창고
	private int curStock;		// 현재고
	private String insertId;	// 등록자
	private Timestamp insertDt; // 등록일
	private String updateId; 	// 변경자
	private Timestamp updateDt; // 변경일
	
	public int getStockId() {
		return stockId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getWhouse() {
		return whouse;
	}
	public void setWhouse(String whouse) {
		this.whouse = whouse;
	}
	public int getCurStock() {
		return curStock;
	}
	public void setCurStock(int curStock) {
		this.curStock = curStock;
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
