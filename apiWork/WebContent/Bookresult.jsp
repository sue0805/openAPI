<%@page import="java.util.List"%>
<%@page import="booksearch.Book"%>
<%@page import="booksearch.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("sh");
	System.out.println(keyword);
	Search search = new Search();
	List<Book> list = search.serachBook(keyword, 15, 1);
	
	pageContext.setAttribute("list", list);

%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

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
        
        h2 {
        	color: white;
            font-family: 'Nanum Gothic', sans-serif;
            font-size : 30px;
            padding: 30px 0px 20px 30px;
        }
        hr {
            width: 1100px;
            border: solid 1px white;
            float: left;
            margin-left: 30px;
        }
        .reuslt {
         	padding : 15px 0px 20px 20px;
         	font-family: 'Nanum Gothic', sans-serif;
         	font-size : 20px;
			background-color : #222;
			opacity : 0.5;
			color : white;
			width : 1100px;
			height: 500px;
			margin: auto;
			overflow: auto;
        }
        
        a {
	        text-decoration: none;
	        color : white;
        }
        
        p {
	        color : white;
	        margin-bottom: 10px;
	        font-family: 'Nanum Gothic', sans-serif;
        }
        
        #p {
	        color : darkgray;
	        margin-bottom: 15px;
	        margin-left : 30px;
	        font-family: 'Nanum Gothic', sans-serif;
        }

    </style>

    <script src="https://use.typekit.net/nlq1kdt.js"></script>
    <script>
        try {
            Typekit.load({
                async: true
            });
        } catch (e) {}
    </script>
</head>

<body>
	<jsp:include page="nav.jsp"/>
    <div id="container">
        <video id="background_video" loop muted></video>
        <div id="video_cover"></div>
        <div id="overlay"></div>

        <section id="main_content">
            <h2><strong><i class="fa fa-book">&ensp;</i>책 검색</strong></h2>
		    <hr><br>
		    <p id="p"><strong>관련 도서 홈페이지로 이동하려면 도서제목을 클릭하세요.</strong></p>
		    <div class="reuslt">
    
			<%for(int i = 0; i < list.size(); i++){ %>
				<p><%=i+1 %>&emsp;<a href='<%=list.get(i).getLink()%>'><%=list.get(i).getTitle() %></a><br></p>
			<%} %>
			</div>
        </section>
    </div>
 
    <footer>
        <div>
            <p id="p1">19:00</p>
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
