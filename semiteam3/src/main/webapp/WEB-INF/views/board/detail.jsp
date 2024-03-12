<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


   	<!-- jquery cdn (jquery불러오는 코드)--><!-- 이부분에 코드 쓰면 안돼 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    
    <!-- summernote cdn -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    </script>
    <!-- ChartJS cdn -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="/css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
    <link rel="stylesheet" type="text/css" href="/css/layout.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<div class="container w-800">
	<div class="cell center">
		<h1>${boardDto.boardNo}번 글 보기</h1>
	</div>
	<div class="cell">
		<h2>
			제목: ${boardDto.boardTitle}
			
			<%--(추가) 수정시각 유무에 따라 수정됨 표시 --%>
			<c:if test="${boardDto.boardEditTime != null}">
				(수정됨)
			</c:if>
		</h2>
	</div>
	
	<div class="cell">
		<h4>
			<%-- 탈퇴한 사용자일 때와 아닐때 나오는 정보가 다르게 구현 --%>
			<c:choose>
				<c:when test="${boardDto.boardWriter == null}">
					${boardDto.boardWriterStr}
				</c:when>
				<c:otherwise>
					작성자: ${memberDto.memberNick}
					(${memberDto.memberGrade})
				</c:otherwise>
			</c:choose>
		</h4>
	</div>
	<hr>
	<div class="cell" style="min-height:250px">
		<%--
				HTML은 엔터와 스페이스 등을 무시하기 때문에 textarea와 모양이 달라진다
				사용 에디터를 쓰면 알아서 글자를 보정해주기 때문에 문제가 없다
				기본 textarea를 쓰면 문제가 발생한다
				<pre>태그를 사용하면 글자를 있는 그대로 출력한다
				-Rich Text Editor 를 사용하면 문제가 해결된다(ex: summernote)
			 --%>
		${boardDto.boardContent}
	</div>
	<hr>
	<div class="cell">
		조회수 ${boardDto.boardView}
			
		<span class="board-like red">
				<i class="fa-regular fa-heart"></i>
				<span class="count">?</span>
		</span>
	</div>
	<div class="cell">
		<fmt:formatDate value="${boardDto.boardWriteTime}"
								   pattern="yy-MM-dd HH:mm:ss"/>
	</div>
	<div class="cell">
		${boardDto.boardWriteTimeDiff}
	</div>
	
	<div class="cell right">
		<a class="btn" href="write">글쓰기</a>
		<%-- 
			수정과 삭제 링크는 회원이면서 본인글이거나 관리자일 경우만 출력 
			- 본인글이란 로그인한 사용자 아이디와 게시글 작성자가 같은 경우
			- 관리자란 로그인한 사용자 등급이 '관리자'인 경우
		--%>
		<c:if test="${sessionScope.loginId != null && (sessionScope.loginId == boardDto.boardWriter || sessionScope.loginLevel == '관리자')}">
		<a class="btn negative" href="edit?boardNo=${boardDto.boardNo}">글수정</a>
		<a class="btn negative link-confirm" 
			data-message="정말 삭제하시겠습니까?" 
			href="delete?boardNo=${boardDto.boardNo}">글삭제</a>
		</c:if>
		<a class="btn positive" href="list">글목록</a>
	</div>
</div>