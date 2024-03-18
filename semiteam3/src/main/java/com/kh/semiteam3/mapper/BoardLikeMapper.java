package com.kh.semiteam3.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dto.BoardLikeDto;

@Service
public class BoardLikeMapper implements RowMapper<BoardLikeDto>{

	@Override
	public BoardLikeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardLikeDto boardLikeDto = new BoardLikeDto();
		boardLikeDto.setMemberId(rs.getString("member_id"));
		boardLikeDto.setBoardNo(rs.getInt("board_no"));
		return boardLikeDto;
	}

}
