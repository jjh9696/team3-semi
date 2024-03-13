package com.kh.semiteam3.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semiteam3.dao.BoardLikeDao;
import com.kh.semiteam3.vo.LikeVO;

import jakarta.servlet.http.HttpSession;

//@CrossOrigin
@RestController
@RequestMapping("/rest/board_like")
public class BoardLikeRestController {
	@Autowired
	private BoardLikeDao boardLikeDao;
	
	//회원의 글에 대한 좋아요 상태를 조회
	@RequestMapping("/check")
	public LikeVO check(
			HttpSession session, @RequestParam int boardNo){
		String homeId = (String)session.getAttribute("loginId");
		
		LikeVO likeVO = new LikeVO();
		likeVO.setState(boardLikeDao.check(homeId, boardNo));
		likeVO.setCount(boardLikeDao.count(boardNo));
		
		return likeVO;
	}
	//하트를 클릭한 경우 실행할 매핑
//	@RequestMapping("/toggle")
//	public Map<String, Object> toggle(
//			HttpSession session, @RequestParam int boardNo){
//		String homeId = (String)session.getAttribute("loginId");
//		Map<String, Object> data = new HashMap<>();
//		if(boardLikeDao.check(homeId, boardNo)) {
//			boardLikeDao.delete(homeId, boardNo);
//			data.put("state", false);
//		}
//		else {
//			boardLikeDao.insert(homeId, boardNo);
//			data.put("state", true);
//		}
//		int count = boardLikeDao.count(boardNo);
//		data.put("count", count);
//		return data;
		
//	}
	@RequestMapping("/toggle")
	public LikeVO toggle(
			HttpSession session, @RequestParam int boardNo){
		String homeId = (String)session.getAttribute("loginId");
		LikeVO likeVO = new LikeVO();
		if(boardLikeDao.check(homeId, boardNo)) {
			boardLikeDao.delete(homeId, boardNo);
			likeVO.setState(false);
		}
		else {
			boardLikeDao.insert(homeId, boardNo);
			likeVO.setState(true);
		}
		int count = boardLikeDao.count(boardNo);
		likeVO.setCount(count);
		return likeVO;
	
}
}