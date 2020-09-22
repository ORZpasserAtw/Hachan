package hachan;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date = new Date();
		
		if (request.getParameter("new") != null) {
			Cookie NewListN = new Cookie("list_"+Integer.toHexString(date.hashCode()), 
					URLEncoder.encode(request.getParameter("tName"),"ISO-8859-1")+"\\$"+request.getParameter("tMoney"));
			response.addCookie(NewListN);
			response.sendRedirect("index.jsp");
		}
		if(request.getParameter("mod") != null){
			Cookie NewListN = new Cookie(request.getParameter("listId"), 
					URLEncoder.encode(request.getParameter("tName"),"ISO-8859-1")+"\\$"+request.getParameter("tMoney"));
			response.addCookie(NewListN);
			response.sendRedirect("index.jsp");
		}
		if(request.getParameter("del") != null){
			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals(request.getParameter("listId"))) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
			response.sendRedirect("index.jsp");
		}
	}

}
