package com.kh.semiteam3.restcontroller;
//형소연 댓글 신고 비동기 구현 중

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semiteam3.dao.MemberDao;
import com.kh.semiteam3.dao.ReportReplyDao;

@RestController
@RequestMapping("/rest/reportReply")
public class ReportReplyRestController {
	@InitBinder 
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	//댓글 신고 할때는 그 신고당한 번호랑 
	@Autowired
	private ReportReplyDao reportReplyDao;
	
	@Autowired
	private MemberDao memberDao;
	
}
