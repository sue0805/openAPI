<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String emotion = request.getParameter("emotion"); %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript">
	$(function() {
		var randomPage = Math.floor(Math.random()*200)+1;
		$.ajax({
			//"키입력" 부분에 발급받은 키를 입력
			//&itemPerPage: 1-10위 까지의 데이터가 출력되도록 설정
					url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=03ee73a54a101036ad3954669ca2780a"
							+"&itemPerPage=100&curPage="+randomPage,
					dataType : "xml",
					success : function(data) {
						//감정 값 받는다.
						var emotion = "";
						//그 감정값으로 추천장르를 선택하는 변수를 초기화한다.
						var selectedGenre = "";
						
						var $data = $(data)
								.find("movie");
						//데이터를 테이블 구조에 저장. html의 table태그, class는 table로 하여 부트스트랩 적용
						if ($data.length > 0) {
							var table = $("<table/>").attr("class", "table");
							//<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
							var thead = $("<thead/>").append($("<tr/>"))
									.append(
											//추출하고자 하는 컬럼들의 타이틀 정의
											$("<th/>").html("&nbsp;&nbsp;대표 영화장르"),
											$("<th/>").html("&nbsp;영화명"),
											$("<th/>").html("&nbsp;&nbsp;개봉연도"),
											$("<th/>").html("&nbsp;&nbsp;대표 제작국가명"),
											);
							var tbody = $("<tbody/>");
							
						if(<%=emotion%> == 0){
							//장르 이름이 ""인 것만 출력 // 뽑아내
							selectedGenre = "액션";
						}else if(<%=emotion%> == 1){
							selectedGenre = "코미디";
						}else if(<%=emotion%> == 2){
							selectedGenre = "공포";
						}else if(<%=emotion%> == 3){
							selectedGenre = "스릴러";
						}else{
							selectedGenre = "애니";
						}
							$.each($data, function(i, o) {
								//오픈 API에 정의된 변수와 내가 정의한 변수 데이터 파싱
								var $repGenreNm = $(o).find("repGenreNm").text(); //영화 대표장르
								if($repGenreNm.indexOf(selectedGenre) != -1){
								var $movieNm = $(o).find("movieNm").text(); //영화명
								var $openDt = $(o).find("openDt").text(); //개봉 연도
								var $repNationNm = $(o).find("repNationNm").text(); //대표 제작 국가명
								var $movieCd = $(o).find("movieCd").text();
								//<tbody><tr><td>태그안에 파싱하여 추출된 데이터 넣기
								var row = $("<tr/>").append(
										$("<td/>").text($repGenreNm),
										$("<td id="+$movieCd+" onclick='goMovie(\""+$movieNm+"\")'>").html($movieNm),
										$("<td/>").text($openDt),
										$("<td/>").text($repNationNm),
										);
								tbody.append(row);
								}
							});// end of each 

							table.append(thead);
							table.append(tbody);
							$(".wrap").append(table);
						}
					},
					//에러 발생시 "영화 장르 로딩중"메시지가 뜨도록 한다.
					error : function() {
						alert("영화 장르 로딩중...");
					}
				});
	});
	
	function goMovie(movieNm){
		location.href = 'goMovie.jsp?movieNm='+movieNm;
	}
</script>
    <link rel="stylesheet" href="emotion.css" media="all" />

    <title>취준생 프로젝트</title>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html,
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        nav {
            z-index: 2;
            width: 100%;
            height: 30px;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            padding: 17px;
            background: linear-gradient(to left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
            display: none;
        }

        nav a {
            color: rgba(255, 255, 255, 0.5);
            text-decoration: none;
            font-size: 20px;
            margin: 0px 30px;
        }
        
        nav a:hover{
            color: rgba(255, 255, 255, 0.8)
        }

        footer {
            z-index: 2;
            width: 100%;
            height: 60px;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(to left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0));
            display: none;
        }

        footer div {
            color: rgba(255, 255, 255, 0.5);
            font-size: 20px;
            letter-spacing: 1px;
        }
        
        footer #p1{
            width: 49.5%;
            float: left;
            text-align: right;
            font-size: 40px;
            display: inline-block;
        }
        
        footer #p2{
            width: 49.5%;
            float: right;
            text-align: left
        }
        
        #container {
            overflow: hidden;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        #background_video {
            position: absolute;

            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            object-fit: cover;
            height: 100%;
            width: 100%;
        }

        #video_cover {
            position: absolute;

            width: 100%;
            height: 100%;

            background: url('video_cover.jpeg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        #video_controls {
            position: absolute;
            left: 50%;
            transform: translate(-50%, 0);
        }

        body {
            text-align: center;
            font-family: 'Malgun Gothic', 'Helvetica';
        }

        #container {
            height: 100%;
        }

        #overlay {
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
        }

        #main_content {
            z-index: 2;
            position: relative;
            display: inline-block;

            /* Vertical center */
            top: 50%;
            transform: translateY(-50%);
        }

        #main_content h1 {
            text-transform: uppercase;
            font-weight: 600;
            font-family: 'Malgun Gothic', 'Helvetica';
            color: #fff;
            font-size: 35px;
        }

        #main_content .sub_head {
            color: rgba(255, 255, 255, 0.5);
            font-size: 18px;
        }

        #main_content .info {
            color: rgba(255, 255, 255, 0.5);
            font-size: 12px;
            margin-top: 10px;
        }

        #links {
            margin-top: 50px;
        }

        #links a {
            border: 2px solid rgba(255, 255, 255, 0.20);
            border-radius: 61px;
            font-size: 12px;
            color: #FFFFFF;
            letter-spacing: 1px;
            text-decoration: none;
            text-transform: uppercase;
            padding: 10px 25px;
            display: inline-block;
            margin-right: 15px;
/*            visibility: hidden;*/
        }
        
        #links a:hover{
            background-color: rgba(0, 0, 0, 0.25);
            border: 2px solid rgba(255, 255, 255, 0.15);
        }
        
        tbody>tr>td:hover{
			background:#ccc;cursor;
		}
		
		h3{
			color: white;
		}
		
		.wrap{
			color: white;
		}

    </style>
</head>

<body>
    <jsp:include page="nav.jsp"/>
    <div id="container">
        <video id="background_video" loop muted></video>
        <div id="video_cover"></div>
        <div id="overlay"></div>

        <section id="main_content">
            <div id="head">
		       <h3>영화 장르</h3>
				<div class="wrap contaner"></div>
			</div>
        </section>
    </div>

    <footer>
        <div>
            <p id="p1"></p>
            <p id="p2">
            <span id="city"></span>
            <span id="country"></span><br>
            <span id="temper"></span>
            <span id="weather"></span>
            </p>
        </div>
    </footer>

    <script src="bideo.js"></script>
    <script src="main.js"></script>

    <script>
        if (window.location.host.indexOf('github.io') !== -1 && window.location.protocol !== "https:") {
            window.location.protocol = "https";
        }
	    
        setInterval(function time() {
            const today = new Date();
            const h = today.getHours();
            let m = today.getMinutes();
            m = checkTime(m);
            $('#p1').html(h + ":" + m);
            setTimeout(time, 500);
        }, 1000*60);

		function checkTime(time) {
		    if (time < 10) {time = "0" + time};
		    return time;
		}
    </script>
</body>
</html>
