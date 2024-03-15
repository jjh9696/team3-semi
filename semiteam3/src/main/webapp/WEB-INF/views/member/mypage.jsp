<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<script type="text/javascript">

</script>

<div class="flex-cell">
			<img src="image" width="200" height="200">
		<ul>
			<li><a href="/member/password">비밀번호 변경</a></li>
			<li><a href="/member/edit">개인정보 변경</a></li>
			<li><a href="/member/exit">회원 탈퇴</a></li>
		</ul>
	</div>
	

<div class="cell">
				<table class="table">
					<tr>
						<th width="30%">닉네임</th>
						<td class="left">${memberDto.memberNick}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td class="left">${memberDto.memberEmail}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td class="left">${memberDto.memberContact}</td>
					</tr>	
					<tr>
						<th>생년월일</th>
						<td class="left">${memberDto.memberBirth}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td class="left">
							[${memberDto.memberPost}] 
							${memberDto.memberAddress1}
							${memberDto.memberAddress2}
						</td>
					</tr>
					<tr>
						<th>등급</th>
						<td class="left">${memberDto.memberGrade}</td>
					</tr>
					<tr>
						<th>가입일시</th>
						<td class="left">
							<fmt:formatDate value="${memberDto.memberJoin}" 
														pattern="y년 M월 d일"/>
						</td>
					</tr>
					<tr>
						<th>로그인일시</th>
						<td class="left">
							<fmt:formatDate value="${memberDto.memberLogin}" 
														pattern="y년 M월 d일 H시 m분 s초"/>
						</td>
					</tr>
				</table>
			</div>

<div class="cell">
	<a href="/member/password"><button>비밀번호 변경</button></a> <a
		href="/member/edit"><button>개인정보 변경</button></a> <a
		href="/member/exit" class="link-confirm" data-message="정말 탈퇴하시겠습니까?"><button>회원 탈퇴</button></a>
</div>

<div class="cell">
	<a href="/board/mywriting"><button>내가쓴 글</button></a> <a
		href="#"><button>내가쓴 댓글</button></a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>