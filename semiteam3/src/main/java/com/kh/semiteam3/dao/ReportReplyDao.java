package com.kh.semiteam3.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semiteam3.dto.ReportReplyDto;
import com.kh.semiteam3.mapper.ReportReplyMapper;
import com.kh.semiteam3.vo.PageVO;

@Repository
public class ReportReplyDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired  
	private ReportReplyMapper reportReplyMapper;
	
	//통합 페이징(목록 + 검색)
	public List<ReportReplyDto> selectListByPaging(PageVO pageVO){
		if(pageVO.isSearch()) {
			String sql = "select * from("
					+ "select rownum rn, TMP.*from("
					+ "select "
						+ "report_reply_no, report_reply_reason, "
						+ "reply_no, member_id, report_reply_date "
					+ "from report_reply "
					+ "where instr("+pageVO.getColumn()+", ?) > 0 "
					+ "order by report_reply_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
			Object[] data = {
                    pageVO.getKeyword(),
                    pageVO.getBeginRow(), 
                    pageVO.getEndRow()
            };
            return jdbcTemplate.query(sql, reportReplyMapper, data);
		}
		else {
			String sql = "select * from("
					+ "select rownum rn, TMP.*from("
					+ "select "
						+ "report_reply_no, report_reply_reason, "
						+ "reply_no, member_id, report_reply_date "
					+ "from report_reply "
					+ "order by report_reply_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
			Object[] data = {
                    pageVO.getBeginRow(), 
                    pageVO.getEndRow()
            };
			return jdbcTemplate.query(sql, reportReplyMapper, data);
		}
		
	}
	
	//댓글 신고 등록
	public void insert(ReportReplyDto reportReplyDto) {
		String sql = "insert into report_reply("
						+ "report_reply_no, report_reply_reason, "
						+ "reply_no, member_id "
					+ ") values(report_reply_seq.nextval, ?, ?, ?)";
		Object[] data = {
				reportReplyDto.getReportReplyNo(), 
				reportReplyDto.getReportReplyReason(), 
				reportReplyDto.getReportReplyOrigin(), 
				reportReplyDto.getReportReplyWriter()
		};
		jdbcTemplate.update(sql, data);
	}
	
	//삭제
	public boolean delete(int reportReplyNo) {
		String sql = "delete report_reply where report_reply_no = ?";
		Object[] data = {reportReplyNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
}
