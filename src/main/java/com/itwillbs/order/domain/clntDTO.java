package com.itwillbs.order.domain;

public class clntDTO {
	private String clntCd;		
	private String clntNm;	

	
	
	public String getClntCd() {
		return clntCd;
	}



	public void setClntCd(String clntCd) {
		this.clntCd = clntCd;
	}



	



	public String getClntNm() {
		return clntNm;
	}



	public void setClntNm(String clntNm) {
		this.clntNm = clntNm;
	}



	@Override
	public String toString() {
		return "clntDTO [clntCd=" + clntCd + ", clntName=" + clntNm + "]";
	}
	
}
