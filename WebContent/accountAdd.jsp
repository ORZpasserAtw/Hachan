<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>開始記帳📒</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperF" href="#RecordAccount" onclick="document.getElementById('Account').submit();">記錄</a>
            <%
        	if(request.getParameterMap().containsKey("date") && request.getParameterMap().containsKey("type")){
  				out.print("<a class=\"button bottom\" href=\"account.jsp?date="+request.getParameter("date")+"&type="+request.getParameter("type")+"\">回到記帳小本本</a>");
  			}else{
  				out.print("<a class=\"button bottom\" href=\"account.jsp\">回到記帳小本本</a>");
  			}
        	%>
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
				<div class=separate2>
					<label>
						<div>日期：</div><br>
						<div><input type="date" name="accountDate" value=<%=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date())%>></div><br>
					</label>
					<label>
						<div>分類：</div><br>
						<div>
							<select name="accountCat">
								<option value="A">支出-食</option>
								<option value="B">支出-衣</option>
								<option value="C">支出-住</option>
								<option value="D">支出-行</option>
								<option value="E">支出-育樂</option>
								<option value="F">支出-其他</option>
								<option value="Z">收入</option>
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
					<%
			       	if(request.getParameterMap().containsKey("date") && request.getParameterMap().containsKey("type")){
			       		out.print("<input type=\"hidden\" name=\"date\" value="+request.getParameter("date")+">");
			       		out.print("<input type=\"hidden\" name=\"type\" value="+request.getParameter("type")+">");
		 			}
			       	%>
				</div>
			</form>
		</div>
    </div>
    
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
</body>

</html>