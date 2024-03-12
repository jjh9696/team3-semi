package com.kh.semiteam3.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dto.BoardDto;

@Service
public class BoardListMapper implements RowMapper<BoardDto>{//boardContent 없는 Mapper

	@Override
	public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardNo(rs.getInt("board_no"));
		boardDto.setBoardTitle(rs.getString("board_title"));
		boardDto.setBoardView(rs.getInt("board_view"));
		boardDto.setBoardLike(rs.getInt("board_like"));
		boardDto.setBoardWriteTime(rs.getDate("board_write_time"));
		boardDto.setBoardWriter(rs.getString("board_writer"));
		boardDto.setBoardLimitTime(rs.getDate("board_limit_time"));
		return boardDto;
	}

}
//		boardDto.setBoardContent(rs.getString("board_content"));
//		boardDto.setBoardReply(rs.getInt("board_reply"));
//		boardDto.setBoardReport(rs.getInt("board_report"));
//		boardDto.setBoardEditTime(rs.getDate("board_edit_time"));
//		boardDto.setBoardCategory(rs.getString("board_category"));
