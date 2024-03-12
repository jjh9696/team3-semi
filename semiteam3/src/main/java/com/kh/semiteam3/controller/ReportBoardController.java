package com.kh.semiteam3.controller;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semiteam3.dao.MemberDao;
import com.kh.semiteam3.dao.ReportBoardDao;
import com.kh.semiteam3.dto.MemberDto;
import com.kh.semiteam3.dto.ReportBoardDto;
import com.kh.semiteam3.service.AttachService;
import com.kh.semiteam3.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reportBoard")
public class ReportBoardController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	
	@Autowired
	private ReportBoardDao reportBoardDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private AttachService attachService;
	
	//목록
	@RequestMapping("/list")
	public String list(
			@ModelAttribute PageVO pageVO,
			Model model) {
		int count = reportBoardDao.count(pageVO);
		pageVO.setCount(count);
		model.addAttribute("pageVO", pageVO);
		
		List<ReportBoardDto> list = reportBoardDao.selectListByPaging(pageVO);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/reportBoard/list.jsp";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int reportBoardNo) {
		ReportBoardDto reportBoardDto = reportBoardDao.selectOne(reportBoardNo);
		
		//Jsoup으로 내용을 탐색하는 과정
		Document document = Jsoup.parse(reportBoardDto.getReportBoardContent());
		Elements elements = document.select(".server-img");//태그 찾기
		for(Element element : elements) {//반복문으로 한개씩 처리
			String key = element.attr("data-key");//data-key 속성을 읽어라!
			int attachNo = Integer.parseInt(key);//숫자로 변환
			attachService.remove(attachNo);//파일삭제+DB삭제
		}
		
		reportBoardDao.delete(reportBoardNo);
		return "redirect:list";
	}
	
	//등록
	@GetMapping("/insert")
	public String insert() {
		return "/WEB-INF/views/reportBoard/insert.jsp";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ReportBoardDto reportBoardDto, 
						HttpSession session, Model model) {
		String loginId = (String)session.getAttribute("loginId");
		reportBoardDto.setReportBoardWriter(loginId);
		
		reportBoardDao.insert(reportBoardDto);
		
		return "redirect:detail?reportBoardNo="+reportBoardDto.getReportBoardNo();
	}
	
	//상세
	@RequestMapping("/detail")
	public String detail(@RequestParam int reportBoardNo, Model model) {
		ReportBoardDto reportBoardDto = reportBoardDao.selectOne(reportBoardNo);
		model.addAttribute("reportBoardDto", reportBoardDto);
		
		if(reportBoardDto.getReportBoardWriter() != null) {
			MemberDto memberDto = memberDao.selectOne(reportBoardDto.getReportBoardWriter());
			model.addAttribute("memberDto", memberDto);
		}
				
		return "/WEB-INF/views/reportBoard/detail.jsp";
	}
	
}