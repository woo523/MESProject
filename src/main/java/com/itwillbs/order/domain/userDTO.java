package com.itwillbs.order.domain;

public class userDTO {
	private String userNum;		// 품번
	private String userName;	// 품명
//	private String invntUnit;	// 재고단위
	
	public String getuserNum() {
		return userNum;
	}
	public void setuserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
//	public String getInvntUnit() {
//		return invntUnit;
//	}
//	public void setInvntUnit(String invntUnit) {
//		this.invntUnit = invntUnit;
//	}
	
	
	@Override
	public String toString() {
		return "userDTO [userNum=" + userNum + ", userName=" + userName + "]";
	}
	
}
