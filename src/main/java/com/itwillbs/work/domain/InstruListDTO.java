package com.itwillbs.work.domain;

public class InstruListDTO {

	private int instrId;	// 작업지시 기본키
	private String lineCd; // 라인코드
	private String lineName; // 라인명
	private String itemNum; // 상품번호
	private String itemName; // 상품명
	private String workSts;	// 지시상태
	private String workDate;	// 지시일자	
	private int workQty;	// 지시수량
	private String ordNum; // 수주번호
	private String ClientName; // 업체이름
	
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public int getInstrId() {
		return instrId;
	}
	public void setInstrId(int instrId) {
		this.instrId = instrId;
	}
	public String getLineCd() {
		return lineCd;
	}
	public void setLineCd(String lineCd) {
		this.lineCd = lineCd;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
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
	public String getWorkSts() {
		return workSts;
	}
	public void setWorkSts(String workSts) {
		this.workSts = workSts;
	}
	public int getWorkQty() {
		return workQty;
	}
	public void setWorkQty(int workQty) {
		this.workQty = workQty;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public String getClientName() {
		return ClientName;
	}
	public void setClientName(String clientName) {
		ClientName = clientName;
	}

	
	
}
