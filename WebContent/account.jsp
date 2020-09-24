<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>記帳小本本📒LIFF-Bismarck</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>

<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperL" href="accountAdd.jsp">開始記帳</a>
            <a class="button upperR" href="accountBalance.jsp">設定餘額</a>
            <a class="button bottom" href="account.jsp">回到記帳小本本</a>
        </div>
    </div>
    <div class="content">
        <form action="#" method="get">
            <div class=separate2>
                <label>
                    <div>選擇日期：</div>
                    <div><input type="date" name="date"></div>
                </label>
            </div>
			<%
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			Cookie cookies[] = request.getCookies();
			String[] split_line = new String[1];
			String AccountCat = "";
			if (request.getCookies() != null) {
				for (Cookie cookie : request.getCookies()) {
					String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
					String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					if (cookieName.contains("accountId_")) {
						split_line = cookie.getValue().split(" ");
						out.println("<div class=\"separate2 cardview\">");
						
						out.println("<label>");
						out.println("<div>日期：</div><br>");
						out.println("<div><input disabled type=\"date\" name=\"date\" value=" + split_line[0] + "></div><br>");
						out.println("</label>");
						
						if (split_line[1].equals("A")){
							AccountCat = "食";
						}else if(split_line[1].equals("B")){
							AccountCat = "衣";
						}else if(split_line[1].equals("C")){
							AccountCat = "住";
						}else if(split_line[1].equals("D")){
							AccountCat = "行";
						}else if(split_line[1].equals("E")){
							AccountCat = "育樂";
						}
						out.println("<label>");
						out.println("<div>分類：</div><br>");
						out.println("<div><select disabled class=\"AccountCat\">");
						out.println("<option selected>"+ AccountCat +"</option>");
						out.println("</select>");
						out.println("</div><br>");
						out.println("</label>");
						
						out.println("<label>");
						out.println("<div>事件：</div><br>");
						out.println("<div><input disabled type=\"text\" name=\"title\" value=" + URLDecoder.decode(split_line[2], "UTF-8") + "></div><br>");
						out.println("</label>");
						
						out.println("<label>");
						out.println("<div>金額：</div><br>");
						out.println("<div><input disabled type=\"number\" name=\"title\" value=" + split_line[3] + "></div><br>");
						out.println("</label>");
						
						out.println("</div>");
					}
				}
			}
			%>
        </form>
    </div>
    <div class="footer">
        <a href="indexold.html">this is footer</a>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
</body>

</html>