package com.itwillbs.order.domain;

public class ItemDTO {
	private String itemNum;		// 품번
	private String itemName;	// 품명
	private String invntUnit;	// 재고단위
	
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
	public String getInvntUnit() {
		return invntUnit;
	}
	public void setInvntUnit(String invntUnit) {
		this.invntUnit = invntUnit;
	}
	
	
	@Override
	public String toString() {
		return "itemDTO [itemNum=" + itemNum + ", itemName=" + itemName + ", invntUnit=" + invntUnit + "]";
	}
	
}
