<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
    
    <div class="container w-800">
	<div class="cell center">
		<h1>문의게시판</h1>
	</div>
	<div class="cell">
		타인에 대한 무분별한 비방 또는 욕설은 경고 없이 삭제될 수 있습니다
	</div>
	<div class="cell right">
		<h2><a class="link" href="insert">+게시글 작성</a></h2>
	</div>
	<div class="cell">
		<%-- 테이블 --%>
		<table class="table table-horizontal table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th width="40%">문의내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="inquiryDto" items="${list}">
			<tr>
				<td>${inquiryDto.inquiryNo}</td>
				<%-- 제목칸 --%>
				<td class="left">
					<%-- 제목 출력 --%>
					<a class="link" href="detail?inquiryNo=${inquiryDto.inquiryNo}">
					${inquiryDto.inquiryTitle}
					</a>
				</td>
				<td>${inquiryDto.inquiryWriterStr}</td><%-- dto 에서 가상의 메소드 하나 만들어주기 --%>
				<td>${inquiryDto.inquiryWtimeStr}</td><%-- dto 에서 가상의 메소드 하나 만들어주기 --%>
				<td>${inquiryDto.inquiryEtime}</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
	</div>
	<div class="cell center">
		<%--네비게이터 출력(구조는 복잡하지만 /inquiry/list와 같지 않을까?) --%>
		<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
	</div>
	<div class="cell left">
	<%-- 검색창 --%>
	<form action="list" method="get">
		<select name="column" class="tool">
			<option value="inquiry_title" ${param.column == 'inquiry_title' ? 'selected' : ''}>제목</option>
			<option value="inquiry_writer" ${param.column == 'inquiry_writer' ? 'selected' : ''}>작성자</option>
			<option value="inquiry_content" ${param.column == 'inquiry_content' ? 'selected' : ''}>내용</option>
		</select>
		<input class="tool" type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
		<button class="btn positive">검색</button>
	</form>
	</div>
</div>
    