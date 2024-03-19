<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<%--
	절대
	<form action="/admin/member/search" method="get"></form>
	
	상대
	<form action="search" method="get"></form>
 --%>
 <div class="container w-800">
<h1>회원 관리</h1>
 <div class="cell">
	<form action="search" method="get">
		<select class="tool" name="column">
			<option value="member_id" ${param.column == 'member_id' ? 'selected' : ''}>아이디</option>
			<option value="member_nick" ${param.column == 'member_nick' ? 'selected' : ''}>닉네임</option>
			<option value="member_contact" ${param.column == 'member_contact' ? 'selected' : ''}>연락처</option>
			<option value="member_email" ${param.column == 'member_email' ? 'selected' : ''}>이메일</option>
			<option value="member_birth" ${param.column == 'member_birth' ? 'selected' : ''}>생년월일</option>
		</select>
		<input class="tool" type="search" name="keyword" placeholder="검색어 입력" required
				value="${param.keyword}">
		<button class="btn positive">회원찾기</button>
	</form>
 </div>
<div class="cell">
	<%-- 조회 결과는 list의 유무에 따라 다르게 출력 --%>
	<c:choose>
		<c:when test="${list == null}">
		</c:when>
		<c:when test="${list.isEmpty()}">
			<h2>검색 결과가 존재하지 않습니다</h2>
		</c:when>
		<c:otherwise>
			<table class="table table-horizontal table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>생년월일</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="memberDto" items="${list}">
					<tr>
						<td>
							<a class="link" href="detail?memberId=${memberDto.memberId}">${memberDto.memberId}</a>
						</td>
						<td>
							<a class="link" href="detail?memberId=${memberDto.memberId}">${memberDto.memberNick}</a>
						</td>
						<td>${memberDto.memberEmail}</td>
						<td>${memberDto.memberContact}</td>
						<td>${memberDto.memberBirth}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</div>


 </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>









