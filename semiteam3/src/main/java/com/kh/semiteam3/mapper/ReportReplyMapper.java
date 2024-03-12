package com.kh.semiteam3.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dto.ReportReplyDto;

@Service
public class ReportReplyMapper implements RowMapper<ReportReplyDto> {

	@Override
	public ReportReplyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReportReplyDto reportReplyDto = new ReportReplyDto();
		reportReplyDto.setReportReplyNo(rs.getInt("report_reply_no"));
		reportReplyDto.setReportReplyContent(rs.getString("report_reply_content"));
		reportReplyDto.setReportReplyOrigin(rs.getInt("reply_no"));
		reportReplyDto.setReportReplyWriter(rs.getString("member_id"));
		reportReplyDto.setReportReplyDate(rs.getDate("report_reply_date"));
		reportReplyDto.setReportReplyReason(rs.getString("report_reply_reason"));
		return reportReplyDto;
	}

}
