package com.itwillbs.work.domain;



public class PerformRgDTO {
	private String itemNum;
	private String itemName;
	private String performDate;
	private String gbYn;
	private int performQty;
	private String dbReason;
	
	public String getPerformDate() {
		return performDate;
	}
	public void setPerformDate(String performDate) {
		this.performDate = performDate;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
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
	
	
}
