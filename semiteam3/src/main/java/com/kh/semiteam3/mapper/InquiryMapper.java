package com.kh.semiteam3.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dto.InquiryDto;

@Service
public class InquiryMapper implements RowMapper<InquiryDto>{
	
	@Override
	public InquiryDto mapRow(ResultSet rs, int rowNum) throws SQLException{
		InquiryDto inquiryDto = new InquiryDto();
		inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
		inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
		inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
		inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
		inquiryDto.setInquiryWtime(rs.getDate("inquiry_wtime"));
		inquiryDto.setInquiryEtime(rs.getDate("inquiry_etime"));
		inquiryDto.setInquiryGroup(rs.getInt("inquiry_group"));
		inquiryDto.setInquiryTarget(rs.getObject("inquiry_target", Integer.class));
		inquiryDto.setInquiryDepth(rs.getInt("inquiry_depth"));
		
		
		return inquiryDto;
	}

}
