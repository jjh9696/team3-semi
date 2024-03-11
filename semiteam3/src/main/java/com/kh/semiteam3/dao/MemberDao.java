package com.kh.semiteam3.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semiteam3.dto.MemberDto;
import com.kh.semiteam3.mapper.MemberMapper;

@Repository
public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private MemberMapper memberMapper;
	
	//등록(회원가입)
	public void insert(MemberDto memberDto) {
		String sql = "insert into member"
				+ "(member_id, member_pw, member_nick, member_contact, member_email, "
				+ "member_birth, member_post, member_address1, member_address2) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
				memberDto.getMemberId(), memberDto.getMemberPw(), 
				memberDto.getMemberNick(), memberDto.getMemberContact(),
				memberDto.getMemberEmail(), memberDto.getMemberBirth(),memberDto.getMemberPost(),
				memberDto.getMemberAddress1(),memberDto.getMemberAddress2()
		};
		jdbcTemplate.update(sql, data);
	}
	
	//회원정보 수정
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_nick = ?, member_contact = ?, member_email = ?, member_birth = ?, "
				+ "member_post = ?, member_address1 = ?, member_address2 = ?, "
				+ "where member_id = ?";
		Object[] data = {
				memberDto.getMemberNick(), memberDto.getMemberContact(),
				memberDto.getMemberEmail(), memberDto.getMemberBirth(),
				memberDto.getMemberPost(), memberDto.getMemberAddress1(),
				memberDto.getMemberAddress2(), memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	

}
