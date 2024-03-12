<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


   	<!-- jquery cdn (jquery불러오는 코드)--><!-- 이부분에 코드 쓰면 안돼 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    
    <!-- summernote cdn -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="/css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
    <link rel="stylesheet" type="text/css" href="/css/layout.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <script src="/js/exit.js"></script>
    
    <div class="container w-800">
	<div class="cell">
		<h1>자유게시판</h1>
	</div>
	<div class="cell">
		타인에 대한 무분별한 비방 또는 욕설은 경고 없이 삭제될 수 있습니다
	</div>
	<div class="cell right">
		<h2><a class="link" href="write">+게시글 작성</a></h2>
	</div>
	<div class="cell">
		<%-- 테이블 --%>
		<table class="table table-horizontal table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>마감일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="boardDto" items="${list}">
			<tr>
				<td>${boardDto.boardNo}</td>
				<%-- 제목칸 --%>
				<td class="left">
					<%-- 제목 출력 --%>
					<a class="link" href="detail?boardNo=${boardDto.boardNo}">
					${boardDto.boardTitle}
					</a>
				</td>
				<td>${boardDto.boardWriterStr}</td><%-- dto 에서 가상의 메소드 하나 만들어주기 --%>
				<td>${boardDto.boardWriteTimeStr}</td><%-- dto 에서 가상의 메소드 하나 만들어주기 --%>
				<td>${boardDto.boardLimitTime}</td>
				<td>${boardDto.boardReadCount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
	</div>
	<div class="cell center">
		<%--네비게이터 출력(구조는 복잡하지만 /board/list와 같지 않을까?) --%>
		<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
	</div>
	<div class="cell left">
	<%-- 검색창 --%>
	<form action="list" method="get">
		<select name="column" class="tool">
			<option value="board_title" ${param.column == 'board_title' ? 'selected' : ''}>제목</option>
			<option value="board_writer" ${param.column == 'board_writer' ? 'selected' : ''}>작성자</option>
			<option value="board_content" ${param.column == 'board_content' ? 'selected' : ''}>내용</option>
		</select>
		<input class="tool" type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
		<button class="btn positive">검색</button>
	</form>
	</div>
</div>
    