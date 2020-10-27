<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我要排程💼</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperF" href="#SaveManager" onclick="document.getElementById('Manager').submit();">保存</a>
            <a class="button bottom" href="manager.jsp">回到呼叫助理</a>
        </div>
    </div>
    <div class="content" style="height: 150vh;">
		<%--	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Cookie cookies[] = request.getCookies();
	
	
		if(request.getCookies() != null){
        for(Cookie cookie : request.getCookies()){
            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
            if (cookieName.contains("accountId_")){
				out.println("<a href=accountModify.jsp?accountId="+cookieName+">" + cookieName + "=" + cookieValue + "</a><br/>");
				}
        	}
    	}
		--%>
		
		<div class="separate2 cardview">
			<form action="Manager" method="post" id="Manager">
	            <input type="hidden" name="managerRemind" value="N" checked>
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
				<input type="hidden" name="new">
			</form>
		</div>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
</body>

</html>