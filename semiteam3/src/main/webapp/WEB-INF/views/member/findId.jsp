<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		//해야할 일
		//1. 아이디 입력창에서 입력이 완료될 경우 형식 검사하여 결과 기록
		//2. form의 전송이 이루어질 때 모든 검사결과가 유효한지 판단하여 전송

		//상태객체(React의 state로 개념이 이어짐)
		var state = {
			//key : value
			memberNickValid : false,
			//객체에 함수를 변수처럼 생성할 수 있다
			//- this는 객체 자신(자바와 동일하지만 생략이 불가능)
			ok : function() {
				return this.memberNickValid;
			},
		};

		$("[name=memberNick]").on(
				"blur",
				function() {
					var regex = /^[가-힣0-9]{2,10}$/;
					state.memberNickValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.memberNickValid ? "success" : "fail");
				});
		$(".check-form").submit(function() {
			$("[name=memberNick]").blur();
			
			return state.ok();
		});
	});
</script>
<script>
    // param.error가 null이 아닌 경우에만 alert을 표시합니다.
    <c:if test="${param.error != null}">
        alert("정보가 일치하지 않습니다");
    </c:if>
</script>
		
<form action="findId" method="post" autocomplete="off" class="check-form">
<div class="container w-400" style="margin-top:80px">
	<div class="cell center"  style="color: #e3c7a6">
		<h1>
			<i class="fa-regular fa-address-card"></i>
			아이디 찾기
		</h1>
	</div>
	<div class="cell mt-0 flex-cell">
		<input type="text" name="memberNick" required class="tool w-100" 
			placeholder="닉네임을 입력하세요">
		<div class="fail-feedback">형식에 맞게 다시 작성해주세요.</div>
		<button type="submit" class="btn positive">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
	
	<div class="cell right" style="margin-bottom:450px">
		<a href="findPw">비밀번호 찾기</a>
	</div>
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>