<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
		<form class="free-pass" action="write?category=${param.category}"
			method="post">
			<div class="cell">
				<input type="hidden" name="boardCategory" value="${param.category}">
			</div>

			<div class="cell right">
				<label for="datetimepicker">마감 시간</label> <input type="text"
					name="boardLimitTime" id="datetimepicker"
					class="form-control tool w-50" >
			</div>

			<div class="cell">
				<input class="tool w-100" name="boardTitle" type="text"
					placeholder="제목">
			</div>
			<div class="cell">
				<textarea class="tool w-100" name="boardContent" placeholder="내용 입력"></textarea>
			</div>
			<div class="flex-cell">
				<div class="cell w-50">
					<a href="list?category=${param.category}"
						class="btn negative w-100"> 취소 </a>
				</div>
				<div class="cell w-50">
					<button class="btn positive w-100">작성완료</button>
				</div>
			</div>
		</form>
	</div>


</div>



<!-- Flatpickr CSS (위에다 하면 적용이 안돼서 밑에다가 했음-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 한국어 설정 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>


<script type="text/javascript">
	flatpickr('#datetimepicker', {
		enableTime : true,
		dateFormat : "Y-m-d H:i",
		// 한국어 설정
		locale : "ko",
		// 시간을 위아래 버튼 30분 간격으로 설정
		//(근데 사용자가 직접 입력하면 그걸로 바뀌는데 어떻게 잠그는지 모르겠음)
		minuteIncrement : 30,
		time_24hr : true,
		minDate : "today",
		enableminute : false,
	});

</script>
