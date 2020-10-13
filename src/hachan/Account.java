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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date = new Date();
		
		if (request.getParameter("new") != null && 
				request.getParameter("accountName") != "" && 
				request.getParameter("accountMoney") != "" && 
				Long.parseLong(request.getParameter("accountMoney")) <= 2147483647 && 
				Long.parseLong(request.getParameter("accountMoney")) >= 0) {
			Cookie NewListN = new Cookie("accountId_"+Integer.toHexString(date.hashCode()), 
					request.getParameter("accountDate")+"|"+
					request.getParameter("accountCat")+"|"+
					URLEncoder.encode(request.getParameter("accountName"),"ISO-8859-1")+"|"+
					request.getParameter("accountMoney")
					);
			response.addCookie(NewListN);
		}
		if(request.getParameter("mod") != null && 
				request.getParameter("mod").contains("Y") && 
				request.getParameter("accountName") != "" &&
				request.getParameter("accountMoney") != ""  && 
				Long.parseLong(request.getParameter("accountMoney")) <= 2147483647 && 
				Long.parseLong(request.getParameter("accountMoney")) >= 0){
			Cookie NewListN = new Cookie(request.getParameter("accountId"), 
					request.getParameter("accountDate")+"|"+
					request.getParameter("accountCat")+"|"+
					URLEncoder.encode(request.getParameter("accountName"),"ISO-8859-1")+"|"+
					request.getParameter("accountMoney")
					);
			response.addCookie(NewListN);
		}
		if(request.getParameter("del") != null &&
				request.getParameter("del").contains("Y") &&
				request.getParameter("accountName") != "" &&
				request.getParameter("accountMoney") != ""){
			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals(request.getParameter("accountId"))) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		if (request.getParameter("date") != null && request.getParameter("type") != null) {
			response.sendRedirect("account.jsp?date="+request.getParameter("date")+"&type="+request.getParameter("type"));
		}else {
			response.sendRedirect("account.jsp");
		}
	}

}
