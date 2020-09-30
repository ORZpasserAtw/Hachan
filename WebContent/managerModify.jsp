<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改行程💼LIFF-Bismarck</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperL" href="#SaveManager" onclick="document.getElementById('Manager').submit();">保存</a>
            <a class="button upperR" href="#RecoveryManager"  onclick="document.getElementById('Manager').reset();">復原</a>
            <a class="button bottom" href="manager.jsp">回到行動助理</a>
        </div>
    </div>
    <div class="content">
    	<%	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Cookie cookies[] = request.getCookies();
		String[] split_line = new String[1];
		String target = request.getParameter("managerId");
		if(request.getCookies() != null){
	        for(Cookie cookie : request.getCookies()){
	
	            String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
	            String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	            
	            if (cookieName.equals(target)){
	            	split_line = cookie.getValue().split("@");
	            }
	        }
	    }
		%>
		<div class="separate2 cardview">
			<form action="Manager" method="post" id="Manager">
				<input type="hidden" name="managerId" value=<%= target %>>
				<div class=separate3>
	                <label>提醒</label>
	                 <%
	                 if (split_line[0].equals("Y")){
	                	 out.println("<label><input type=\"radio\" name=\"managerRemind\" value=\"Y\" checked>是</label>");
	                	 out.println("<label><input type=\"radio\" name=\"managerRemind\" value=\"N\">否</label>");
	                 } else {
	                	 out.println("<label><input type=\"radio\" name=\"managerRemind\" value=\"Y\">是</label>");
	                	 out.println("<label><input type=\"radio\" name=\"managerRemind\" value=\"N\" checked>否</label>");
	                 }
	                 %>
	            </div>
	            <div class=separate2>
	                <label>
	                    <div>選擇日期：</div><br>
	                    <div><input type="date" name="managerDate" value=<%= split_line[1] %>></div><br>
	                </label>
	                <label>
	                    <div>選擇時間：</div><br>
	                    <div><input type="time" name="managerTime" value=<%= split_line[2] %>></div><br>
	                </label>
	                <label>
	                    <div>活動名稱：</div><br>
	                    <div><input type="text" name="managerName" value=<%= URLDecoder.decode(split_line[3], "UTF-8") %>></div><br>
	                </label>
	                <label>
	                    <div>備註：</div><br>
	                    <%
	                    if(split_line.length >= 5){
							out.println("<div><textarea name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\">" + URLDecoder.decode(split_line[4], "UTF-8") + "</textarea></div><br>");
						}else{
							out.println("<div><textarea name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\"></textarea></div><br>");
						}
	                    %>
	                </label>
	            </div>
				<input type="hidden" name="mod">
			</form>
		</div>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="plugin/jquery.finger.min.js"></script>
    <script src="main.js"></script>
</body>

</html>