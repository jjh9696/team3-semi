package com.kh.semiteam3.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semiteam3.dto.BoardDto;
import com.kh.semiteam3.mapper.BoardListMapper;
import com.kh.semiteam3.mapper.BoardMapper;
import com.kh.semiteam3.vo.PageVO;

@Repository
public class BoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private BoardListMapper boardListMapper;
	
	//커뮤니티 게시글 작성(등록)
	public void insert(BoardDto boardDto) {//**마감시간 처리방법 생각해보기
		//게시글번호-시퀀스/제목/내용/카테고리/작성자/마감시간
		String sql = "insert into board"
					+ "("
					+ "board_no, board_title, board_content, "
					+ "board_category, board_writer, board_limit_time"
					+ ") "
					+ "values"
					+ "(board_seq.nextval, ?, ?, ?, ?, ?)";
		Object[] data = {
				boardDto.getBoardTitle(), boardDto.getBoardContent(),
				boardDto.getBoardCategory(), boardDto.getBoardWriter(),
				boardDto.getBoardLimitTime()
		};
		jdbcTemplate.update(sql, data);
	}
	
//	//게시글 목록-카테고리 별로 띄우는법?
//	public List<BoardDto> selectList(){//번호, 제목, 작성자, 작성일, 마감일, 조회수, 찜수
//		String sql = "select "
//					+ "board_no, board_title, board_writer,"
//					+ "board_write_time, board_limit_time, "
//					+ "board_view, board_like "
//					+ "from board order by board_no desc";//어느 기준으로 정렬할지 회의
//		return jdbcTemplate.query(sql, boardListMapper);//최적화 방법(내용 x)
//	}
//	//게시글 검색
//	public List<BoardDto> selectList(String column, String keyword){//제목, 작성자, 내용 으로 검색 가능하도록
//		String sql = "select "
//				+ "board_no, board_title, board_writer, "
//				+ "board_write_time, board_limit_time, "
//				+ "board_view, board_like "
//				+ "from board "
//				+ "where instr("+column+", ?) > 0 "
//				+ "order by board_no desc";
//		Object[] data = {keyword};
//		return jdbcTemplate.query(sql, boardListMapper, data);
//	}
	
	//통합 페이징(목록 + 검색)--목록에 카테고리 띄울껀가요? 어차피 각각 나눠져서 보여질껀데
	public List<BoardDto> selectListByPaging(PageVO pageVO){
		if(pageVO.isSearch()) {//게시글 검색
			String sql = "select * from("
							+ "select rownum rn, TMP.*from("
							+ "select "
								+ "board_no, board_title, board_writer, "
								+ "board_write_time, board_limit_time, "
								+ "board_view, board_like "
							+ "from board "
							+ "where instr("+pageVO.getColumn()+", ?) > 0 "
							+ "order by board_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {
					pageVO.getKeyword(),
        			pageVO.getBeginRow(), 
        			pageVO.getEndRow()
			};
			return jdbcTemplate.query(sql, boardListMapper, data);
		}
		else {//게시글 목록--카테고리 별로 구현하는 법
			String sql = "select * from("
							+ "select rownum rn, TMP.*from("
							+ "select "
								+ "board_no, board_title, board_writer,"
								+ "board_write_time, board_limit_time, "
								+ "board_view, board_like "
							+ "from board order by board_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {
					pageVO.getBeginRow(), 
        			pageVO.getEndRow()
			};
			return jdbcTemplate.query(sql, boardListMapper, data);
		}
	}
	
	//통합 페이지 카운트(목록 + 검색)
	public int count(PageVO pageVO) {
		if(pageVO.isSearch()) {//검색
			String sql = "select count(*) from board "
					+ "where instr("+pageVO.getColumn()+", ?) > 0";
			Object[] data = {pageVO.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
		else {//목록
			String sql = "select count(*) from board";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	
	//게시글 상세 조회
	public BoardDto selectOne(int boardNo) {
		String sql = "select * from board where board_no = ?";
		Object[] data = {boardNo};
		List<BoardDto> list = jdbcTemplate.query(sql, boardMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//게시글 수정
	public boolean update(BoardDto boardDto) {//제목, 내용, 수정일, 카테고리, 마감일을 게시글 번호 뽑아서 수정~!
		String sql = "update board "
				+ "set board_title=?, board_content=?, board_edit_time=sysdate "
				+ "board_category=?, board_limit_time=? "
				+ "where board_no=?";
		Object[] data = {
				boardDto.getBoardTitle(), boardDto.getBoardContent(),
				boardDto.getBoardCategory(), boardDto.getBoardLimitTime()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//게시글 삭제
	public boolean delete(int boardNo) {
		String sql = "delete board where board_no=?";
		Object[] data = {boardNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//조회수 증가
	public boolean updateBoardView(int boardNo) {
		String sql = "update board set board_view = board_view + 1 "
				+ "where board_no=?";
		Object[] data = {boardNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
}





