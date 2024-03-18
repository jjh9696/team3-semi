<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
					(${memberDto.memberGrade})
				</c:otherwise>
				</c:choose>
			</h3>
		</div>
		<div class="cell">
			<pre>신고사유: ${reportReplyDto.reportReplyReason}</pre>
		</div>
		<hr>
		<div class="cell" style="min-height: 250px;">
			<pre>${reportReplyDto.reportReplyContent}</pre>
		</div>

		<hr>

		<div class="cell">
			<fmt:formatDate value="${reportReplyDto.reportReplyDate}"
				pattern="yyyy-MM-dd HH:mm:ss" />
		</div>

		<div>
			<a class="btn negative link-confirm" data-message="정말 삭제하시겠습니까?"
					href="delete?reportReplyNo=${reportReplyDto.reportReplyNo}">댓글 신고글삭제</a>
			<a class="btn positive" href="list">댓글 신고글 목록</a>
			<a class="btn positive" href="#">신고된 댓글 보러가기</a>

		</div>


	</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>