package com.itwillbs.line.domain;

import java.sql.Timestamp;

public class LineDTO {
	private int lineId;		// 라인
	private String lineCode;	// 라인코드
	private String lineName;	// 라인명
	private String proCode;		// 공정코드
	private String linePlace;	// 작업장
	private int sortOrder;		// 정렬순서
	private String useChoice;	// 사용여부
	private String note;		// 비고
	private String insertId;	// 등록자
	private Timestamp insertDate;	// 등록일
	
	
	public int getLineId() {
		return lineId;
	}
	public void setLineId(int lineId) {
		this.lineId = lineId;
	}
	public String getLineCode() {
		return lineCode;
	}
	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getLinePlace() {
		return linePlace;
	}
	public void setLinePlace(String linePlace) {
		this.linePlace = linePlace;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getUseChoice() {
		return useChoice;
	}
	public void setUseChoice(String useChoice) {
		this.useChoice = useChoice;
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
	
	
	@Override
	public String toString() {
		return "LineDTO [lineId=" + lineId + ", lineCode=" + lineCode + ", lineName=" + lineName + ", proCode="
				+ proCode + ", linePlace=" + linePlace + ", sortOrder=" + sortOrder + ", useChoice=" + useChoice
				+ ", note=" + note + ", insertId=" + insertId + ", insertDate=" + insertDate + "]";
	}
	

}
