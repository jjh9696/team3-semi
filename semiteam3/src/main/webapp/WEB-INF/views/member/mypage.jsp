<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
	$("#memberAttach").on("change", function() {
			var formData = new FormData();
			//formData.append("이름", 값);
			formData.append("attach", this.files[0]);
			console.log("");
			$.ajax({
				url : "/rest/member_attach/upload",
				method : "post",
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					if (response == null)
						return;
					$("#preview").attr("src", "image");
				}
			});
		});

	});
</script>
<script>
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
            
        }
    }
</script>

<div class="flex-cell">
<form action="mypage" method="post" autocomplete="off" enctype="multipart/form-data">
	<c:choose>
    	<c:when test="${empty loginMember.memberAttach}">
    		<label for="memberAttach">
    			<img src="image" width="200" height="200" alt="Priview Image" id="preview">
    		</label>
			
    	</c:when>
    	<c:otherwise>
    		<label for="memberAttach">
    			<img src="/image/user.svg" id="preview" width="200" height="200">
    		</label>
			
    	</c:otherwise>
	</c:choose>
	<input type="file" id="memberAttach" name="memberAttach" class="input" 
					onchange="previewImage(this)" style="display:none">
</form>
		<ul>
			<li><a href="/member/password">비밀번호 변경</a></li>
			<li><a href="/member/edit">개인정보 변경</a></li>
			<li><a href="/member/exit">회원 탈퇴</a></li>
			
		</ul>
	</div>
	<div style="color:gray">
		*사진을 클릭하여 변경하세요	
	</div>
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>