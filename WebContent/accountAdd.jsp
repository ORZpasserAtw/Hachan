<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>記帳📒LIFF-Bismarck</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperF" href="#RecordAccount" onclick="document.getElementById('Account').submit();">記錄</a>
            <a class="button bottom" href="account.jsp">回到記帳小本本</a>
        </div>
    </div>
    <div class="content">
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
			<form action="Account" method="post" id="Account">
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
				<input type="hidden" name="new">
				</form>
			</div>
		
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
</body>

</html>