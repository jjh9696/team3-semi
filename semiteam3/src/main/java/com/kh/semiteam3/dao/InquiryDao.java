package com.kh.semiteam3.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semiteam3.dto.InquiryDto;
import com.kh.semiteam3.mapper.InquiryMapper;
import com.kh.semiteam3.vo.PageVO;


@Repository
public class InquiryDao {
	

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private InquiryMapper inquiryMapper;

		// 목록
		public List<InquiryDto> selectList() {
			String sql = "select " 
						+"inquiry_no, inquiry_writer, inquiry_title, "
						+"inquiry_content, inquiry_wtime, inquiry_etime, "
						+"from inquiry order by inquiry_no desc";
			return jdbcTemplate.query(sql, inquiryMapper);
		}
		
		// 검색
		public List<InquiryDto> selectList(String column, String keyword) {
			String sql = "select " 
				+"inquiry_no, inquiry_writer, inquiry_title, " 
				+"inquiry_content, inquiry_wtime, inquiry_readcount, "
				+"from inquiry "
				+"where instr(" + column + ", ?) > 0 " 
				+"order by inquiry_no desc";
			Object[] data = { keyword };
			return jdbcTemplate.query(sql, inquiryMapper, data);
		}
		
		// 통합+페이징
		public List<InquiryDto> selectListByPaging(PageVO pageVO) {
			if (pageVO.isSearch()) {// 검색
				String sql = "select * from (" 
					+ "select rownum rn, TMP.* from (" 
					+ "select "
					+ "inquiry_no, inquiry_writer, inquiry_title, " 
					+ "inquiry_content, inquiry_wtime, inquiry_etime, "
					+ "inquiry_group, inquiry_target, inquiry_depth " 
					+ "from inquiry "
					+ "where instr(" 
					+ pageVO.getColumn()
					+ ", ?) > 0 "
					+ "connect by prior inquiry_no=inquiry_target " 
					+ "start with inquiry_target is null "
					+ "order siblings by inquiry_group desc, inquiry_no asc" 
					+ ")TMP" 
					+ ") where rn between ? and ?";

				Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
				return jdbcTemplate.query(sql, inquiryMapper, data);
			}
			else {// 목록
				String sql = "select * from (" 
					+ "select rownum rn, TMP.* from (" + "select "
					+ "inquiry_no, inquiry_writer, inquiry_title, " 
					+ "inquiry_content, inquiry_wtime, inquiry_etime, "
					+ "inquiry_group, inquiry_target, inquiry_depth " 
					+ "from inquiry "
					+ "connect by prior inquiry_no=inquiry_target " 
					+ "start with inquiry_target is null "
					+ "order siblings by inquiry_group desc, inquiry_no asc" 
					+ ")TMP" 
					+ ") where rn between ? and ?";
				Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
				return jdbcTemplate.query(sql, inquiryMapper, data);
			}
			
		}
		
		// 카운트-목록일 경우와 검색일 경우를 각각 구현
		public int count() {
			String sql = "select count(*) from inquiry";
			return jdbcTemplate.queryForObject(sql, int.class);
		}

		public int count(String column, String keyword) {
			String sql = "select count(*) from inquiry " + "where instr(" + column + ", ?)>0";
			Object[] data = { keyword };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}

		public int count(PageVO pageVO) {
			if (pageVO.isSearch()) {// 검색
				String sql = "select count(*) from inquiry " + "where instr(" + pageVO.getColumn() + ", ?) > 0";
				Object[] data = { pageVO.getKeyword() };
				return jdbcTemplate.queryForObject(sql, int.class, data);
			} else {// 목록
				String sql = "select count(*) from inquiry";
				return jdbcTemplate.queryForObject(sql, int.class);
			}
		}

		// 단일조회
		public InquiryDto selectOne(int inquiryNo) {
			String sql = "select * from Inquiry where Inquiry_no = ?";
			Object[] data = { inquiryNo };
			List<InquiryDto> list = jdbcTemplate.query(sql, inquiryMapper, data);
			return list.isEmpty() ? null : list.get(0);
		}
		
	
		// 등록할 때 시퀀스 번호를 생성하면 절대 안된다
		public void insert(InquiryDto inquiryDto) {
			String sql = "insert into inquiry(" 
				+ "inquiry_no, inquiry_writer, inquiry_title, inquiry_content, "
				+ "inquiry_group, inquiry_target, inquiry_depth" 
				+ ") " + "values(?, ?, ?, ?, ?, ?, ?)";
			Object[] data = { inquiryDto.getInquiryNo(), inquiryDto.getInquiryWriterStr(), 
					inquiryDto.getInquiryTitle(), inquiryDto.getInquiryContent(), 
					inquiryDto.getInquiryGroup(), inquiryDto.getInquiryTarget(), 
					inquiryDto.getInquiryDepth() };
			jdbcTemplate.update(sql, data);
		}
		// 삭제 메소드
		public boolean delete(int inquiryNo) {
			String sql = "delete Inquiry where inquiry_no=?";
			Object[] data = { inquiryNo };
			return jdbcTemplate.update(sql, data) > 0;
		}

		public boolean update(InquiryDto inquiryDto) {
			String sql = "update inquiry set " 
						+ "inquiry_title=?, inquiry_content=?, inquiry_etime=sysdate " 
						+ "Where inquiry_no=?";
			Object[] data = { inquiryDto.getInquiryTitle(), inquiryDto.getInquiryContent(), inquiryDto.getInquiryNo() };
			return jdbcTemplate.update(sql, data) > 0;
		}

		public int getsequence() {
			String sql = "select inquiry_seq.nextval from dual";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}