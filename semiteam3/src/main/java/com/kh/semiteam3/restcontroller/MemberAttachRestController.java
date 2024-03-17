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
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute MemberDto memberDto, 
	                   @RequestParam MultipartFile attach) {
	    try {
	        // 회원 정보 업데이트
	        memberDao.Update(memberDto);
	        
	        // 첨부 파일이 있을 경우
	        if (!attach.isEmpty()) {
	            // 기존 첨부 파일 삭제
	            int attachNo = attachDao.findAttachNo(memberDto.getMemberId());
	            deleteExistingAttachment(attachNo);
	            
	            // 신규 첨부 파일 추가
	            int newAttachNo = addAttach(attachNo);
	            
	            // 회원과 첨부 파일 연결
	            memberDao.connect(memberDto.getMemberId(), newAttachNo);
	        }
	    } catch (Exception e) {
	        // 예외 처리
	        logger.error("Error occurred during member editing: " + e.getMessage());
	        // 필요에 따라 사용자에게 오류 메시지를 표시하거나 로깅합니다.
	    }
	    // 리다이렉트 처리
	    return "redirect:list";
	}

	private int addAttach(int attachNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	private void deleteExistingAttachment(int attachNo) {
	    // 기존 파일 삭제
	    if (attachNo != -1) {
	        File dir = new File(System.getProperty("user.home"), "upload");
	        File target = new File(dir, String.valueOf(attachNo));
	        target.delete();
	        attachDao.delete(attachNo);
	    }
	}

	private int addNewAttachment(MultipartFile attach) throws IOException {
	    // 신규 파일 추가
	    int attachNo = attachDao.getSequence();
	    File dir = new File(System.getProperty("user.home"), "upload");
	    File target = new File(dir, String.valueOf(attachNo));
	    attach.transferTo(target);
	    
	    // 첨부 파일 정보 DB에 추가
	    AttachDto attachDto = new AttachDto();
	    attachDto.setAttachNo(attachNo);
	    attachDto.setAttachName(attach.getOriginalFilename());
	    attachDto.setAttachType(attach.getContentType());
	    attachDto.setAttachSize(attach.getSize());
	    attachDao.insert(attachDto);
	    
	    return attachNo;
	}

}
