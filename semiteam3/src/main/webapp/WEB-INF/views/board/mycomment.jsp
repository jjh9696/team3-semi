<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 작성글 내역 표시 -->
<h2>내 댓글</h2>
<body>
        <div class="cell">
		<table class="table table-horizontal table-hover">
			<thead class="center">
				<tr>
					<th>게시글 번호</th>
					<th width="40%">내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<!--  -->
			<c:forEach var="replyDto" items="${replyList}">
				<tr>
					<td>${replyDto.replyOrigin}</td>
					<%-- 제목칸 --%>
					<td class="left" width="40%">
						<%-- 제목 출력--%>  <a class="link"
						href="/board/detail?boardNo=${replyDto.replyOrigin}">
							${replyDto.replyContent} </a>
					</td>
					<td>${replyDto.replyTime}</td>
				</tr>
			</c:forEach>

		</table>
		
				<div class="cell center">
			<%--네비게이터 출력(구조는 복잡하지만 /board/list와 같지 않을까?) --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
		<div class="cell left">
			<%-- 검색창 --%>
			<form action="list" method="get">
				<!-- 카테고리를 넘겨줘야함 -->
				<input type="hidden" name="category" value="${param.category}">
				<select name="column" class="tool">
					<option value="board_title"
						${param.column == 'board_title' ? 'selected' : ''}>제목</option>
					<option value="board_content"
						${param.column == 'board_content' ? 'selected' : ''}>내용</option>
					<option value="board_writer"
						${param.column == 'board_writer' ? 'selected' : ''}>작성자</option>
				</select> <input class="tool" type="search" name="keyword"
					placeholder="검색어 입력" required value="${param.keyword}">
				<button class="btn positive">검색</button>
			</form>
		</div>
		
	</div>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>