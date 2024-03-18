<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 작성글 내역 표시 -->
<h2>찜목록</h2>
<body>
        <div class="cell">
		<table class="table table-horizontal table-hover">
			<thead class="center">
				<tr>
					<th>작성자</th>
					<th width="40%">번호</th>
				</tr>
			</thead>
			<c:forEach var="boardLikeDto" items="${likeList}">
				<tr>
					<td>${boardLikeDto.memberId}</td>
					<td>
						<%-- 제목 출력 --%> <a class="link"
						href="detail?boardNo=${boardLikeDto.boardNo}">
							${boardLikeDto.boardNo} </a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="cell center">
			<%--네비게이터 출력(구조는 복잡하지만 /board/list와 같지 않을까?) --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
	</div>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>