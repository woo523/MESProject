package com.itwillbs.order.domain;

public class ItemDTO {
	private String itemId;		// ��踰�

	private String itemNum;		// ��踰�
	private String itemNm;	// ��紐�
	private String invntUnit;
	
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}

	
	public String getItemNm() {
		return itemNm;
	}
	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}
	@Override
	public String toString() {
		return "itemDTO [itemNum=" + itemNum + ", itemNm=" + itemNm 
				+ ",invntUnit=" + invntUnit + " ,itemId=" + itemId + "]";
	}
	
}
