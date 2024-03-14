<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<div class="cell">
		<div class="">
				<img src="image" width="200" height="200">
			</div>
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
		href="/member/exit" class="link-confirm"><button>회원 탈퇴</button></a>
</div>

<div class="cell">
	<a href="#"><button>내가쓴 글</button></a> <a
		href="#"><button>내가쓴 댓글</button></a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>