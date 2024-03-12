<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--템플릿 페이지를 불러오는 코드 --%>

<style>
	body {
  margin: 0;
  /* 확대시켜서 스크롤 생기는 거 가려줌 */
  overflow: hidden;
}

/* 글씨를 화면 가운데에 위치 */
.background-blur {
  font-size: 50px;
  display: flex;
  height: 80vh;
  justify-content: right;
  align-items: center;
  color:white
}

/* background-image blur */
.background-blur::before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
  background-image: url("https://picsum.photos/400/400");
  background-size: cover; 
  background-repeat: no-repeat;
  background-position: center;
  /* 배경 블러 */
  filter: blur(5px);
  transform: scale(1.1);
}


	
</style>
 <body>
    <div class="background-blur">
      <h5>일시적 오류가 발생했습니다</h5>
    </div>
  </body>
</html>


	  	
<%--템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>	 
