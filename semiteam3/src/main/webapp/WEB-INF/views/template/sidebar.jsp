<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.sidebar {
    position: sticky; /* 고정 위치 설정 */
    width: 200px;
    background-color: #333;
    color: #fff;
    padding: 20px;
    top: 200px;
    height: fit-content;
}

.sidebar a {
    display: block;
    color: #fff;
    text-decoration: none;
}
</style>
</head>
<body>

    <aside class="sidebar">
    	<div class="cell">
	      	<c:choose>
				<c:when test="${sessionScope.loginId !=null}">
					<div>
						<div class="cell">
							<a href="/member/mypage">${sessionScope.loginNick}</a>
							${memberDto.memberGrade}
						</div>
						<a href="/board/mywriting"><button>내가쓴 글</button></a>
						<a href="/board/mycomment"><button>내가쓴 댓글</button></a>
						<a href="/board/mylike"><button>찜목록</button></a>
					
					</div>
				</c:when>
				<c:otherwise>
					<a href="/member/login"> <i class="fa-regular fa-user"></i> 
					<button>로그인</button>
				</c:otherwise>
			</c:choose>
    	</div>
    	
		<div class="cell">
	        <a href="/inquiry/list">
	            <i class="fa-solid fa-question"></i>
	            <i class="fa-solid fa-list"></i>
	        </a>
        </div>
    </aside>

</body>
</html>
