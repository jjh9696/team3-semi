<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script src="/js/exit.js"></script>
    
    <div class="container w-800">
    	<div class="cell center">
    		<h1>문의글 작성</h1>
    	</div>
    	
		<div class="cell">
			<form class="free-pass" action="insert" method="post">
				<c:if test="${param.inquiryTarget!=null}">
					<input type="hidden" name="inquiryTarget" value="${param.inquiryTarget}">
				</c:if>
				<h3>제목</h3> 
				<c:choose>
					<c:when test="${param.inquiryTarget == null}">
						<input class="tool w-100" name="inquiryTitle" type="text" required><br><br>
					</c:when>
					<c:otherwise>
						<input class="tool w-100" name="inquiryTitle" type="text" required value="[RE]${targetDto.inquiryTitle}"><br><br>
					</c:otherwise>
				</c:choose>
				<div class="cell">
					<select class="tool w-30" name="boardCategory">
					<option value="">카테고리</option>
					<option value="축구">축구</option>
					<option value="농구">농구</option>
					<option value="야구">야구</option>
					<option value="E-스포츠">E-스포츠</option>
					</select>
				</div>
				<div class="cell">
					<textarea class="tool w-100" name="inquiryContent" placeholder="내용 입력"></textarea>
				</div>
				<div class="flex-cell">
					<div class="w-100 left">
						<button class="btn negative">
							취소
						</button>
					</div>
					<div class="w-100 right">
						<button class="btn positive">
							완료
						</button>
					</div>
				</div>
			</form>
		</div>
</div>

	