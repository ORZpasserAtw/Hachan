<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查詢行程💼LIFF-Bismarck</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
Cookie cookies[] = request.getCookies();
String[] split_line = new String[1];
%>
<body>
    <div class="header-low">
        <div class="navbar">
            <a class="button bottom" href="manager.jsp">回到行動助理</a>
        </div>
    </div>
    <div class="content" style="margin-bottom: 62px;">
   		<div class=separate2>
			<form action="#" method="get">
				<label>
		        <div>選擇日期：</div>
		        <div><input type="date" name="date" value=<%=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date())%>></div>
		   		</label>
			</form>
		</div>
		<%
		if (request.getCookies() != null) {
			for (Cookie cookie : request.getCookies()) {
				String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
				String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
				split_line = cookie.getValue().split("@");
				if (cookieName.contains("managerId_")) {
					out.println("<div class=\"separate2 cardview managerId\" onclick=\"location.href='managerModify.jsp?managerId="+cookieName+"'\">");
					out.println("<form action=\"Manager\" method=\"post\" id=\"Manager\">");
					out.println("<label>");
					out.println("<div>日期：</div><br>");
					out.println("<div><input disabled type=\"date\" name=\"date\" value=" + split_line[1] + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>時間：</div><br>");
					out.println("<div><input disabled type=\"time\" name=\"date\" value=" + split_line[2] + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>名稱：</div><br>");
					out.println("<div><input disabled type=\"text\" value=" + URLDecoder.decode(split_line[3], "UTF-8") + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>備註：</div><br>");
					if(split_line.length >= 5){
						out.println("<div><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\">" + URLDecoder.decode(split_line[4], "UTF-8") + "</textarea></div><br>");
					}else{
						out.println("<div><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\"></textarea></div><br>");
					}
					out.println("</label>");
					out.println("<input type=\"hidden\" name=\"managerId\" value="+cookieName+">");
					out.println("<input type=\"hidden\" name=\"del\">");
					out.println("</form>");
					out.println("</div>");
				}
			}
		}
		%>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.finger/0.1.6/jquery.finger.min.js"></script>
    <script src="main.js"></script>
</body>

</html>