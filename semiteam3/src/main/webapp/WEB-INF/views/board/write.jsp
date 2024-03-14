<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	

	<script src="/js/exit.js"></script>


    
    
    <div class="container w-800">
	<%-- 제목칸 --%>
	<div class="cell center">
		<c:if test="${param.category == '축구'}">
			<h2>축구게시글 작성</h2>
		</c:if>
		<c:if test="${param.category == '야구'}">
			<h2>야구게시글 작성</h2>
		</c:if>
		<c:if test="${param.category == '농구'}">
			<h2>농구게시글 작성</h2>
		</c:if>
		<c:if test="${param.category == 'E-스포츠'}">
			<h2>게임게시글 작성</h2>
		</c:if>
		<c:if test="${param.category =='관리자'}">
			<h2>전체 공지 작성</h2>
		</c:if>
	</div>
	<div class="cell">
		<form class="free-pass" action="write?category=${param.category}" method="post">
			<div class="cell">
				<input type="hidden" name="boardCategory" value="${param.category}">
			</div>
			
        <div class="cell flex-cell">
			마감시간
        </div>
			
			<div class="cell">
				<input class="tool w-100" name="boardTitle" type="text" placeholder="제목">
			</div> 
			<div class="cell">
				<textarea class="tool w-100" name="boardContent" placeholder="내용 입력"></textarea>
			</div>
			<div class="flex-cell">
				<div class="cell w-50">
					<a href="list?category=${param.category}" class="btn negative w-100">
						취소
					</a>
				</div>
				<div class="cell w-50">
					<button class="btn positive w-100">
						작성완료
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
 