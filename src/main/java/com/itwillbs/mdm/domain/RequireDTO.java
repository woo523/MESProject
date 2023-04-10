package com.itwillbs.mdm.domain;

import java.sql.Timestamp;

public class RequireDTO {
	private int reqId; //소요량id
	private int pItemId; //상위품목id
	private String pItemNum; //상위품목넘버
	private String pItemName; //상위품목명
	private int cItemId; //하위품목id
	private String cItemNum; //하위품목넘버
	private String cItemName; //하위품목명
	private String reqUnit; //소요량단위
	private String reqAmnt; //소요량
	private String useYn; //사용여부
	private String insertId; //등록자
	private Timestamp insertDate; //등록일
	private String updateId; //수정자
	private Timestamp updateDate; //수정일
	public int getReqId() {
		return reqId;
	}
	public void setReqId(int reqId) {
		this.reqId = reqId;
	}
	public int getpItemId() {
		return pItemId;
	}
	public void setpItemId(int pItemId) {
		this.pItemId = pItemId;
	}
	public int getcItemId() {
		return cItemId;
	}
	public void setcItemId(int cItemId) {
		this.cItemId = cItemId;
	}
	public String getReqUnit() {
		return reqUnit;
	}
	public void setReqUnit(String reqUnit) {
		this.reqUnit = reqUnit;
	}
	public String getReqAmnt() {
		return reqAmnt;
	}
	public void setReqAmnt(String reqAmnt) {
		this.reqAmnt = reqAmnt;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getpItemName() {
		return pItemName;
	}
	public void setpItemName(String pItemName) {
		this.pItemName = pItemName;
	}
	public String getcItemName() {
		return cItemName;
	}
	public void setcItemName(String cItemName) {
		this.cItemName = cItemName;
	}
	public String getpItemNum() {
		return pItemNum;
	}
	public void setpItemNum(String pItemNum) {
		this.pItemNum = pItemNum;
	}
	public String getcItemNum() {
		return cItemNum;
	}
	public void setcItemNum(String cItemNum) {
		this.cItemNum = cItemNum;
	}
	
	
}
