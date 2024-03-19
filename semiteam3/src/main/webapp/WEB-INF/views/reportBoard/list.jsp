<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고 목록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	<div class="container w-800">
		<div class="cell">
			<h1>게시글 신고 목록</h1>
		</div>
		<div class="cell">
			<%-- 목록 --%>
			<table class="table table-horizontal">
				<thead>
					<tr>
						<th>게시글 신고 번호</th>
						<th>신고된 게시글 번호</th>
						<th>신고자</th>
						<th>신고사유</th>
						<th>신고일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="reportBoardDto" items="${list}">
						<tr>
							<td>
								<a class="link" href="detail?reportBoardNo=${reportBoardDto.reportBoardNo}">
								${reportBoardDto.reportBoardNo}
								</a>
							</td>
							<td>
								<a class="link" href="http://localhost:8080/board/detail?boardNo=${reportBoardDto.reportBoardOrigin}">
								${reportBoardDto.reportBoardOrigin}
								</a>
							</td>
							<td>${reportBoardDto.reportBoardWriter}</td>
							<td>${reportBoardDto.reportBoardReason}</td>
							<td>${reportBoardDto.reportBoardDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="cell center">
			<%-- 검색창 --%>
			<form action="list" method="get">
				<select name="column" class="tool">
					<option value="member_id"
						${param.column == 'member_id' ? 'selected' : ''}>작성자</option>
					<option value="report_board_reason"
						${param.column == 'report_board_reason' ? 'selected' : ''}>신고사유</option>
				</select> <input class="tool" type="search" name="keyword"
					placeholder="검색어 입력" required value="${param.keyword}">
				<button class="btn positive">검색</button>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>