<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type = "text/javascript">
$(function(){           
    $("a.link-confirm").click(function(){              
        var message = $(this).data("message");
        // console.log(message);
        if(message == undefined){
            message = "정말 삭제 하시겠습니까?";
        }
        var choice = window.confirm(message);
        return choice;

        // return false;//차단
        // return true;//통과

    });
});
</script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${memberDto.memberNick}님의상세 정보</h1>

<table border="1">
	<tr>
		<th>아이디</th>
		<td>
			${memberDto.memberId} 
			신고한 횟수 : ${reporterCountByMemberId}
			신고당한 횟수 : ${reporteeCountByMemberId}
		</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${memberDto.memberNick}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${memberDto.memberBirth}</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${memberDto.memberContact}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${memberDto.memberEmail}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${memberDto.memberPost} (${memberDto.memberAddress1 }
			${memberDto.memberAddress2 })</td>
	</tr>
	<tr>
		<th>회원등급</th>
		<td>${memberDto.memberGrade}</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${memberDto.memberJoin}</td>
	</tr>
	<tr>
		<th>최종로그인</th>
		<td>${memberDto.memberLogin}</td>
	</tr>
</table>

<a href="edit?memberId=${memberDto.memberId}"><button>수정</button></a>
<a href="delete?memberId=${memberDto.memberId}" class="link-confirm"><button>회원
		강제탈퇴</button></a>

<hr>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>