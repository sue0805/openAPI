<%@page import="api.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("movieNm");
    Movie m = new Movie();
    String movies = m.searchMovie(name);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h1></h1>
	<script>
	var movie = <%=movies %>;
	console.log(movie);
	for(let i = 0; i < movie.total; i++){
		if(movie.items[i].title.indexOf("<%=name %>") != -1){
			location.href = movie.items[i].link;
		}
	}
	</script>
</body>
</html>