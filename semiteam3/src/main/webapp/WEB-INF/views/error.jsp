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
  position: ;
  left: 0;
  top: 0;
  width: 50%;
  height: 50%;
  z-index: -1;
  background-image: url("/image/home/nosilLogo.png");
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
      
    </div>
  </body>
</html>


	  	

