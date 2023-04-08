package com.itwillbs.auth.domain;

import java.sql.Date;

public class AuthDTO {
	
	private int authId; // 권한번호
	private int userId; // 사용자번호
	private int menuCd; // 메뉴코드
	private String viewYn; //사용여부
	private String insertId; //등록자
	private Date insertDt; //등록일
	private String updateId; //수정자
	private Date updateDt; //수정일
	
	public int getAuthId() {
		return authId;
	}
	public void setAuthId(int authId) {
		this.authId = authId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(int menuCd) {
		this.menuCd = menuCd;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
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
	
}
