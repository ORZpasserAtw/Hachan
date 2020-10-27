<%@ page language="java" pageEncoding="UTF-8" %>
<jsp:directive.page import="java.net.URLDecoder,java.io.*,java.text.ParseException,java.util.Date,java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat,java.util.ArrayList,java.util.Arrays,java.util.Comparator,java.util.Collections"/>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>記帳明細📒</title>
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
    <div class="header-low">
        <div class="navbar">
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
	<%! 
	public void printAccountCard(HttpServletRequest request,JspWriter out,String cookieName,String sl0,String sl1,String sl2,String sl3) throws IOException {
		out.println("<div class=\"separate2 cardview accountId\" onclick=\"location.href='accountModify.jsp?accountId="+cookieName+"&date="+request.getParameter("date")+"&type="+request.getParameter("type")+"'\">");
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
		
		out.println("<label>");
		out.println("<div><a>修改</a></div><br>");
		out.println("</label>");
		out.println("</form>");
		out.println("</div>");
	}
	%>
			<%!
			public void printAccount(HttpServletRequest request, JspWriter out, int mode, Date start, Date end) throws ParseException,IOException{
				String[] split_line = new String[1];
				ArrayList<ArrayList<String>> CookieList = new ArrayList<ArrayList<String>>();
				for (Cookie cookie : request.getCookies()) {
					String cookieName = URLDecoder.decode(cookie.getName(), "UTF-8");
					String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					split_line = cookie.getValue().split("\\|");

					if (mode == 1){ //All
						if (cookieName.contains("accountId_")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 2){//Month and Week
						if (cookieName.contains("accountId_")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 3){ //Today
						if (cookieName.contains("accountId_") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 11){
						if (cookieName.contains("accountId_") && split_line[1].equals("A")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 12){
						if (cookieName.contains("accountId_") && split_line[1].equals("A")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 13){
						if (cookieName.contains("accountId_") && split_line[1].equals("A") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 21){
						if (cookieName.contains("accountId_") && split_line[1].equals("B")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 22){
						if (cookieName.contains("accountId_") && split_line[1].equals("B")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 23){
						if (cookieName.contains("accountId_") && split_line[1].equals("B") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 31){
						if (cookieName.contains("accountId_") && split_line[1].equals("C")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 32){
						if (cookieName.contains("accountId_") && split_line[1].equals("C")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 33){
						if (cookieName.contains("accountId_") && split_line[1].equals("C") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 41){
						if (cookieName.contains("accountId_") && split_line[1].equals("D")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 42){
						if (cookieName.contains("accountId_") && split_line[1].equals("D")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 43){
						if (cookieName.contains("accountId_") && split_line[1].equals("D") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 51){
						if (cookieName.contains("accountId_") && split_line[1].equals("E")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 52){
						if (cookieName.contains("accountId_") && split_line[1].equals("E")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 53){
						if (cookieName.contains("accountId_") && split_line[1].equals("E") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 61){
						if (cookieName.contains("accountId_") && split_line[1].equals("F")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 62){
						if (cookieName.contains("accountId_") && split_line[1].equals("F")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 63){
						if (cookieName.contains("accountId_") && split_line[1].equals("F") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 101){
						if (cookieName.contains("accountId_") && split_line[1].equals("Z")) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}else if(mode == 102){
						if (cookieName.contains("accountId_") && split_line[1].equals("Z")) {
							Date d = new SimpleDateFormat("yyyy-MM-dd").parse(split_line[0]);
							if (d.getTime() >= start.getTime() && d.getTime() <= end.getTime()){
								CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
							}
						}
					}else if(mode == 103){
						if (cookieName.contains("accountId_") && split_line[1].equals("Z") && split_line[0].equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))) {
							CookieList.add(new ArrayList<String>(Arrays.asList(cookieName,split_line[0],split_line[1],split_line[2],split_line[3])));
						}
					}
				}
				Collections.sort(CookieList, new Comparator<ArrayList<String>>() {    
			        @Override
			        public int compare(ArrayList<String> o1, ArrayList<String> o2) {
			            return o1.get(1).compareTo(o2.get(1));
			        }               
			    });
				for(int i = 0; i < CookieList.size(); i++) {
					printAccountCard(request, out, CookieList.get(i).get(0), CookieList.get(i).get(1), CookieList.get(i).get(2), CookieList.get(i).get(3), CookieList.get(i).get(4));
			    }
			}
			%>
			<%
			
			if (request.getCookies() != null) {
				if(request.getParameterMap().containsKey("date") && request.getParameterMap().containsKey("type")){
					if (request.getParameter("date").contains("All") && request.getParameter("type").contains("All")){
						printAccount(request,out,1,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("All")){
						printAccount(request,out,2,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("All")){
          				printAccount(request,out,2,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("All")){
          				printAccount(request,out,3,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("A")){
						printAccount(request,out,11,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("A")){
						printAccount(request,out,12,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("A")){
          				printAccount(request,out,12,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("A")){
          				printAccount(request,out,13,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("B")){
						printAccount(request,out,21,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("B")){
						printAccount(request,out,22,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("B")){
          				printAccount(request,out,22,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("B")){
          				printAccount(request,out,23,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("C")){
						printAccount(request,out,31,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("C")){
						printAccount(request,out,32,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("C")){
          				printAccount(request,out,32,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("C")){
          				printAccount(request,out,33,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("D")){
						printAccount(request,out,41,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("D")){
						printAccount(request,out,42,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("D")){
          				printAccount(request,out,42,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("D")){
          				printAccount(request,out,43,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("E")){
						printAccount(request,out,51,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("E")){
						printAccount(request,out,52,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("E")){
          				printAccount(request,out,52,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("E")){
          				printAccount(request,out,53,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("F")){
						printAccount(request,out,61,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("F")){
						printAccount(request,out,62,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("F")){
          				printAccount(request,out,62,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("F")){
          				printAccount(request,out,63,null,null);
          			}else if (request.getParameter("date").contains("All") && request.getParameter("type").contains("Z")){
						printAccount(request,out,101,null,null);
					}else if(request.getParameter("date").contains("Month") && request.getParameter("type").contains("Z")){
						printAccount(request,out,102,firstDayOfMonth,lastDayOfMonth);
          			}else if(request.getParameter("date").contains("Week") && request.getParameter("type").contains("Z")){
          				printAccount(request,out,102,firstDayOfWeek,lastDayOfWeek);
          			}else if(request.getParameter("date").contains("Today") && request.getParameter("type").contains("Z")){
          				printAccount(request,out,103,null,null);
          			}
				}else{
					printAccount(request,out,3,null,null);
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.finger/0.1.6/jquery.finger.min.js"></script>
    <script src="main.js"></script>
</body>

</html>