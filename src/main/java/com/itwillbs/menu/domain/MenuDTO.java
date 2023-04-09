package com.itwillbs.menu.domain;

import java.sql.Date;

public class MenuDTO {
	
	private int menuCd; // 메뉴코드
	private int upperMenuCd; // 상위메뉴코드
	private String menuNm; // 메뉴명
	private int sortNum; //정렬순서
	private String url; // 링크URL
	private String useYn; //사용여부
	private String note; // 비고
	private String insertId; //등록자
	private Date insertDt; //등록일
	private String updateId; //수정자
	private Date updateDt; //수정일
	
	public int getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(int menuCd) {
		this.menuCd = menuCd;
	}
	public int getUpperMenuCd() {
		return upperMenuCd;
	}
	public void setUpperMenuCd(int upperMenuCd) {
		this.upperMenuCd = upperMenuCd;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
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
	public Date getInsertDt() {
		return insertDt;
	}
	public void setInsertDt(Date insertDt) {
		this.insertDt = insertDt;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public Date getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}
//	@Override
//	public String toString() {
//		return "MenuDTO "
//				+ "[menuCd=" + menuCd + ","
//				+ "upperMenuCd=" + upperMenuCd + ","
//				+ "menuNm=" + menuNm + ","
//				+ "sortNum=" + sortNum + ","
//				+ "url="+ url + ","
//				+ "useYn=" + useYn + ","
//				+ "insertId=" + insertId + ","
//				+ "insertDt=" + insertDt + ","
//				+ "updateId=" + updateId + ","
//				+ "updateDt=" + updateDt + "]";
//	}
	
	
	
}
