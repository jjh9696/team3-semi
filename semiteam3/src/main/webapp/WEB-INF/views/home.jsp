<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript 예제</title>

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <!--<link rel="stylesheet" type="text/css" href="../css/test.css">-->

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- swiper js cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
    

    <style>
        .swiper {
            width: 100%;
/*             height: 300px; */
        }

    *{margin:0; padding: 0;}
    .sample{margin:0 20px}
    .responsive-img{width:100%}
  </style>

    <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
    <script type="text/javascript">

    $(document).ready(function() {
    	$('img[usemap]').rwdImageMaps();
    });
    $(function(){

        var swiper2 = new Swiper('.demo02', {
            //direction: 'vertical',//수평(horizontal) 또는 수직(vertical)
            loop: true,//슬라이드의 순환 여부를 설정(true/false)

            //자동재생 설정
            //autoplay: true,//기본설정
            autoplay: {
                delay: 5000,//전환간격(ms)
                pauseOnMouseEnter: true,//마우스가 올라가면 자동재생 중지
            },

            // 페이지 네비게이터 관련 설정
            pagination: {
                el: '.swiper-pagination',//el은 element(요소)를 의미
                clickable: true,//클릭 가능 여부 설정
                type:"bullets",//네비게이터 요소 모양(bullets, fraction, progresbar)
            },
         
        });
    });
    
    </script>
    
       <div class="container w-100%">
     <div class="cell">
                        
        </div>
        <div class="cell center">
            <!-- Slider main container -->
            <div class="swiper demo02">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <!-- Slides -->
                    <div class="swiper-slide"><img src="https://picsum.photos/id/25/1000/600"></div>
                    <div class="swiper-slide"><img src="https://picsum.photos/id/27/1000/600"></div>
                    <div class="swiper-slide"><img src="https://picsum.photos/id/28/1000/600"></div>
                    <div class="swiper-slide"><img src="https://picsum.photos/id/29/1000/600"></div>
                    <div class="swiper-slide"><img src="https://picsum.photos/id/33/1000/600"></div>
                </div>
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>

                <!-- If we need navigation buttons -->           </div>
        </div>
     

  <div class="sample">
    
    <!--이미지맵 코드 시작-->
    <!--img태그의 usemap속성의 값은  map 태그와 name가 동일해야 합니다.-->
    <!--usemap의 map이름 앞에 반드시 #을 붙여서 작성합니다. -->
    <img src="http://usingu.cdn3.cafe24.com/blog/imagemap-sample.jpg" usemap="#imagemap-sample1" class="responsive-img">
  
    <!--map태그의 name 속성의 값은 문서 내에서 중복되지 않고 유일해야합니다.-->
    <!--map태그의 id 속성을 추가하다면 name의 이름과 동일하게 지정합니다.-->
    <map name="imagemap-sample1">
      <area target="_blank" alt="일러스트레이터 튜토리얼로 이동" title="일러스트레이터 튜토리얼로 이동"
        href="https://helpx.adobe.com/kr/illustrator/tutorials.html" coords="71,352,270,503" shape="rect">
      <area target="_blank" alt="포토샵 튜토리얼 이동" title="포토샵 튜토리얼 이동"
        href="https://helpx.adobe.com/kr/photoshop/tutorials.html" coords="611,418,100" shape="circle">
      <area target="_blank" alt="MDN HTML Docs 이동" title="MDN HTML Docs 이동"
        href="https://developer.mozilla.org/ko/docs/Web/HTML" coords="279,206,226,270,400,367,397,273" shape="poly">
      <area target="_blank" alt="MDN CSS Docs 이동" title="MDN CSS Docs 이동"
        href="https://developer.mozilla.org/ko/docs/Web/CSS" coords="342,134,288,196,396,258,397,168" shape="poly">
      <area target="_blank" alt="MDN JS Docs 이동" title="MDN JS Docs 이동"
        href="https://developer.mozilla.org/ko/docs/Web/JavaScript" coords="345,130,399,158,399,65" shape="poly">
    </map>
    
    <--//이미지맵 코드 끝 -->
    
  </div>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
   <script>
   $(document).ready(function() {
	   $('img[usemap]').rwdImageMaps();
   });
   </script>
    
    