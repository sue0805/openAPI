<%@page import="openApi.Job"%>
<%@page import="java.util.List"%>
<%@page import="openApi.JobSearch"%>
<%@page import="openApi.OpenApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    JobSearch job = new JobSearch();
    List<Job> list = job.getList("");
    
    %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
        h1
	{
		color: white;
		text-align: center;
		margin-top: 50px;
		text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
 		-moz-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
		
	}
	h4
	{
		color:white;
		font-size:12px;
		text-align:center;
		margin-top:20px;
		margin-bottom: 20px;
	}
	
	a
	{
		text-decoration: none;
		color: white; 
		display: inline-block;
	}
	
	p a:hover
	{
		color: blue;
	}
	
	button
	{
		display: inline-block;
		border-top-left-radius: 25px;
		border-top-right-radius: 25px;
		border-bottom-left-radius: 25px;
        border-bottom-right-radius: 25px;
		padding: 10px;
		background-color: lightblue;
		border-style: none;
		width: 100px;
		margin: 10px auto;
		color: white;
		cursor: pointer;
		opacity: 0.7;
		
	}
	
	#btns button:hover
	{
		color: pink;
	}


	#btns{
		text-align: center;
	}
	#info{
		width: 600px;
		height: 500px;
		overflow-y: auto;
		margin: auto;
		padding: 50px 100px 50px 50px;
		color: white;
		border: 20px double white;
		opacity: 0.7;
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
		       <h1> 실시간 채용 공고</h1>
				<h4> 회사 명을 클릭하시면 해당 링크로 이동합니다.</h4>
				<div id="info">
				<%
					
					for(int i = 0; i < 10; i++)
					{
					%>
					<p style = "font-size: 20px; display:inline-block; margin: 15px auto;"><a href="<%=list.get(i).getLink() %>"><%=list.get(i).getName() %></a></p>
					<pre><%=list.get(i).getTitle() %></pre>
					<hr>	
					<%
					}
				%>
					<div id="btns">
						<button>더 알아보기</button>
					</div>
					
				</div>
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

    	var emotion = "";
		$('button').click(function(){
			var text = $('#say').val();
			$.ajax({
				url : 'emotion.do?say='+text,
				type : 'get',
				success : function(data){
					emotion = "";
					if(data == 0) emotion = "아주 나쁨";
					else if(data == 1) emotion = "나쁨";
					else if(data == 2) emotion = "그저 그래";
					else if(data == 3) emotion = "좋음";
					else emotion = "아주 좋음";
					$('h2').text(emotion);
					$('h2').hide().slideDown(500);
					$('#links').empty();
					$('<a href="movie.jsp?emotion='+data+'">이럴 땐 이 영화!</a>').appendTo('#links');
				}
			});
		});
        
	    
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
