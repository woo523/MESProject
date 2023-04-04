package com.itwillbs.work.domain;

import java.sql.Timestamp;

import com.itwillbs.line.domain.LineDTO;
import com.itwillbs.work.domain.ItemDTO;
import com.itwillbs.order.domain.clntDTO;

public class InstructDTO {
	private int instrId;	// 작업지시 기본키
	private int lineId;		// 라인정보 기본키
	private int ordId;		// 수주관리 기본키
	private int ordInfoId;	// 수주정보 기본키
	private int itemId;		// 품목관리 기본키
	private String workNum;	// 작업지시번호
	private String workSts;	// 지시상태
	private String workDate;	// 지시일자
	private int workQty;	// 지시수량
	private String insertId;	// 등록자
	private Timestamp insertDate;	// 등록일
	
	// InstructDTO : DTO = 1 : n 관계
	private LineDTO lineDTO;
	private ItemDTO itemDTO;
	private clntDTO clntDTO;

	public int getInstrId() {
		return instrId;
	}
	public void setInstrId(int instrId) {
		this.instrId = instrId;
	}
	public int getLineId() {
		return lineId;
	}
	public void setLineId(int lineId) {
		this.lineId = lineId;
	}
	public int getOrdId() {
		return ordId;
	}
	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}
	public int getOrdInfoId() {
		return ordInfoId;
	}
	public void setOrdInfoId(int ordInfoId) {
		this.ordInfoId = ordInfoId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getWorkNum() {
		return workNum;
	}
	public void setWorkNum(String workNum) {
		this.workNum = workNum;
	}
	public String getWorkSts() {
		return workSts;
	}
	public void setWorkSts(String workSts) {
		this.workSts = workSts;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public int getWorkQty() {
		return workQty;
	}
	public void setWorkQty(int workQty) {
		this.workQty = workQty;
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
	
	// 1:n 관계
	public LineDTO getLineDTO() {
		return lineDTO;
	}
	public void setLineDTO(LineDTO lineDTO) {
		this.lineDTO = lineDTO;
	}
	public ItemDTO getItemDTO() {
		return itemDTO;
	}
	public void setItemDTO(ItemDTO itemDTO) {
		this.itemDTO = itemDTO;
	}
	public clntDTO getClntDTO() {
		return clntDTO;
	}
	public void setClntDTO(clntDTO clntDTO) {
		this.clntDTO = clntDTO;
	}

}
