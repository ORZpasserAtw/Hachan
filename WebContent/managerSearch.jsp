<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.io.*,java.text.ParseException,java.util.Date,java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat,java.util.ArrayList,java.util.Arrays,java.util.Comparator,java.util.Collections"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查詢行程💼</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap" rel="stylesheet">
    <link href="main.css" rel="stylesheet" />
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
Cookie cookies[] = request.getCookies();
String[] split_line = new String[1];

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
    <div class="header-low">
        <div class="navbar">
            <a class="button bottom" href="manager.jsp">回到呼叫助理</a>
        </div>
    </div>
    <div class="content" style="margin-bottom: 62px;">
   		<div class=separate2>
			<form action="managerSearch.jsp" method="get" id="filterform">
            		<label>
                    	<div>日期：</div>
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
	               		</div><br>
               		</label>
			</form>
		</div>
		<%!
		public void printManagerCard(HttpServletRequest request,JspWriter out,String cookieName,String split_line[]) throws IOException {
			if (request.getParameterMap().containsKey("date")){
				out.println("<div class=\"separate2 cardview managerId\" onclick=\"location.href='managerModify.jsp?managerId="+cookieName+"&date="+request.getParameter("date")+"'\">");
			}else{
				out.println("<div class=\"separate2 cardview managerId\" onclick=\"location.href='managerModify.jsp?managerId="+cookieName+"'\">");
			}
			out.println("<form action=\"Manager\" method=\"post\" id=\"Manager\">");
			out.println("<label>");
			out.println("<div>日期：</div><br>");
			out.println("<div><input disabled type=\"date\" name=\"date\" value=" + split_line[1] + "></div><br>");
			out.println("</label>");
			
			out.println("<label>");
			out.println("<div>時間：</div><br>");
			out.println("<div><input disabled type=\"time\" name=\"date\" value=" + split_line[2] + "></div><br>");
			out.println("</label>");
			
			out.println("<label>");
			out.println("<div>名稱：</div><br>");
			out.println("<div><input disabled type=\"text\" value=" + URLDecoder.decode(split_line[3], "UTF-8") + "></div><br>");
			out.println("</label>");
			
			out.println("<label>");
			out.println("<div>備註：</div><br>");
			if(split_line.length >= 5){
				out.println("<div style=\"height: 60px;\"><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\">" + URLDecoder.decode(split_line[4], "UTF-8") + "</textarea></div><br>");
			}else{
				out.println("<div style=\"height: 60px;\"><textarea disabled name=\"managerDesc\" rows=\"3\" cols=\"10\" maxlength=\"50\"></textarea></div><br>");
			}
			out.println("</label>");
			out.println("<input type=\"hidden\" name=\"managerId\" value="+cookieName+">");
			out.println("<input type=\"hidden\" name=\"del\">");
			out.println("<label>");
			out.println("<div><a>修改</a></div><br>");
			out.println("</label>");
			out.println("</form>");
			out.println("</div>");
		}
		%>
		<%
		if (request.getCookies() != null) {
			ArrayList<ArrayList<String>> CookieList = new ArrayList<ArrayList<String>>();
			if(request.getParameterMap().containsKey("date")){
				if (request.getParameter("date").contains("All")){
					for (Cookie cookie : request.getCookies()) {
						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						split_line = cookie.getValue().split("\\|");
						if (cookieName.contains("managerId_")) {
							if(split_line.length >= 5){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
							}else{
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}
				}else if(request.getParameter("date").contains("Month")){
					for (Cookie cookie : request.getCookies()) {
						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						split_line = cookie.getValue().split("\\|");
						if (cookieName.contains("managerId_")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[1]);
							if (d.getTime() >= firstDayOfMonth.getTime() && d.getTime() <= lastDayOfMonth.getTime()){
								if(split_line.length >= 5){
									CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
								}else{
									CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
								}
							}
						}
					}
      			}else if(request.getParameter("date").contains("Week")){
      				for (Cookie cookie : request.getCookies()) {
						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						split_line = cookie.getValue().split("\\|");
						if (cookieName.contains("managerId_")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[1]);
							if (d.getTime() >= firstDayOfWeek.getTime() && d.getTime() <= lastDayOfWeek.getTime()){
								if(split_line.length >= 5){
									CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
								}else{
									CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
								}
							}
						}
					}
      			}else if(request.getParameter("date").contains("Today")){
      				for (Cookie cookie : request.getCookies()) {
						String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
						String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
						split_line = cookie.getValue().split("\\|");
						if (cookieName.contains("managerId_") && split_line[1].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							if(split_line.length >= 5){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
							}else{
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}
      			}
			}else{
				for (Cookie cookie : request.getCookies()) {
					String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
					String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					split_line = cookie.getValue().split("\\|");
					if (cookieName.contains("managerId_") && split_line[1].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
						if(split_line.length >= 5){
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3],split_line[4])));
						}else{
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
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
				if (CookieList.get(i).size() >= 6){
					printManagerCard(request,out,CookieList.get(i).get(0),new String[] {CookieList.get(i).get(1),CookieList.get(i).get(2),CookieList.get(i).get(3),CookieList.get(i).get(4),CookieList.get(i).get(5)});
				} else {
					printManagerCard(request,out,CookieList.get(i).get(0),new String[] {CookieList.get(i).get(1),CookieList.get(i).get(2),CookieList.get(i).get(3),CookieList.get(i).get(4)});
				}
		    }
		}
		%>
    </div>
    <script charset="utf-8" src="https://static.line-scdn.net/liff/edge/2.1/sdk.js"></script>
    <script src="liff-starter.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="main.js"></script>
</body>

</html>