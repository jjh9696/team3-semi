<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${memberDto.memberNick}님의 정보 변경</h1>

<form action="edit" method="post">
	<input type="hidden" name="memberId" required value="${memberDto.memberId}"><br><br>
	
	닉네임 * <input type="text" name="memberNick" required value="${memberDto.memberNick }"><br><br>
	이메일 * <input type="email" name="memberEmail" required value="${memberDto.memberEmail }"><br><br>
	생년월일 <input type="date" name="memberBirth" ><br><br>
	연락처 <input type="tel" name="memberContact" ><br><br>
	주소 <br>
	<input type="text" name="memberPost" placeholder="우편번호" value="${memberDto.memberPost}" size="6" maxlength="6"><br><br>
	<input type="text" name="memberAddress1" placeholder="기본주소" value="${memberDto.memberAddress1}"><br><br>
	<input type="text" name="memberAddress2" placeholder="상세주소" value="${memberDto.memberAddress2}"><br><br>
	회원등급
	<select name="memberGrade">
		<option value="일반회원">일반회원</option>
		<option value="신고된회원" >신고된회원</option>
		<option value="휴먼회원" >휴먼회원</option>
		<option value="관리자" >관리자</option>
	</select><br><br>
	<button>변경하기</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>