package com.itwillbs.mdm.domain;

import java.sql.Timestamp;

public class EquipDTO {
	private int equpId; //설비id
	private String equpCode; //설비코드
	private String equpName; //설비명
	private String equpType; //설비유형
	private String poNum; //구매처
	private String poDate; //구매일
	private int poAmount; //구매금액
	private String useYn; //사용여부
	private String equpStat; //설비상태
	private String insertId; //등록자
	private Timestamp insertDate; //등록일
	private String updateId; //변경자
	private Timestamp updateDate; //변경일
	public int getEqupId() {
		return equpId;
	}
	public void setEqupId(int equpId) {
		this.equpId = equpId;
	}
	public String getEqupCode() {
		return equpCode;
	}
	public void setEqupCode(String equpCode) {
		this.equpCode = equpCode;
	}
	public String getEqupName() {
		return equpName;
	}
	public void setEqupName(String equpName) {
		this.equpName = equpName;
	}
	public String getEqupType() {
		return equpType;
	}
	public void setEqupType(String equpType) {
		this.equpType = equpType;
	}
	public String getPoNum() {
		return poNum;
	}
	public void setPoNum(String poNum) {
		this.poNum = poNum;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}
	public int getPoAmount() {
		return poAmount;
	}
	public void setPoAmount(int poAmount) {
		this.poAmount = poAmount;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getEqupStat() {
		return equpStat;
	}
	public void setEqupStat(String equpStat) {
		this.equpStat = equpStat;
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