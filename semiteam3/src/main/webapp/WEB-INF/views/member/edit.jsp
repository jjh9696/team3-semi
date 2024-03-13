<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
	    $(".btn-address-search").click(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("[name=memberPost]").val(data.zonecode);
	                $("[name=memberAddress1]").val(addr);
	                
	                // 커서를 상세주소 필드로 이동한다.
	                $("[name=memberAddress2]").focus();
	            }
	        }).open();
	    });
	    
	    $(".btn-address-clear").click(function(){
	    	$("[name=memberPost]").val("");
	    	$("[name=memberAddress1]").val("");
	    	$("[name=memberAddress2]").val("");
	    });
	});
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>개인정보 변경</h1>

<form action="edit" method="post">
	닉네임 * <input type="text" name="memberNick" required value="${memberDto.memberNick }"><br><br>
	이메일 * <input type="email" name="memberEmail" required value="${memberDto.memberEmail }"><br><br>
	생년월일 <input type="date" name="memberBirth"  value="${memberDto.memberBirth }"><br><br>
	연락처 <input type="tel" name="memberContact" placeholder="'-'없이 작성" value="${memberDto.memberContact }"><br><br>
	주소 <br>
	<input type="text" name="memberPost" placeholder="우편번호" value="${memberDto.memberPost}" size="6" maxlength="6">
	<button type="button" class="btn positive btn-address-search">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
				<button type="button" class="btn negative btn-address-clear">
					<i class="fa-solid fa-xmark"></i>
				</button><br><br>
	<input type="text" name="memberAddress1" placeholder="기본주소" value="${memberDto.memberAddress1}"><br><br>
	<input type="text" name="memberAddress2" placeholder="상세주소" value="${memberDto.memberAddress2}"><br><br>
	비밀번호 확인 * <input type="password" name="memberPw" required><br><br>
	<button>변경하기</button>
</form>

<c:if test="${param.error != null }">
	<h3 style="color:red">비밀번호가 일치하지 않습니다</h3>
</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>