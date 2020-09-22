<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">
<title>Insert title here</title>
</head>
<body>
	<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	Cookie cookies[] = request.getCookies();
	if(request.getCookies() != null){
        for(Cookie cookie : request.getCookies()){

            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");

            out.println("<a href=cookieMod.jsp?listId="+cookieName+">" + cookieName + "=" + cookieValue + "</a><br/>");
        }
    }
	%>
	<h1>記帳</h1>
	<form action="Account" method="post">
		<br>
		Name: <input type="text" name="tName"> <br>
		Money:<input type="number" name="tMoney"> <br>
		<input type="submit" name="new" value="建立">
	</form>
</body>
</html>