<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    
    
<form action="edit" method="post" autocomplete="off">
    <input type="hidden" name="boardNo" value="${boardDto.boardNo}">

<div class="container w-800">
    <div class="cell center"><h1>게시글 수정</h1></div>
    <div class="cell">
        <label>제목</label>
        <input type="text" name="boardTitle" required class="tool w-100" value="${boardDto.boardTitle}">
    </div>
    <div class="cell">
        <label>내용</label>
        <%-- textarea는 시작태그와 종료태그 사이에 내용을 작성 --%>
        <textarea name="boardContent" required class="tool w-100" rows="10">${boardDto.boardContent}</textarea>
    </div>
    <div class="cell right">
        <a href="list" class="btn">목록</a>
        <button class="btn positive">수정</button>
    </div>
</div>
</form>