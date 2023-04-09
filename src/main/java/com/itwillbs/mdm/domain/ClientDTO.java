package com.itwillbs.mdm.domain;

import java.sql.Timestamp;

public class ClientDTO {
	private int clntId; //거래처id
	private String clntCode; //거래처코드
	private String clntName; //거래처명
	private String clntType; //거래처구분
	private String bsnsNum; //사업자번호
	private String industry; //업태
	private String event; //종목
	private String daepyo; //대표자
	private String manager; //담당자
	private String zipCode; //우편번호
	private String address; //주소
	private String addrDtl; //상세주소
	private String tell; //전화번호
	private String phone; //휴대폰번호
	private String fax; //팩스번호
	private String email; //이메일번호
	private String useYn; //사용여부
	private String note; //비고
	private String insertId; //등록자
	private Timestamp insertDate; //등록일
	private String updateId; //변경자
	private Timestamp updateDate; //변경일
	public int getClntId() {
		return clntId;
	}
	public void setClntId(int clntId) {
		this.clntId = clntId;
	}
	public String getClntCode() {
		return clntCode;
	}
	public void setClntCode(String clntCode) {
		this.clntCode = clntCode;
	}
	public String getClntName() {
		return clntName;
	}
	public void setClntName(String clntName) {
		this.clntName = clntName;
	}
	public String getClntType() {
		return clntType;
	}
	public void setClntType(String clntType) {
		this.clntType = clntType;
	}
	public String getBsnsNum() {
		return bsnsNum;
	}
	public void setBsnsNum(String bsnsNum) {
		this.bsnsNum = bsnsNum;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDaepyo() {
		return daepyo;
	}
	public void setDaepyo(String daepyo) {
		this.daepyo = daepyo;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
