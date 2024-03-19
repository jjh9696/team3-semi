<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-600">
	<div class="cell center">
		<h2>${memberDto.memberNick}님의 정보 변경</h2>
	</div>
	<form action="edit" method="post" aoutoconplete="off">
		<input type="hidden" name="memberId" required class="tool w-100" value="${memberDto.memberId}">
		<div class="cell">
			<label>닉네임<b style="color:red">*</b></label> 
			<input type="text" name="memberNick" required class="tool w-100" value="${memberDto.memberNick }">
		</div>
		<div class="cell">
			<label>이메일<b style="color:red">*</b></label>
			<input type="email" name="memberEmail" required class="tool w-100" value="${memberDto.memberEmail }">
		</div>
		<div class="cell">
			<label>생년월일</label> 
			<input type="date" name="memberBirth" class="tool w-100">
		</div>
		<div class="cell">
			<label>연락처</label>
			<input type="tel" name="memberContact" class="tool w-100">
		</div>
		<div>
			<label>주소</label>
		</div>
		<div class="cell">
			<input type="text" name="memberPost" placeholder="우편번호" value="${memberDto.memberPost}" class="tool" size="6" >
		</div>
		<div class="cell">
			<input type="text" name="memberAddress1" placeholder="기본주소" class="tool w-100" value="${memberDto.memberAddress1}">
		</div>
		<div class="cell">
			<input type="text" name="memberAddress2" placeholder="상세주소" class="tool w-100" value="${memberDto.memberAddress2}">
		</div>
		<div class="cell">
			회원등급
			<select name="memberGrade" class="tool w-100">
				<option value="일반회원">일반회원</option>
				<option value="신고된회원" >신고된회원</option>
				<option value="휴면회원" >휴면회원</option>
				<option value="관리자" >관리자</option>
			</select>
		</div>
		<div class="right">
			<button class="btn positive">변경하기</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>