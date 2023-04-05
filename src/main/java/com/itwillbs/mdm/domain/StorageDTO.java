package com.itwillbs.mdm.domain;

import java.sql.Timestamp;

public class StorageDTO {
	private int storId; //창고id
	private String storCode; //창고코드
	private String storName; //창고명
	private String storType; //창고유형
	private String useYn; //사용여부
	private int itemCount; //수량
	private String insertId; //등록자
	private Timestamp insertDate; //등록일
	private String updateId; //변경자
	private Timestamp updateDate; //변경일
	public int getStorId() {
		return storId;
	}
	public void setStorId(int storId) {
		this.storId = storId;
	}
	public String getStorCode() {
		return storCode;
	}
	public void setStorCode(String storCode) {
		this.storCode = storCode;
	}
	public String getStorName() {
		return storName;
	}
	public void setStorName(String storName) {
		this.storName = storName;
	}
	public String getStorType() {
		return storType;
	}
	public void setStorType(String storType) {
		this.storType = storType;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
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