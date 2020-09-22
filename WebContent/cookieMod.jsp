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
	String[] split_line = new String[1];
	String target = request.getParameter("listId");
	if(request.getCookies() != null){
        for(Cookie cookie : request.getCookies()){

            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");

            out.println("<a href=cookieMod.jsp?listId="+cookieName+">" + cookieName + "=" + cookieValue + "</a><br/>");
            
            if (cookieName.equals(target)){
            	split_line = cookie.getValue().split("\\$");
            }
        }
    }
	%>
	<h1>修改舊帳</h1>
	<form action="Account" method="post">
		<br>
		<input type="hidden" name="listId" value=<%= target %>>
		Name: <input type="text" name="tName" value=<%= URLDecoder.decode(split_line[0], "UTF-8") %>> <br>
		Money:<input type="number" name="tMoney" value=<%= split_line[1] %>> <br>
		<input type="submit" name="mod" value="修改">
		<input type="submit" name="del" value="刪除">
	</form>
</body>
</html>