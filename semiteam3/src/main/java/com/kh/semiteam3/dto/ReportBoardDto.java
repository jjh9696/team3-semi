package com.kh.semiteam3.dto;

import java.sql.Date;

public class ReportBoardDto {

	private int reportBoardNo; //게시글신고번호
	private String reportBoardContent; //게시글신고내용
	private int reportBoardOrigin; //게시판번호 - board_no 참조
	private String reportBoardWriter; //게시글신고자 - member_id 참조
	private Date reportBoardDate; //게시글신고날짜
	private String reportBoardReason; //게시글신고사유
	
	public int getReportBoardNo() {
		return reportBoardNo;
	}
	public void setReportBoardNo(int reportBoardNo) {
		this.reportBoardNo = reportBoardNo;
	}
	public String getReportBoardContent() {
		return reportBoardContent;
	}
	public void setReportBoardContent(String reportBoardContent) {
		this.reportBoardContent = reportBoardContent;
	}
	public int getReportBoardOrigin() {
		return reportBoardOrigin;
	}
	public void setReportBoardOrigin(int reportBoardOrigin) {
		this.reportBoardOrigin = reportBoardOrigin;
	}
	public String getReportBoardWriter() {
		return reportBoardWriter;
	}
	public void setReportBoardWriter(String reportBoardWriter) {
		this.reportBoardWriter = reportBoardWriter;
	}
	public Date getReportBoardDate() {
		return reportBoardDate;
	}
	public void setReportBoardDate(Date reportBoardDate) {
		this.reportBoardDate = reportBoardDate;
	}
	public String getReportBoardReason() {
		return reportBoardReason;
	}
	public void setReportBoardReason(String reportBoardReason) {
		this.reportBoardReason = reportBoardReason;
	}
	public ReportBoardDto() {
		super();
	}
	
	//작성자 없을경우 처리하는 게터 메소드 
	public String getReportBoardWriterStr() {
		if(reportBoardWriter == null) {
			return "탈퇴한사용자";
		}
		else {
			return reportBoardWriter;
		}
	}
	
	
}
