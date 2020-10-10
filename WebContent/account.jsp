<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.io.*,java.util.Date,java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>記帳小本本📒</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
Cookie cookies[] = request.getCookies();
String[] split_line = new String[1];

long sum=0;

Calendar cal = Calendar.getInstance(); //sets the calendar to current date and time
cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY); //sets the calendar with starting day of week
DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd"); //printing of first and last day of th week
Date firstDayOfWeekFake = cal.getTime();
cal.add(Calendar.DATE, -1);
Date firstDayOfWeek = cal.getTime();
for (int i = 0; i<=6; i++)
{
      cal.add(Calendar.DATE, 1);
}
Date lastDayOfWeek = cal.getTime();

cal.setTime(new Date());
cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
Date firstDayOfMonthFake = cal.getTime();
cal.add(Calendar.DATE, -1);
Date firstDayOfMonth = cal.getTime();
cal.add(Calendar.DATE, 1);
cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
Date lastDayOfMonth = cal.getTime();
%>
<body>
    <div class="header">
        <div class="navbar">
            <a class="button upperL" href="accountAdd.jsp">開始記帳</a>
            <a class="button upperR" href="accountBalance.html">設定餘額</a>
            <a class="button bottom" href="account.jsp">回到記帳小本本</a>
        </div>
    </div>
    <div class="content">
            <div class=separate2>
            	<form action="account.jsp" method="get" id="dateform">
            		<label>
                    <div>選擇日期：</div>
	                    <div>
		              		<select name="date" class="dateselector">
		              			<%
		              			if(request.getParameterMap().containsKey("date")){
		              				if (request.getParameter("date").contains("All")){
			              				out.println("<option value=\"Today\">今天 "+dateformat.format(new Date())+"</option>");
			              				out.println("<option value=\"Week\">本週 "+dateformat.format(firstDayOfWeekFake)+"~"+dateformat.format(lastDayOfWeek)+"</option>");
			              				out.println("<option value=\"Month\">本月 "+dateformat.format(firstDayOfMonthFake)+"~"+dateformat.format(lastDayOfMonth)+"</option>");
			              				out.println("<option selected value=\"All\">全部</option>");
			              			}else if(request.getParameter("date").contains("Month")){
			              				out.println("<option value=\"Today\">今天 "+dateformat.format(new Date())+"</option>");
			              				out.println("<option value=\"Week\">本週 "+dateformat.format(firstDayOfWeekFake)+"~"+dateformat.format(lastDayOfWeek)+"</option>");
			              				out.println("<option selected value=\"Month\">本月 "+dateformat.format(firstDayOfMonthFake)+"~"+dateformat.format(lastDayOfMonth)+"</option>");
			              				out.println("<option value=\"All\">全部</option>");
			              			}else if(request.getParameter("date").contains("Week")){
			              				out.println("<option value=\"Today\">今天 "+dateformat.format(new Date())+"</option>");
			              				out.println("<option selected value=\"Week\">本週 "+dateformat.format(firstDayOfWeekFake)+"~"+dateformat.format(lastDayOfWeek)+"</option>");
			              				out.println("<option value=\"Month\">本月 "+dateformat.format(firstDayOfMonthFake)+"~"+dateformat.format(lastDayOfMonth)+"</option>");
			              				out.println("<option value=\"All\">全部</option>");
			              			}else if(request.getParameter("date").contains("Today")){
			              				out.println("<option selected value=\"Today\">今天 "+dateformat.format(new Date())+"</option>");
			              				out.println("<option value=\"Week\">本週 "+dateformat.format(firstDayOfWeekFake)+"~"+dateformat.format(lastDayOfWeek)+"</option>");
			              				out.println("<option value=\"Month\">本月 "+dateformat.format(firstDayOfMonthFake)+"~"+dateformat.format(lastDayOfMonth)+"</option>");
			              				out.println("<option value=\"All\">全部</option>");
			              			}
		              			}else{
		              				out.println("<option selected value=\"Today\">今天 "+dateformat.format(new Date())+"</option>");
		              				out.println("<option value=\"Week\">本週 "+dateformat.format(firstDayOfWeekFake)+"~"+dateformat.format(lastDayOfWeek)+"</option>");
		              				out.println("<option value=\"Month\">本月 "+dateformat.format(firstDayOfMonthFake)+"~"+dateformat.format(lastDayOfMonth)+"</option>");
		              				out.println("<option value=\"All\">全部</option>");
		              			}
		              			%>
			              	</select>
	               		</div>
               		</label>
            	</form>
            </div>
            <div class="separate2 cardview">
            	<form action="#" method="get">
            		<label>
                    <div>總支出：</div>
                 	<%
                 	sum = 0;
					if (request.getCookies() != null) {
						if(request.getParameterMap().containsKey("date")){
              				if (request.getParameter("date").contains("All")){
              					for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
	              			}else if(request.getParameter("date").contains("Month")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
        								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
        								if (!d.before(firstDayOfMonth) && !d.after(lastDayOfMonth)){
        									sum += Long.parseLong(split_line[3]);
        								}
        							}
        						}
	              			}else if(request.getParameter("date").contains("Week")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							
        							if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
        								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
        								if (!d.before(firstDayOfWeek) && !d.after(lastDayOfWeek)){
        									sum += Long.parseLong(split_line[3]);
        								}
        							}
        						}
	              			}else if(request.getParameter("date").contains("Today")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && !split_line[1].contains("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
	              			}
              			}else{
              				if (request.getCookies() != null) {
        						for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && !split_line[1].contains("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
        					}
              			}
					}
					%>
                    <div><input disabled type="number" value=<%= sum %>></div><br>
                	</label>
            	</form>
            </div>
       		<div class="separate2 cardview">
            	<form action="#" method="get">
                	<label>
                    <div>總收入：</div>
                 	<%
                 	sum = 0;
					if (request.getCookies() != null) {
						if(request.getParameterMap().containsKey("date")){
              				if (request.getParameter("date").contains("All")){
              					for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
	              			}else if(request.getParameter("date").contains("Month")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
        								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
        								if (!d.before(firstDayOfMonth) && !d.after(lastDayOfMonth)){
        									sum += Long.parseLong(split_line[3]);
        								}
        							}
        						}
	              			}else if(request.getParameter("date").contains("Week")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							
        							if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
        								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
        								if (!d.before(firstDayOfWeek) && !d.after(lastDayOfWeek)){
        									sum += Long.parseLong(split_line[3]);
        								}
        							}
        						}
	              			}else if(request.getParameter("date").contains("Today")){
	              				for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && split_line[1].contains("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
	              			}
              			}else{
              				if (request.getCookies() != null) {
        						for (Cookie cookie : request.getCookies()) {
        							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
        							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
        							split_line = cookie.getValue().split("\\|");
        							if (cookieName.contains("accountId_") && split_line[1].contains("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
        								sum += Long.parseLong(split_line[3]);
        							}
        						}
        					}
              			}
					}
					%>
                    <div><input disabled type="number" value=<%= sum %>></div>
                	</label>
            	</form>
            </div>
            <%! 
            public void printAccountCard(JspWriter out,String cookieName,String sl0,String sl1,String sl2,String sl3) throws IOException {
            	out.println("<div class=\"separate2 cardview accountId\" onclick=\"location.href='accountModify.jsp?accountId="+cookieName+"'\">");
				out.println("<form action=\"Account\" method=\"post\" id=\"Account\">");
				out.println("<label>");
				out.println("<div>日期：</div><br>");
				out.println("<div><input disabled type=\"date\" name=\"date\" value=" + sl0 + "></div><br>");
				out.println("</label>");
				String AccountCat = "";
				if (sl1.equals("A")){
					AccountCat = "支出-食";
				}else if(sl1.equals("B")){
					AccountCat = "支出-衣";
				}else if(sl1.equals("C")){
					AccountCat = "支出-住";
				}else if(sl1.equals("D")){
					AccountCat = "支出-行";
				}else if(sl1.equals("E")){
					AccountCat = "支出-育樂";
				}else if(sl1.equals("F")){
					AccountCat = "支出-其他";
				}else if(sl1.equals("Z")){
					AccountCat = "收入";
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
				out.println("<div><input disabled type=\"text\" value=" + URLDecoder.decode(sl2, "UTF-8") + "></div><br>");
				out.println("</label>");
				
				out.println("<label>");
				out.println("<div>金額：</div><br>");
				out.println("<div><input disabled type=\"number\" value=" + sl3 + "></div><br>");
				out.println("</label>");
				out.println("<input type=\"hidden\" name=\"accountId\" value="+cookieName+">");
				out.println("<input type=\"hidden\" name=\"del\">");
				out.println("</form>");
				out.println("</div>");
            }
			%>
			<%
			
			if (request.getCookies() != null) {
				if(request.getParameterMap().containsKey("date")){
					if (request.getParameter("date").contains("All")){
						for (Cookie cookie : request.getCookies()) {
							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
							split_line = cookie.getValue().split("\\|");
							
							if (cookieName.contains("accountId_")) {
								printAccountCard(out, cookieName, split_line[0], split_line[1],split_line[2],split_line[3]);
							}
						}
					} else if(request.getParameter("date").contains("Month")){
						for (Cookie cookie : request.getCookies()) {
							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
							split_line = cookie.getValue().split("\\|");
							if (cookieName.contains("accountId_")) {
								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
								if (d.getTime() >= firstDayOfMonth.getTime() && d.getTime() <= lastDayOfMonth.getTime()){
									printAccountCard(out, cookieName, split_line[0], split_line[1],split_line[2],split_line[3]);
								}
							}
						}
          			}else if(request.getParameter("date").contains("Week")){
          				for (Cookie cookie : request.getCookies()) {
							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
							split_line = cookie.getValue().split("\\|");
							if (cookieName.contains("accountId_")) {
								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
								if (d.getTime() >= firstDayOfWeek.getTime() && d.getTime() <= lastDayOfWeek.getTime()){
									printAccountCard(out, cookieName, split_line[0], split_line[1],split_line[2],split_line[3]);
								}
							}
						}
          			}else if(request.getParameter("date").contains("Today")){
          				for (Cookie cookie : request.getCookies()) {
    						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
    						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
    						split_line = cookie.getValue().split("\\|");
    						if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    							printAccountCard(out, cookieName, split_line[0], split_line[1],split_line[2],split_line[3]);
    						}
    					}
          			}
				}else{
					for (Cookie cookie : request.getCookies()) {
						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						split_line = cookie.getValue().split("\\|");
						if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							printAccountCard(out, cookieName, split_line[0], split_line[1],split_line[2],split_line[3]);
						}
					}
				}
			}
			%>
    </div>
    <div class="footer">
        臺北商業大學 夜四技資四甲專題 N109405<br>
        Copyright©2020 建議使用手機瀏覽並使用最新Chrome或Firefox<br>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.finger/0.1.6/jquery.finger.min.js"></script>
    <script src="main.js"></script>
</body>

</html>