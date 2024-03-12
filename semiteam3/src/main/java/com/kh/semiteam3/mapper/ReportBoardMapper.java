package com.kh.semiteam3.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dto.ReportBoardDto;

@Service
public class ReportBoardMapper implements RowMapper<ReportBoardDto>{

	@Override
	public ReportBoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReportBoardDto reportBoardDto = new ReportBoardDto();
		reportBoardDto.setReportBoardNo(rs.getInt("report_board_no"));
		reportBoardDto.setReportBoardContent(rs.getString("report_board_content"));
		reportBoardDto.setReportBoardOrigin(rs.getInt("board_no"));
		reportBoardDto.setReportBoardWriter(rs.getString("member_id"));
		reportBoardDto.setReportBoardDate(rs.getDate("report_board_date"));
		reportBoardDto.setReportBoardReason(rs.getString("report_board_reason"));
		return reportBoardDto;
	}

}
