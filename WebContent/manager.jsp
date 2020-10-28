<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.io.*,java.text.ParseException,java.util.Date,java.util.Calendar,java.util.ArrayList,java.util.Arrays,java.util.Comparator,java.util.Collections,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>助理💼</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
Cookie cookies[] = request.getCookies();
String[] split_line = new String[1];
%>
<body>
    <div class="header-low">
        <div class="navbar">
            <a class="button upperL" href="managerAdd.jsp">我要排程</a>
            <a class="button upperR" href="managerSearch.jsp">查詢行程</a>
        </div>
    </div>
    <div class="content">
			<%
			if (request.getCookies() != null) {
				ArrayList<ArrayList<String>> CookieList = new ArrayList<ArrayList<String>>();
				for (Cookie cookie : request.getCookies()) {
					String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
					String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					split_line = cookie.getValue().split("\\|");
					if (cookieName.contains("managerId_") && split_line[1].equals((new SimpleDateFormat("yyyy-MM-dd")).format(new Date()))) {
						if(split_line.length >= 5){
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
						}else{
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}
				}
				Collections.sort(CookieList, new Comparator<ArrayList<String>>() {    
			        @Override
			        public int compare(ArrayList<String> o1, ArrayList<String> o2) {
			        	System.out.print(o1.get(3) + o1.get(4) + o2.get(3) + o2.get(4));
			        	int c;
				        c = o1.get(3).compareTo(o2.get(3));
				        if (c == 0)
				           c = o1.get(4).compareTo(o2.get(4));
				        return c;
			        }
			    });
				for(int i = 0; i < CookieList.size(); i++) {
					out.println("<div class=\"separate2 cardview managerId\">");
					out.println("<form action=\"Manager\" method=\"post\" id=\"Manager\">");
					out.println("<label>");
					out.println("<div>日期：</div><br>");
					out.println("<div><input disabled type=\"date\" name=\"date\" value=" + CookieList.get(i).get(2) + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>時間：</div><br>");
					out.println("<div><input disabled type=\"time\" name=\"date\" value=" + CookieList.get(i).get(3) + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>名稱：</div><br>");
					out.println("<div><input disabled type=\"text\" value=" + URLDecoder.decode(CookieList.get(i).get(4), "UTF-8") + "></div><br>");
					out.println("</label>");
					
					out.println("<label>");
					out.println("<div>備註：</div><br>");
					if(CookieList.get(i).size() >= 6){
						out.println("<div><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\">" + URLDecoder.decode(CookieList.get(i).get(5), "UTF-8") + "</textarea></div><br>");
					}else{
						out.println("<div><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\"></textarea></div><br>");
					}
					out.println("</label>");
					out.println("<input type=\"hidden\" name=\"managerId\" value="+CookieList.get(i).get(0)+">");
					out.println("<input type=\"hidden\" name=\"del\">");
					out.println("</form>");
					out.println("</div>");
			    }
			}
			%>
    	</div>
    <div class="footer" style="margin-bottom: 62px;">
        臺北商業大學 夜四技資四甲專題 N109405<br>
        Copyright©2020 建議使用手機瀏覽並使用最新Chrome或Firefox<br>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>

</html>