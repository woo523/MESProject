package com.itwillbs.material.domain;

public class ClientDTO {
	private String clientCode;	// 거래처코드
	private String clientName;	// 거래처명
	private int bsnsNum; 		// 사업자번호
	
	public String getClientCode() {
		return clientCode;
	}
	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public int getBsnsNum() {
		return bsnsNum;
	}
	public void setBsnsNum(int bsnsNum) {
		this.bsnsNum = bsnsNum;
	}

	@Override
	public String toString() {
		return "clientDTO [clientCode=" + clientCode + ", clientName=" + clientName + ", bsnsNum=" + bsnsNum + "]";
	}

	
}
