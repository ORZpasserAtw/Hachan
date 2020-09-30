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
	String[] split_line = new String[10];
	String target = request.getParameter("accountId");
	if(request.getCookies() != null){
        for(Cookie cookie : request.getCookies()){
        	
            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
            if (cookieName.contains("accountId_")){
				out.println("<a href=accountModify.jsp?accountId="+cookieName+">" + cookieName + "=" + cookieValue + "</a><br/>");
			}
            
            if (cookieName.equals(target)){
            	split_line = cookie.getValue().split("\\|");
            }
            System.out.println(split_line[0]);
        }
    }
	%>
	<h1>修改舊帳</h1>
	<form action="Account" method="post">
		<br>
		<input type="hidden" name="accountId" value=<%= target %>>

		<label>
			<div>日期：</div><br>
			<div><input type="date" name="accountDate" value=<%= split_line[0] %>></div><br>
		</label>
		<label>
			<div>分類：</div><br>
			<div>
				<select name="accountCat" default=<%= split_line[1] %>>
					<option value="A">食</option>
					<option value="B">衣</option>
					<option value="C">住</option>
					<option value="D">行</option>
					<option value="E">育樂</option>
				</select>
			</div><br>
		</label>
		<label>
			<div>事件：</div><br>
			<div><input type="text" name="accountName" value=<%= URLDecoder.decode(split_line[2], "UTF-8") %>></div><br>
        </label>
        <label>
        	<div>金額：</div><br>
			<div><input type="number" name="accountMoney" value=<%= split_line[3] %>></div><br>
		</label>


		<input type="submit" name="mod" value="修改">
		<input type="submit" name="del" value="刪除">
	</form>
</body>
</html>