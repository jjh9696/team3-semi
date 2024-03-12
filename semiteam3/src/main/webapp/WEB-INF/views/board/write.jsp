<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="/css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
    <link rel="stylesheet" type="text/css" href="/css/layout.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <script src="/js/exit.js"></script>
    
    <div class="container w-800">
	<div class="cell">
		<h2>게시글 작성</h2>
	</div>
	<div class="cell">
		<form class="free-pass" action="write" method="post">
			<div class="cell">
				<select class="tool w-30" name="boardCategory">
				<option value="">카테고리</option>
				<option value="축구">축구</option>
				<option value="농구">농구</option>
				<option value="야구">야구</option>
				<option value="E-스포츠">E-스포츠</option>
				<option value="관리자">관리자</option>
			</select>
			</div>
			
			<div class="cell">
				마감일
			</div>
			
			<div class="cell">
				<input class="tool w-100" name="boardTitle" type="text" placeholder="제목">
			</div> 
			<div class="cell">
				<textarea class="tool w-100" name="boardContent" placeholder="내용 입력"></textarea>
			</div>
			<div class="flex-cell">
				<div class="w-100 left">
					<button class="btn negative">
						취소
					</button>
				</div>
				<div class="w-100 right">
					<button class="btn positive">
						작성완료
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
    
    