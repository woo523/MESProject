package com.itwillbs.order.domain;

public class userDTO {
	private String userNum;		
	private String userNm;	
	private int userId;

	
	public String getUserNum() {
		return userNum;
	}


	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}


	public String getUserNm() {
		return userNm;
	}


	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "userDTO [userNum=" + userNum + ", userNm=" + userNm + "]";
	}
	
}
