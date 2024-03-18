package com.kh.semiteam3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semiteam3.dao.BoardDao;
import com.kh.semiteam3.dto.BoardDto;
import com.kh.semiteam3.vo.PageVO;

@Controller
public class HomeController {
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		//binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
		// new StringTrimmerEditor(true)문자열을 자르는 편집도구를 사용하여라 문자열에 대해서(String.class)를
		//이걸 사용하면 이 컨트롤러 내에서 empty string 을 null로 간주하도록 설정된다
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}
	@Autowired
	private BoardDao boardDao;
	

	@RequestMapping("/")
	public String home(@ModelAttribute BoardDto boardDto, 
									Model model) {
	    List<BoardDto> footballList = boardDao.boardStatus(new PageVO(), "축구", "recruiting");
	    List<BoardDto> baseballList = boardDao.boardStatus(new PageVO(), "야구", "recruiting");
	    List<BoardDto> basketballList = boardDao.boardStatus(new PageVO(), "농구", "recruiting");
	    List<BoardDto> ESportsList = boardDao.boardStatus(new PageVO(), "E-스포츠", "recruiting");
		
		model.addAttribute("footballList", footballList);
		model.addAttribute("baseballList", baseballList);
		model.addAttribute("basketballList", basketballList);
		model.addAttribute("ESportsList", ESportsList);
		
		return "/WEB-INF/views/home.jsp";
	}

}
