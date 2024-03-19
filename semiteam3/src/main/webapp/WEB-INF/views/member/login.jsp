<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
    .input {
        width: 350px;
        padding: 0.5em 1em;
        border: 0.1px;
    }
    .form-container {
        width: 450px;
        margin: 0 auto;
    }
    .form-container h1 {
        color: #e3c7a6;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    .form-feedback {
        color: red;
        font-size: 14px;
    }
    .form-actions {
        text-align: center;
    }
    .form-actions button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #e3c7a6;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
    }
     .box{
        width: 500px;
        background-color: #f8f9fa;
        color: #333;
        padding: 20px;
        /*top: 330px;*/
        height: fit-content;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
}

a{
	text-decoration: none;
	color:#e3c7a6;
}
a:hover {
    color: darken(#e3c7a6, 20%); /* 마우스를 올렸을 때 링크의 텍스트 색상 어둡게 만듭니다 */
    text-decoration: underline; /* 마우스를 올렸을 때 밑줄 추가 */
    color: #7f6d5f;
}
</style>

<div class="form-container box">
    <h1><i class="fa-regular fa-user"></i> 로그인</h1>
    <form action="login" method="post" autocomplete="off" class="check-form">
        <div class="form-group">
            <label for="memberId">아이디<b style="color: red">*</b></label>
            <input type="text" id="memberId" name="memberId" placeholder="소문자 시작, 숫자 포함 8~20자" required class="input">
            <div class="form-feedback"></div>
        </div>
        <div class="form-group">
            <label for="memberPw">비밀번호<b style="color: red">*</b></label>
            <input type="password" id="memberPw" name="memberPw" placeholder="대소문자, 숫자, 특수문자 포함 6~15자" required class="input">
            <div class="form-feedback"></div>
        </div>
		<div class="form-group center">
			<a href="findId">아이디 찾기</a><span style="color:#e3c7a6">  |</span>
			<a href="findPw"> 비밀번호 찾기</a><span style="color:#e3c7a6">  |</span>
			 <a href="join">  회원가입</a>
		</div>

		<div class="form-actions">
            <button type="submit" class="btn"><i class="fa-solid fa-arrow-right-to-bracket"></i> 로그인</button>
        </div>
    </form>
   
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
