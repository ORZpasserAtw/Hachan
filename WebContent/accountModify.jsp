<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改舊帳📒</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperL" href="#SaveAccount" onclick="document.getElementById('Account').mod.value='Y';document.getElementById('Account').submit();">紀錄</a>
            <a class="button upperR" href="#DelAccount"  onclick="document.getElementById('Account').del.value='Y';document.getElementById('Account').submit();">刪除</a>
            <a class="button bottom" href="account.jsp">回到記帳小本本</a>
        </div>
    </div>
    <div class="content">
    	<%	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Cookie cookies[] = request.getCookies();
		String[] split_line = new String[1];
		String target = request.getParameter("accountId");
		if(request.getCookies() != null){
	        for(Cookie cookie : request.getCookies()){
	
	            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
	            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	            
	            if (cookieName.equals(target)){
	            	split_line = cookie.getValue().split("\\|");
	            }
	        }
	    }
		%>
		<div class="separate2 cardview">
			<form action="Account" method="post" id="Account">
				<input type="hidden" name="accountId" value=<%= target %>>
	            <div class=separate2>
	            <label>
					<div>日期：</div><br>
					<div><input type="date" name="accountDate" value=<%= split_line[0] %>></div><br>
				</label>
				<label>
					<div>分類：</div><br>
						<div>
							<select name="accountCat" >
								<%
								if (split_line[1].equals("A")){
									out.println("<option selected value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("B")){
									out.println("<option value=\"A\">支出-食</option>");
									out.println("<option selected value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("C")){
									out.println("<option value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option selected value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("D")){
									out.println("<option value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option selected value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("E")){
									out.println("<option selected value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option selected value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("F")){
									out.println("<option selected value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option selected value=\"F\">支出-其他</option>");
									out.println("<option value=\"Z\">收入</option>");
								}else if(split_line[1].equals("Z")){
									out.println("<option selected value=\"A\">支出-食</option>");
									out.println("<option value=\"B\">支出-衣</option>");
									out.println("<option value=\"C\">支出-住</option>");
									out.println("<option value=\"D\">支出-行</option>");
									out.println("<option value=\"E\">支出-育樂</option>");
									out.println("<option value=\"F\">支出-其他</option>");
									out.println("<option selected value=\"Z\">收入</option>");
								}
								%>
							</select>
						</div>
					<br>
				</label>
				<label>
					<div>事件：</div><br>
					<div><input type="text" name="accountName" value=<%= URLDecoder.decode(split_line[2], "UTF-8") %>></div><br>
		        </label>
		        <label>
		        	<div>金額：</div><br>
					<div><input type="number" name="accountMoney" value=<%= split_line[3] %>></div><br>
				</label>
	            </div>
				<input type="hidden" name="mod">
				<input type="hidden" name="del">
			</form>
		</div>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>

</html>