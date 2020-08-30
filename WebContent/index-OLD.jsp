<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String cookieName = "";
	int cookieMoney = 0;
	Cookie cookies[] = request.getCookies();
	for (Cookie c : cookies) {
		if (c.getName().equals("tName")) {
			cookieName = c.getValue();
		}
		if (c.getName().equals("tMoney")) {
			cookieMoney = Integer.parseInt(c.getValue());
		}
	}
	for (int i = 0; i < cookies.length; i++) {
		out.println(cookies[i].getName() + ":\t" + java.net.URLDecoder.decode(cookies[i].getValue(),"utf-8") + "<BR>");
	}
	%>
	------------<br>
	cookieName = <%=cookieName%><br>
	cookieMoney = <%=cookieMoney%>
	<%@ page session="true"%>
	<form action="task" method="post">
		<br>
		Name: <input type="text" name="tName"> <br>
		Money:<input type="text" name="tMoney"> <br>
		<input type="submit" name="new" value="建立">
		<input type="submit" name="decrease" value="減少">
		<input type="submit" name="increase" value="增加"><br>
		Delete Cookie: <input type="text" name="DeleteText">
		<input type="submit" name="DeleteBTN"> <br>
	</form>
</body>
</html>