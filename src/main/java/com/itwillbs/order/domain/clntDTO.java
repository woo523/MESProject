package com.itwillbs.order.domain;

public class clntDTO {
	private String clntCd;		
	private String clntName;	

	
	
	public String getClntCd() {
		return clntCd;
	}



	public void setClntCd(String clntCd) {
		this.clntCd = clntCd;
	}



	public String getClntName() {
		return clntName;
	}



	public void setClntName(String clntName) {
		this.clntName = clntName;
	}



	@Override
	public String toString() {
		return "clntDTO [clntCd=" + clntCd + ", clntName=" + clntName + "]";
	}
	
}
