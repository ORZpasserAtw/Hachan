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
	<form action="Manager" method="post">
		<div class=separate3>
                <label>提醒</label><br>
                <label><input type="radio" name="managerRemind" value="Y" checked>是</label><br>
                <label><input type="radio" name="managerRemind" value="N">否</label><br>
            </div>
            <div class=separate2>
                <label>
                    <div>選擇日期：</div><br>
                    <div><input type="date" name="managerDate" value=<%=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date())%>></div><br>
                </label>
                <label>
                    <div>選擇時間：</div><br>
                    <div><input type="time" name="managerTime" value=<%=(new SimpleDateFormat("HH:mm")).format(new Date())%>></div><br>
                </label>
                <label>
                    <div>活動名稱：</div><br>
                    <div><input type="text" name="managerName"></div><br>
                </label>
                <label>
                    <div>備註：</div><br>
                    <div><textarea name="managerDesc" rows="3" cols="10" maxlength="50"></textarea></div><br>
                </label>
            </div>
		<input type="submit" name="new" value="建立">
	</form>
</body>
</html>