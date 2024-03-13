package com.kh.semiteam3.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDao {

	@Autowired 
	private JdbcTemplate jdbcTemplate;
	
	public void insert(String memberId, String reportMemberId) {//어느 회원이 누구한테 신고 당했나
		String sql = "insert into report_member(member_id, member_id) values(?,?)";
		Object[] data = {memberId, reportMemberId};
		jdbcTemplate.update(sql, data);
	}
	public boolean delete(String memberId, String reportMemberId) {
		String sql = "delete report_member where member_id = ? and report_member_id = ?";
		Object[] data = {memberId, reportMemberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	public boolean check(String memberId, String reportMemberId) {//신고 했는지 안했는지 확인
		String sql = "select count(*) from report_member "
				+ "where member_id = ? and report_member_id = ?";//신고x=0 신고o=1
		Object[] data = {memberId, reportMemberId};
		int count = jdbcTemplate.queryForObject(sql, int.class,data);
		return count > 0;//0보다 크면 신고 한거
	}
	
	public int count(String reportMemberId) {//신고한 회원 몇명
		String sql = "select count(*) from report_member where report_member_id = ?";
		Object[] data = {reportMemberId};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
}
