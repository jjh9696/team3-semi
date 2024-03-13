package com.kh.semiteam3.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semiteam3.dto.BoardDto;
import com.kh.semiteam3.dto.MemberDto;
import com.kh.semiteam3.dto.ReportBoardDto;
import com.kh.semiteam3.mapper.ReportBoardMapper;
import com.kh.semiteam3.vo.PageVO;

@Repository
public class ReportBoardDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired  
	private ReportBoardMapper reportBoardMapper;
	
	//통합 페이징(목록 + 검색)
	public List<ReportBoardDto> selectListByPaging(PageVO pageVO){
		if(pageVO.isSearch()) {
			String sql = "select * from("
					+ "select rownum rn, TMP.*from("
					+ "select "
						+ "report_board_no, report_board_content, "
						+ "board_no, member_id, report_board_date, "
						+ "report_board_reason "
					+ "from report_board "
					+ "where instr("+pageVO.getColumn()+", ?) >0 "
					+ "order by report_board_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
			Object[] data = {
                    pageVO.getKeyword(),
                    pageVO.getBeginRow(), 
                    pageVO.getEndRow()
            };
			 return jdbcTemplate.query(sql, reportBoardMapper, data);
		}
		else {
			String sql = "select * from("
					+ "select rownum rn, TMP.*from("
					+ "select "
						+ "report_board_no, report_board_content, "
						+ "board_no, member_id, report_board_date, "
						+ "report_board_reason "
					+ "from report_board "
					+ "order by report_board_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
			Object[] data = {
                    pageVO.getBeginRow(), 
                    pageVO.getEndRow()
            };
			return jdbcTemplate.query(sql, reportBoardMapper, data);
		
		}
	}
	
	//통합 페이지 카운트(목록 + 검색)
		public int count(PageVO pageVO) {
			if(pageVO.isSearch()) {//검색
				String sql = "select count(*) from report_board "
						+ "where instr("+pageVO.getColumn()+", ?) > 0";
				Object[] data = {pageVO.getKeyword()};
				return jdbcTemplate.queryForObject(sql, int.class, data);
			}
			else {//목록
				String sql = "select count(*) from report_board";
				return jdbcTemplate.queryForObject(sql, int.class);
			}
		}
					
	//게시글 신고 등록
	public void insert(ReportBoardDto reportBoardDto) {
		String sql = "insert into report_board("
						+ "report_board_no, report_board_content, "
						+ "board_no, member_id, report_board_reason "
					+ ") values(report_board_seq.nextval, ?, ?, ?, ?)";
		Object[] data = {
				reportBoardDto.getReportBoardContent(), 
				reportBoardDto.getReportBoardNo(), 
				reportBoardDto.getReportBoardOrigin(), 
				reportBoardDto.getReportBoardWriter(),
				reportBoardDto.getReportBoardReason() 
		};
		jdbcTemplate.update(sql, data);
	}
	
	//삭제
	public boolean delete(int reportBoardNo) {
		String sql = "delete report_board where report_board_no = ?";
		Object[] data = {reportBoardNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//상세 조회
	public ReportBoardDto selectOne(int reportBoardNo) {
		String sql = "select * from report_board where report_board_no = ?";
		Object[] data = {reportBoardNo};
		List<ReportBoardDto> list = jdbcTemplate.query(sql, reportBoardMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
}	
