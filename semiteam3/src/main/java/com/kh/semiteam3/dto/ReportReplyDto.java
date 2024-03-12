package com.kh.semiteam3.dto;

import java.sql.Date;

public class ReportReplyDto {
	
	private int reportReplyNo; //댓글신고번호
	private String reportReplyContent; //댓글신고내용
	private int reportReplyOrigin; //댓글번호 - reply_no 참조
	private String reportReplyWriter; //댓글신고자 - member_id 참조
	private Date reportReplyDate; //댓글신고날짜
	private String reportReplyReason; //댓글신고사유
	
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
	public String getReportReplyContent() {
		return reportReplyContent;
	}
	public void setReportReplyContent(String reportReplyContent) {
		this.reportReplyContent = reportReplyContent;
	}
	public ReportReplyDto() {
		super();
	}
	
	//작성자 없을경우 처리하는 게터 메소드 
	public String getreportReplyWriterStr() {
		if(reportReplyWriter == null) {
			return "탈퇴한사용자";
		}
		else {
			return reportReplyWriter;
		}
	}
	
	
} 
