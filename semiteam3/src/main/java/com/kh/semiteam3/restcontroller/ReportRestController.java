package com.kh.semiteam3.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semiteam3.dao.ReportDao;
import com.kh.semiteam3.vo.ReportVO;

import jakarta.servlet.http.HttpSession;

@CrossOrigin
@RestController
@RequestMapping("/rest/Report")
public class ReportRestController {
	
	@Autowired
	private ReportDao reportDao;
	
	@RequestMapping("/check")
	public ReportVO check(
			HttpSession session, @RequestParam String ReportMember) {
		String homeId = (String)session.getAttribute("loginId");
		
		ReportVO reportVO = new ReportVO();
		reportVO.setState(reportDao.check(homeId, ReportMember));
		reportVO.setCount(reportDao.count(ReportMember));
		
		return reportVO;
	}
	
	@RequestMapping("/change")
	public ReportVO change(
			HttpSession session, @RequestParam String ReportMember) {
		String homeId = (String)session.getAttribute("loginId");
		
		ReportVO reportVO = new ReportVO();
//		if(reportDao.check(homeId, ReportMember)) {
//			reportDao.delete(homeId, ReportMember);
//			reportVO.setState(false);
//		}
//		else {
			reportDao.insert(homeId, ReportMember);
			reportVO.setState(true);
//		}
		int count = reportDao.count(ReportMember);
		reportVO.setCount(count);
		return reportVO;

		
	}
}
