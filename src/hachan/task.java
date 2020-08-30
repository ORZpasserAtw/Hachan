package hachan;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class task
 */
@WebServlet("/task")
public class task extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3201902992785282012L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date = new Date();
		
		if (request.getParameter("new") != null) {
			String name = request.getParameter("tName");
			int money = Integer.parseInt(request.getParameter("tMoney"));
			Cookie tName = new Cookie("tName", URLEncoder.encode(name, "ISO-8859-1"));
			Cookie tMoney = new Cookie("tMoney", "" + money);
			Cookie NewListN = new Cookie("list_"+Integer.toHexString(date.hashCode()), "<"+URLEncoder.encode(name, "ISO-8859-1")+"><"+money+">");

			response.addCookie(NewListN);

			response.addCookie(tName);
			response.addCookie(tMoney);
		} else if (request.getParameter("decrease") != null) {
			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().contains("list_")) {
					Pattern pattern = Pattern.compile("<(.*?)><([0-9]+)>", Pattern.DOTALL);
					Matcher matcher = pattern.matcher(c.getValue());
					if (matcher.find()) {
						System.out.println(URLDecoder.decode(matcher.group(1), "UTF-8"));
						c.setValue("<"+matcher.group(1)+"><"+(Integer.parseInt(matcher.group(2)) - 50)+">");
						response.addCookie(c);
					}
				}
			}
		} else if (request.getParameter("increase") != null) {
			int cookieMoney = 0;

			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals("tMoney")) {
					cookieMoney = Integer.parseInt(c.getValue());
					c.setValue(Integer.toString(cookieMoney + 50));
					response.addCookie(c);
				}
			}
		} else if (request.getParameter("DeleteBTN") != null) {
			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				System.out.println(URLDecoder.decode(request.getParameter("DeleteText"), "ISO-8859-1"));
				if (c.getValue().contains(URLDecoder.decode(request.getParameter("DeleteText"), "ISO-8859-1"))) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		
		response.sendRedirect("index.jsp");
	}
}
