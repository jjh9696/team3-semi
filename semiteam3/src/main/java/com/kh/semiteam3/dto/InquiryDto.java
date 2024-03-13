package com.kh.semiteam3.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class InquiryDto {

	
	private int inquiryNo;
	private String inquiryWriter;
	private String inquiryTitle;
	private String inquiryContent;
	private Date inquiryWtime;
	private Date inquiryEtime;
	private int inquiryGroup;
	private Integer inquiryTarget;
	public InquiryDto() {
		super();
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getInquiryWriter() {
		return inquiryWriter;
	}
	public void setInquiryWriter(String inquiryWriter) {
		this.inquiryWriter = inquiryWriter;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public Date getInquiryWtime() {
		return inquiryWtime;
	}
	public void setInquiryWtime(Date inquiryWtime) {
		this.inquiryWtime = inquiryWtime;
	}
	public Date getInquiryEtime() {
		return inquiryEtime;
	}
	public void setInquiryEtime(Date inquiryEtime) {
		this.inquiryEtime = inquiryEtime;
	}
	public int getInquiryGroup() {
		return inquiryGroup;
	}
	public void setInquiryGroup(int inquiryGroup) {
		this.inquiryGroup = inquiryGroup;
	}
	public Integer getInquiryTarget() {
		return inquiryTarget;
	}
	public void setInquiryTarget(Integer inquiryTarget) {
		this.inquiryTarget = inquiryTarget;
	}
	public int getInquiryDepth() {
		return inquiryDepth;
	}
	public void setInquiryDepth(int inquiryDepth) {
		this.inquiryDepth = inquiryDepth;
	}
	private int inquiryDepth;
	
	public String getInquiryWriterStr() {
		if(inquiryWriter == null) {
			return "탈퇴한사용자";
	}
		else {
			return inquiryWriter;
		}
	}
	
	public String getInquiryWtimeStr() {
		LocalDate today = LocalDate.now();//오늘날짜
		LocalDate wtime = inquiryWtime.toLocalDate();//작성일자
		if(wtime.equals(today)) {//작성일이 오늘이면
			//Date->Timestamp->LocalDateTime->LocalTime
			Timestamp stamp = new Timestamp(inquiryWtime.getTime());
			LocalDateTime time = stamp.toLocalDateTime();
			LocalTime result = time.toLocalTime();
			return result.toString();//시간반환
		}
		else {//작성일이 이전이면
			return wtime.toString();//날짜반환
		}
	}
	
	
	//현재시각을 기준으로 얼마나 지난 글인지를 계산하여 반환
	public String getinquiryWtimeDiff() {
		long now = System.currentTimeMillis();
		long before = inquiryWtime.getTime();
		long gap = now - before;
		gap /= 1000;//초로 변경
		
		if(gap <60) {//1분 미만은 방금 전으로 표시
			return "방금 전";
		}
		else if(gap < 60 * 60) {//1시간 미만은 분으로 표시
			return gap / 60 + "분 전";
		}
		else if(gap < 24 * 60 *60) {//1일 미만은 시간으로 표시
			return gap / 60 / 60 + "시간 전";
		}
		else if(gap <7 * 24 * 60 * 60) {//7일 미만은 일료 표시
			return gap / 24 /60 / 60 + "일 전";
		}
		else if(gap < 30 * 24 * 60 * 60) {//한달 미만은 주로 표시
			return gap / 7 / 24 / 60 / 60 + "주 전";
		}
		else if(gap < 1 * 365 * 24 * 60 * 60) {//1년 미만은 개월로 표시
			return gap / 30 / 24 / 60 / 60 + "개월 전";
		}
		else if(gap < 10 * 365 * 24 * 60 * 60) {//10년 미만은 연으로 표시
			return gap / 365 / 24 / 60 / 60 + "개월 전";
		}
		else {//나머지는 오래전으로 표시
			return "오래 전"; 
		}
	}


	

}
