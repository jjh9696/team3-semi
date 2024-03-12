<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고 목록</title>
</head>
<body>
	<div class="container w-800">
		<div class="cell">
			<h1>게시글 신고 목록</h1>
		</div>
		<div class="cell right">
			<h2><a href="write" class="link">글쓰기</a></h2>
		</div>
		<div class="cell">
			<%-- 목록 --%>
			<table class="table table-horizontal">
				<thead>
					<tr>
						<th>번호</th>
						<th>신고사유</th>
						<th>신고내용</th>
						<th>신고일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="reportBoardDto" items="${list}">
					<tr>
						<td>${reportBoardDto.reportBoardNo}</td>
						<td>${reportBoardDto.reportBoardReason}</td>
					 	<td>${reportBoardDto.reportBoardContent}</td>
						<td>${reportBoardDto.reportBoardDate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
		</div>
	
		<div class="cell">
			<%-- 네비게이터 --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include> 
		</div>
		<div class="cell center">
			<%-- 검색창 --%>
			<form action="list" method="get">
				<select name="column" class="tool">
					<option value="member_id" ${param.column == 'member_id' ? 'selected' : ''}>작성자</option>
					<option value="report_board_content" ${param.column == 'report_board_content' ? 'selected' : ''}>내용</option>
				</select>
				<input class="tool" type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
				<button class="btn positive">검색</button>
			</form>
		</div>
	</div>
</body>
</html>