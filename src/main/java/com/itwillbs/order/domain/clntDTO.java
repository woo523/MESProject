package com.itwillbs.order.domain;

public class clntDTO {
	private String clntCd;
	private String clntNm;
	private String clntId;

	public String getClntId() {
		return clntId;
	}

	public void setClntId(String clntId) {
		this.clntId = clntId;
	}

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
		return "clntDTO [clntCd=" + clntCd + ", clntNm=" + clntNm + ", clntId=" + clntId + "]";

	}

}
