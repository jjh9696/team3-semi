<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	

	<!-- 시간관련 CDN -->
	<link rel="stylesheet" type="text/css" href="/jquery.datetimepicker.css"/ >
	<script src="/jquery.js"></script>
	<script src="/build/jquery.datetimepicker.full.min.js"></script>
	
	    <script src="/js/exit.js"></script>
	        <script type="text/javascript">
	        $(function(){
	            // 현재 날짜 및 시간을 가져오기
	            var now = moment().format('YYYY-MM-DD HH:mm:ss');
	            
	            // 시작 시간 input 요소에 현재 시간 설정
	            $("[name=startTime]").val(now);
	            
	            var picker = new Lightpick({
	                field : $("[name=startTime]")[0], //첫 번째 필드
	                secondField: $("[name=boardLimitTime]")[0], //두 번째 필드
	                singleDate: true, //단일 날짜 선택 불가(범위 선택 가능)
	                format : "YYYY-MM-DD HH:mm", 
	                numberOfMonths: 2, //표시할 총 달의 개수
	                numberOfColumns: 2, //한 줄에 표시할 달의 개수
	                minDate: moment(), //현재시각
	            });
	        })
	    </script>

    
    
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
            <input type="text" name="startTime" class="tool w-50">
            <input type="text" name="boardLimitTime" class="tool w-50">
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
 