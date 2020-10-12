<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.io.*,java.text.ParseException,java.util.Date,java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat"/>
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
            	<form action="account.jsp" method="get" id="filterform">
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
            		<input type="hidden" name="type" value="All">
            	</form>
            </div>
            <div class="separate2 cardview">
            	<form action="#" method="get" id="Sumbox">
                	<label>
                    <div>結餘：</div>
                    <%! 
                    public long getSum(HttpServletRequest request, int mode, long sum, Date start, Date end) throws ParseException,IOException{
                    	for (Cookie cookie : request.getCookies()) {
                    		String[] split_line = new String[1];
							String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
							String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
							split_line = cookie.getValue().split("\\|");
                    		
							if (mode == 1){ //All Out
								if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 2){ //Month and Week Out
								if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 3){ //Today Out
								if (cookieName.contains("accountId_") && !split_line[1].contains("Z")) {
									if (cookieName.contains("accountId_") && !split_line[1].contains("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if (mode == 11){
								if (cookieName.contains("accountId_") && split_line[1].contains("A")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 12){
								if (cookieName.contains("accountId_") && split_line[1].contains("A")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 13){
								if (cookieName.contains("accountId_") && split_line[1].contains("A")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if(mode == 21){
								if (cookieName.contains("accountId_") && split_line[1].contains("B")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 22){
								if (cookieName.contains("accountId_") && split_line[1].contains("B")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 23){
								if (cookieName.contains("accountId_") && split_line[1].contains("B")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if(mode == 31){
								if (cookieName.contains("accountId_") && split_line[1].contains("C")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 32){
								if (cookieName.contains("accountId_") && split_line[1].contains("C")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 33){
								if (cookieName.contains("accountId_") && split_line[1].contains("C")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if(mode == 41){
								if (cookieName.contains("accountId_") && split_line[1].contains("D")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 42){
								if (cookieName.contains("accountId_") && split_line[1].contains("D")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 43){
								if (cookieName.contains("accountId_") && split_line[1].contains("D")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if(mode == 51){
								if (cookieName.contains("accountId_") && split_line[1].contains("E")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 52){
								if (cookieName.contains("accountId_") && split_line[1].contains("E")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 53){
								if (cookieName.contains("accountId_") && split_line[1].contains("E")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if(mode == 61){
								if (cookieName.contains("accountId_") && split_line[1].contains("F")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 62){
								if (cookieName.contains("accountId_") && split_line[1].contains("F")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 63){
								if (cookieName.contains("accountId_") && split_line[1].contains("F")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}else if (mode == 101){ //All In
								if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
									sum += Long.parseLong(split_line[3]);
								}
							}else if(mode == 102){ //Month and Week In
								if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
    								Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
    								if (!d.before(start) && !d.after(end)){
    									sum += Long.parseLong(split_line[3]);
    								}
    							}
							}else if(mode == 103){ //Today In
								if (cookieName.contains("accountId_") && split_line[1].contains("Z")) {
									if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
    									sum += Long.parseLong(split_line[3]);
    								}
								}
							}
						}
                    	return sum;
                    }
                    %>
                 	<%
                 	long sumIn = 0;
					if (request.getCookies() != null) {
						if(request.getParameterMap().containsKey("date") && request.getParameterMap().containsKey("type")){
              				if (request.getParameter("date").contains("All")){
              					sumIn = getSum(request, 101, sumIn, null, null);
	              			}else if(request.getParameter("date").contains("Month")){
	              				sumIn = getSum(request, 102, sumIn, firstDayOfMonth, lastDayOfMonth);
	              			}else if(request.getParameter("date").contains("Week")){
	              				sumIn = getSum(request, 102, sumIn, firstDayOfWeek, lastDayOfWeek);
	              			}else if(request.getParameter("date").contains("Today")){
	              				sumIn = getSum(request, 103, sumIn, null, null);
	              			}
              			}else{
              				sumIn = getSum(request, 103, sumIn, null, null);
              			}
					}
					%>
                 	<%
                 	long sumOut = 0;
					if (request.getCookies() != null) {
						if(request.getParameterMap().containsKey("date")){
              				if (request.getParameter("date").contains("All")){
              					sumOut = getSum(request, 1, sumOut, null, null);
	              			}else if(request.getParameter("date").contains("Month")){
	              				sumOut = getSum(request, 2, sumOut, firstDayOfMonth, lastDayOfMonth);
	              			}else if(request.getParameter("date").contains("Week")){
	              				sumOut = getSum(request, 2, sumOut, firstDayOfWeek, lastDayOfWeek);
	              			}else if(request.getParameter("date").contains("Today")){
	              				sumOut = getSum(request, 3, sumOut, null, null);
	              			}
              			}else{
              				sumOut = getSum(request, 3, sumOut, null, null);
              			}
					}
					%>
					<%
					out.println("<div style=\"width: 80%;\"><input disabled type=\"text\" value=收入("+sumIn+")-支出("+sumOut+")="+(sumIn-sumOut)+"></div>");
					%>
                	</label>
            	</form>
            </div>
            <div class="separate2 cardview">
            	<form action="#" method="get" id="Sumbox">
                	<label>
	                	<div>收入：</div><br>
	                	<%
	                	if (request.getCookies() != null){
	                		if(request.getParameterMap().containsKey("date")){
	                        	if (request.getParameter("date").contains("All")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 101, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=Z\">明細</a></div><br>");
	                        	}else if(request.getParameter("date").contains("Month")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 102, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=Z\">明細</a></div><br>");
	                        	}else if(request.getParameter("date").contains("Week")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 102, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=Z\">明細</a></div><br>");
	                        	}else if(request.getParameter("date").contains("Today")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 103, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=Z\">明細</a></div><br>");
	                        	}
	                        }else{
	                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 103, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=Z\">明細</a></div><br>");
	                        }
	                	}else{
		               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	                	}
                    	%>
                	</label>
                </form>
            </div>
       		<div class="separate2 cardview">
            	<form action="#" method="get" id="Sumbox">
            		<label>
	                	<div>支出：</div><br>
	                	<%
	                	if (request.getCookies() != null){
	                		if(request.getParameterMap().containsKey("date")){
	                        	if (request.getParameter("date").contains("All")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 1, 0, null, null)+"></div><br>");
	                        	}else if(request.getParameter("date").contains("Month")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 2, 0, firstDayOfMonth, lastDayOfMonth)+"></div><br>");
	                        	}else if(request.getParameter("date").contains("Week")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 2, 0, firstDayOfWeek, lastDayOfWeek)+"></div><br>");
	                        	}else if(request.getParameter("date").contains("Today")){
	                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 3, 0, null, null)+"></div><br>");
	                        	}
	                        }else{
	                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 3, 0, null, null)+"></div><br>");
	                        }
	                	}else{
		               		out.println("<div><input disabled type=\"text\" value=\"0\"></div><br>");
	                	}
                    	%>
                	</label>
                	<%
                	if (request.getCookies() != null){
                		if(request.getParameterMap().containsKey("date")){
                        	if (request.getParameter("date").contains("All")){
                        		out.println("<label>");
                            	out.println("<div>　食：</div><br>");
                            	out.println("<div><input disabled type=\"text\" value="+getSum(request, 11, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=A\">明細</a></div><br>");
                            	out.println("</label>");
                            	out.println("<label>");
                            	out.println("<div>　衣：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 21, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=B\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　住：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 31, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=C\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　行：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 41, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=D\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>育樂：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 51, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=E\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>其他：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 61, 0, null, null)+"><a href=\"accountDetail.jsp?date=All&type=F\">明細</a></div><br>");
                        		out.println("</label>");
                        	}else if(request.getParameter("date").contains("Month")){
                            	out.println("<label>");
                            	out.println("<div>　食：</div><br>");
                            	out.println("<div><input disabled type=\"text\" value="+getSum(request, 12, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=A\">明細</a></div><br>");
                            	out.println("</label>");
                            	out.println("<label>");
                            	out.println("<div>　衣：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 22, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=B\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　住：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 32, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=C\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　行：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 42, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=D\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>育樂：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 52, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=E\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>其他：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 62, 0, firstDayOfMonth, lastDayOfMonth)+"><a href=\"accountDetail.jsp?date=Month&type=F\">明細</a></div><br>");
                        		out.println("</label>");
                        	}else if(request.getParameter("date").contains("Week")){
                            	out.println("<label>");
                            	out.println("<div>　食：</div><br>");
                            	out.println("<div><input disabled type=\"text\" value="+getSum(request, 12, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=A\">明細</a></div><br>");
                            	out.println("</label>");
                            	out.println("<label>");
                            	out.println("<div>　衣：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 22, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=B\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　住：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 32, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=C\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　行：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 42, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=D\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>育樂：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 52, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=E\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>其他：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 62, 0, firstDayOfWeek, lastDayOfWeek)+"><a href=\"accountDetail.jsp?date=Week&type=F\">明細</a></div><br>");
                        		out.println("</label>");
                        	}else if(request.getParameter("date").contains("Today")){
                            	out.println("<label>");
                            	out.println("<div>　食：</div><br>");
                            	out.println("<div><input disabled type=\"text\" value="+getSum(request, 13, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=A\">明細</a></div><br>");
                            	out.println("</label>");
                            	out.println("<label>");
                            	out.println("<div>　衣：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 23, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=B\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　住：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 33, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=C\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>　行：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 43, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=D\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>育樂：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 53, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=E\">明細</a></div><br>");
                        		out.println("</label>");
                        		out.println("<label>");
                        		out.println("<div>其他：</div><br>");
                        		out.println("<div><input disabled type=\"text\" value="+getSum(request, 63, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=F\">明細</a></div><br>");
                        		out.println("</label>");
                        	}
                        }else{
                        	out.println("<label>");
                        	out.println("<div>　食：</div><br>");
                        	out.println("<div><input disabled type=\"text\" value="+getSum(request, 13, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=A\">明細</a></div><br>");
                        	out.println("</label>");
                        	out.println("<label>");
                        	out.println("<div>　衣：</div><br>");
                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 23, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=B\">明細</a></div><br>");
                    		out.println("</label>");
                    		out.println("<label>");
                    		out.println("<div>　住：</div><br>");
                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 33, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=C\">明細</a></div><br>");
                    		out.println("</label>");
                    		out.println("<label>");
                    		out.println("<div>　行：</div><br>");
                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 43, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=D\">明細</a></div><br>");
                    		out.println("</label>");
                    		out.println("<label>");
                    		out.println("<div>育樂：</div><br>");
                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 53, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=E\">明細</a></div><br>");
                    		out.println("</label>");
                    		out.println("<label>");
                    		out.println("<div>其他：</div><br>");
                    		out.println("<div><input disabled type=\"text\" value="+getSum(request, 63, 0, null, null)+"><a href=\"accountDetail.jsp?date=Today&type=F\">明細</a></div><br>");
                    		out.println("</label>");
                        }
                	}else{
	                   	out.println("<label>");
	                   	out.println("<div>　食：</div><br>");
	                   	out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	                   	out.println("</label>");
	                   	out.println("<label>");
	                   	out.println("<div>　衣：</div><br>");
	               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	               		out.println("</label>");
	               		out.println("<label>");
	               		out.println("<div>　住：</div><br>");
	               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	               		out.println("</label>");
	               		out.println("<label>");
	               		out.println("<div>　行：</div><br>");
	               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	               		out.println("</label>");
	               		out.println("<label>");
	               		out.println("<div>育樂：</div><br>");
	               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	               		out.println("</label>");
	               		out.println("<label>");
	               		out.println("<div>其他：</div><br>");
	               		out.println("<div><input disabled type=\"text\" value=\"0\"><a>明細</a></div><br>");
	               		out.println("</label>");
                	}
                    %>
            	</form>
            </div>
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