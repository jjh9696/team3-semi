package com.kh.semiteam3.vo;

public class ReportVO {
	private boolean state;
	private int count;
	
	public boolean isState() {
		return state;
	}

	public ReportVO() {
		super();
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;

	}
}
