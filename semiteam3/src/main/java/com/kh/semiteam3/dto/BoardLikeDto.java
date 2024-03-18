package com.kh.semiteam3.dto;

public class BoardLikeDto {
	private String memberId;
	private int boardNo;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public BoardLikeDto() {
		super();
	}
	
}
