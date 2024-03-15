package com.kh.semiteam3.restcontroller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semiteam3.dao.AttachDao;
import com.kh.semiteam3.dao.MemberDao;
import com.kh.semiteam3.dto.AttachDto;
import com.kh.semiteam3.dto.MemberDto;
import com.kh.semiteam3.service.AttachService;




//업로도되는 파일에 대한 처리를 수행하는 컨트롤러
@CrossOrigin
@RestController
@RequestMapping("/rest/member_attach")
public class MemberAttachRestController {
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private AttachDao attachDao;
	
//	@Autowired
//	private AttachDto attachDto;
	
	
	//업로드 매핑
	//- 사용자가 summernote를 이용해서 드래그 또는 선택한 이미지들을 업로드
	//- 업로드가 완료되면 summernote가 이미지를 표시할 수 있도록 이미지 번호를 반환
	@PostMapping("/upload")
	public List<Integer> upload(@RequestParam List<MultipartFile> attachList) throws IllegalStateException, IOException {
		//올린 파일이 없으면 중지
		if(attachList.isEmpty()) return null;
		
		List<Integer> numbers = new ArrayList<>();
		for(MultipartFile attach : attachList) {
			int attachNo = attachService.save(attach);
			numbers.add(attachNo);
		}
		return numbers;
	}
	@GetMapping("/edit")
	public String edit(@RequestParam String memberId, Model model) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/admin/member/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute MemberDto memberDto, 
			@RequestParam MultipartFile attach) throws IllegalStateException, IOException {
		//우선 아이템 정보는 첨부파일과 관계 없이 수정 처리
		memberDao.Update(memberDto);
		
		//첨부파일이 있다면 기존의 첨부파일을 지우고 신규 첨부파일을 등록
		if(!attach.isEmpty()) {
		
			//기존 파일 삭제
			try {
				int attachNo = attachDao.findAttachNo(memberDto.getMemberId());//파일번호찾고
				File dir = new File(System.getProperty("user.home"), "upload");
				File target = new File(dir, String.valueOf(attachNo));
				target.delete();//실제파일 삭제
				attachDao.delete(attachNo);//DB에서 삭제
			}
			catch(Exception e) {}//예외 발생 시 아무것도 안함(skip)
			
			//신규 파일 추가
			//- attach_seq 번호 생성
			//- 실물 파일을 저장
			//- DB에 insert
			//- member과 connect 처리
			int attachNo = attachDao.getSequence();//시퀀스생성
			File dir = new File(System.getProperty("user.home"), "upload");
			File target = new File(dir, String.valueOf(attachNo));
			attach.transferTo(target);//실물파일저장
			
			AttachDto attachDto = new AttachDto();
			attachDto.setAttachNo(attachNo);
			attachDto.setAttachName(attach.getOriginalFilename());
			attachDto.setAttachType(attach.getContentType());
			attachDto.setAttachSize(attach.getSize());
			attachDao.insert(attachDto);//DB저장
			
			memberDao.connect(memberDto.getMemberId(), attachNo);//연결처리
		}
		return "redirect:list";
	
	}
}
