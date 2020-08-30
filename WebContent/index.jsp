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

            out.println(cookieName + "=" + cookieValue + "<br/>");
        }
    }
	%>
	<form action="Account" method="post">
		<br>
		Name: <input type="text" name="tName"> <br>
		Money:<input type="number" name="tMoney"> <br>
		<input type="submit" name="new" value="建立">
		<input type="submit" name="decrease" value="減少">
		<input type="submit" name="increase" value="增加"><br>
		Delete Cookie: <input type="text" name="DeleteText">
		<input type="submit" name="DeleteBTN"> <br>
	</form>
</body>
</html>