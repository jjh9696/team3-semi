package com.kh.semiteam3.dto;

import java.sql.Date;

public class ReportBoardDto {

	private int reportBoardNo; //게시글신고번호
	private String reportBoardReason; //게시글신고사유
	private int reportBoardOrigin; //게시판번호 - board_no 참조
	private String reportBoardWriter; //게시글신고자 - member_id 참조
	private Date reportBoardDate; //게시글신고날짜
	public int getReportBoardNo() {
		return reportBoardNo;
	}
	public void setReportBoardNo(int reportBoardNo) {
		this.reportBoardNo = reportBoardNo;
	}
	public String getReportBoardReason() {
		return reportBoardReason;
	}
	public void setReportBoardReason(String reportBoardReason) {
		this.reportBoardReason = reportBoardReason;
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
	public ReportBoardDto() {
		super();
	}
	
	
}
