package com.itwillbs.mdm.domain;

import java.sql.Timestamp;

public class ItemDTO {
	private int itemId; //품목정보id
	private int clntId; //거래처id
	private String clntName; //거래처id
	private String itemNum; //품번
	private String itemName; //품명
	private String mtrlType; //자재유형
	private String mtrlSort; //자재구분
	private String invntUnit; //재고단위
	private String invntQlt; //재질
	private String standard; //규격
	private String useYn; //사용여부
	private int salePrice; //매출단가
	private int buyPrice; //매입단가
	private String note; //비고
	private String insertId; //등록일
	private Timestamp insertDate; //등록자
	private String updateId; //변경일
	private Timestamp updateDate; //변경자
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
	public String getMtrlType() {
		return mtrlType;
	}
	public void setMtrlType(String mtrlType) {
		this.mtrlType = mtrlType;
	}
	public String getMtrlSort() {
		return mtrlSort;
	}
	public void setMtrlSort(String mtrlSort) {
		this.mtrlSort = mtrlSort;
	}
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	public String getInvntQlt() {
		return invntQlt;
	}
	public void setInvntQlt(String invntQlt) {
		this.invntQlt = invntQlt;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
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
	public String getClntName() {
		return clntName;
	}
	public void setClntName(String clntName) {
		this.clntName = clntName;
	}
	
	
	
	
	
}
