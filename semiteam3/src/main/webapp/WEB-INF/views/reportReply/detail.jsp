<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고</title>
</head>
<body>
	<div class="container w-800">
	<div class="cell">
		<h2>댓글 신고</h2>
	</div>
	
	<div class="cell">
		<h3>
			<%-- 탈퇴한 사용자일 때와 아닐 때 나오는 정보가 다르게 구현 --%>
			<c:choose>
				<c:when test="${reportReplyDto.reportReplyWriter == null}">
					${reportReplyDto.getReportReplyWriterStr}
				</c:when>
				<c:otherwise>
					${memberDto.memberNick}
					(${memberDto.memberLevel})
				</c:otherwise>
			</c:choose>
		</h3>
	</div>
	
	<hr>
	<div class="cell" style="min-height:250px;">
		<pre>${reportReplyDto.reportReplyContent}</pre>
	</div>
	
	<hr>
	
	<div class="cell">
		<fmt:formatDate value="${reportReplyDto.reportReplyDate}" 
									pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	
	<div class="cell right">
		<a class="btn" href="write">글쓰기</a>
		
		<%-- 
			삭제 링크는 회원이면서 본인글이거나 관리자일 경우만 출력 
			- 본인글이란 로그인한 사용자 아이디와 게시글 작성자가 같은 경우
			- 관리자란 로그인한 사용자 등급이 '관리자'인 경우
		--%>
		<c:if test="${sessionScope.loginId != null && (sessionScope.loginId == reportReplyContentDto.reportReplyWriter || sessionScope.loginLevel == '관리자')}">
		<a class="btn negative link-confirm" data-message="정말 삭제하시겠습니까?" href="delete?reportReplyNo=${reportReplyContentDto.reportReplyNo}">글삭제</a>
		</c:if>
		<a class="btn positive" href="list">글목록</a>
	</div>
			
	
</div>
</body>
</html>