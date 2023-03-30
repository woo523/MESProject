package com.itwillbs.order.domain;

public class userDTO {
	private String userNum;		
	private String userName;	
	private int userId;

	
	public String getUserNum() {
		return userNum;
	}


	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "userDTO [userNum=" + userNum + ", userName=" + userName + "]";
	}
	
}
