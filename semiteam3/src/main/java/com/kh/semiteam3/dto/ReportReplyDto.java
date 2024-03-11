package com.kh.semiteam3.dto;

import java.sql.Date;

public class ReportReplyDto {
	
	private int reportReplyNo; //댓글신고번호
	private String reportReplyReason; //댓글신고사유
	private int reportReplyOrigin; //댓글번호 - reply_no 참조
	private String reportReplyWriter; //댓글신고자 - member_id 참조
	private Date reportReplyDate; //댓글신고날짜
	
	public int getReportReplyNo() {
		return reportReplyNo;
	}
	public void setReportReplyNo(int reportReplyNo) {
		this.reportReplyNo = reportReplyNo;
	}
	public String getReportReplyReason() {
		return reportReplyReason;
	}
	public void setReportReplyReason(String reportReplyReason) {
		this.reportReplyReason = reportReplyReason;
	}
	public int getReportReplyOrigin() {
		return reportReplyOrigin;
	}
	public void setReportReplyOrigin(int reportReplyOrigin) {
		this.reportReplyOrigin = reportReplyOrigin;
	}
	public String getReportReplyWriter() {
		return reportReplyWriter;
	}
	public void setReportReplyWriter(String reportReplyWriter) {
		this.reportReplyWriter = reportReplyWriter;
	}
	public Date getReportReplyDate() {
		return reportReplyDate;
	}
	public void setReportReplyDate(Date reportReplyDate) {
		this.reportReplyDate = reportReplyDate;
	}
	public ReportReplyDto() {
		super();
	}
	
	
} 
