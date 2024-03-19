<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		//해야할 일
		//1. 아이디 입력창에서 입력이 완료될 경우 형식 검사하여 결과 기록
		//2. 비밀번호 입력창에서 입력이 완료될 경우 형식 검사하여 결과 기록
		//3. 비밀번호 확인창에서 입력이 완료될 경우 비밀번호와 비교하여 결과 기록
		//4. form의 전송이 이루어질 때 모든 검사결과가 유효한지 판단하여 전송

		//상태객체(React의 state로 개념이 이어짐)
		var state = {
			//key : value
			memberIdValid : false,
			memberEmailValid : false,
			
			//객체에 함수를 변수처럼 생성할 수 있다
			//- this는 객체 자신(자바와 동일하지만 생략이 불가능)
			ok : function() {
				return this.memberIdValid && this.memberPwValid;
			},
		};

		$("[name=memberId]").on(
				"blur",
				function() {
					var regex = /^[a-z][a-z0-9]{7,19}$/;
					state.memberIdValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.memberIdValid ? "success" : "fail");
				});
		$("[name=memberEmail]").on(
				"blur",
				function() {
					var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
					state.memberEmailValid = regex.test($(this).val());
					$(this).removeClass("success fail").addClass(
							state.memberEmailValid ? "success" : "fail");
				});
		$(".check-form").submit(function() {
			$("[name=memberId]").blur();
			$("[name=memberEmail]").blur();
			
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


<form action="findPw" method="post" autocomplete="off" class="check-form">
	<div class="container w-450" style="margin-top:80px">
			<div class="cell center title" style="color: #e3c7a6">
				<h1>
					<i class="fa-solid fa-lock"></i>
					비밀번호 찾기
				</h1>
					
			</div>
			<div class="cell">
			
				<div class="cell">
					<label>아이디<b style="color: red">*</b></label>
						<input type="text" name="memberId" 
							placeholder="소문자 시작, 숫자 포함 8~20자" class="tool w-100">
					<div class="fail-feedback">형식에 맞게 다시 작성해주세요.</div>
				</div>
				
				<div class="cell">
					<label>이메일<b style="color: red">*</b></label>
						<input type="email" name="memberEmail" 
							placeholder="test1234@kh.com" class="tool w-100">
					<div class="fail-feedback">형식에 맞게 다시 작성해주세요.</div>
				</div>
					
				<div class="cell" style="margin-bottom:300px">
					<button type="sumit" class="btn positive w-100" 
							style="background-color: #e3c7a6">
						<i class="fa-solid fa-arrow-right-to-bracket"></i>
						찾기
					</button>
				</div>
				
			</div>
		</div>	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>