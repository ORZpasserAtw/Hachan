<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
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
            if (cookieName.contains("managerId_")){
				out.println("<a href=accountModify.jsp?accountId="+cookieName+">" + cookieName + "=" + cookieValue + "</a><br/>");
			}
            
            
            
        }
    }
	%>
	<h1>記帳</h1>
	<form action="Account" method="post">
		<label>
			<div>日期：</div><br>
			<div><input type="date" name="accountDate" value=<%=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date())%>></div><br>
		</label>
		<label>
			<div>分類：</div><br>
			<div>
				<select name="accountCat">
					<option value="A">食</option>
					<option value="B">衣</option>
					<option value="C">住</option>
					<option value="D">行</option>
					<option value="E">育樂</option>
				</select>
			</div>
			<br>
		</label>
		<label>
			<div>事件：</div><br>
			<div><input type="text" name="accountName"></div><br>
        </label>
        <label>
        	<div>金額：</div><br>
			<div><input type="number" name="accountMoney"></div><br>
		</label>
		<input type="submit" name="new" value="建立">
	</form>
</body>
</html>