package com.kh.semiteam3.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.semiteam3.dao.MemberDao;
import com.kh.semiteam3.dto.MemberDto;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender sender;
	@Autowired
	private MemberDao memberDao;
	
	//가입 환영 이메일
	public void sendWelcomeMail(String email) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("제목");
		message.setText("내용");
		
		sender.send(message);
	}
	
	//아이디 발송
	public boolean sendMemberId(String memberNick) {
		MemberDto memberDto = 
				memberDao.selectOneByMemberNick(memberNick);
		
		if(memberDto != null) {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(memberDto.getMemberId());
			message.setSubject("제목");
			message.setText("아이디는 ["+ memberDto.getMemberId() +"] 입니다");
			sender.send(message);
			return true;
		}
		else {
			return false;
		}
	}
	
	//임시 비밀번호 발송
		public void sendTempPassword(MemberDto memberDto) {
			String lower = "abcdefghijklmnopqrstuvwxyz";//3글자
			String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";//3글자
			String number = "0123456789";//1글자
			String special = "!@#$";//1글자
			
			Random r = new Random();//랜덤도구
			StringBuffer buffer = new StringBuffer();//문자열 합성도구
			
			for (int i = 0; i < 3; i++) {
				int pos = r.nextInt(lower.length()) + 0;// lower에서의 랜덤 위치
				buffer.append(lower.charAt(pos));// 버퍼에 추가
			}
			for (int i = 0; i < 3; i++) {
				int pos = r.nextInt(upper.length()) + 0;// upper에서의 랜덤 위치
				buffer.append(upper.charAt(pos));// 버퍼에 추가
			}
			for (int i = 0; i < 1; i++) {
				int pos = r.nextInt(number.length()) + 0;//number에서의 랜덤 위치
				buffer.append(number.charAt(pos));// 버퍼에 추가
			}
			for (int i = 0; i < 1; i++) {
				int pos = r.nextInt(special.length()) + 0;//special에서의 랜덤 위치
				buffer.append(special.charAt(pos));// 버퍼에 추가
			}
			
			//생성한 비밀번호로 DB를 변경
			memberDto.setMemberPw(buffer.toString());//비밀번호 설정 후
			memberDao.updateMemberPw(memberDto);//변경 처리
			
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(memberDto.getMemberEmail());
			message.setSubject("제목");
			message.setText("임시 비밀번호는 ["+ memberDto.getMemberPw() +"] 입니다");
			
			sender.send(message);
			
		}	
	
}
