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
 * Servlet implementation class Manager
 */
@WebServlet("/Manager")
public class Manager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date date = new Date();
		
		if (request.getParameter("new") != null && request.getParameter("managerName") != "") {
			Cookie NewListN = new Cookie("managerId_"+Integer.toHexString(date.hashCode()), 
					request.getParameter("managerRemind")+"|"+
					request.getParameter("managerDate")+"|"+
					request.getParameter("managerTime")+"|"+
					URLEncoder.encode(request.getParameter("managerName"),"ISO-8859-1")+"|"+
					URLEncoder.encode(request.getParameter("managerDesc"),"ISO-8859-1")
					);
			response.addCookie(NewListN);
		}
		if(request.getParameter("mod") != null && request.getParameter("mod").contains("Y") && request.getParameter("managerName") != ""){
			Cookie NewListN = new Cookie(request.getParameter("managerId"), 
					request.getParameter("managerRemind")+"|"+
					request.getParameter("managerDate")+"|"+
					request.getParameter("managerTime")+"|"+
					URLEncoder.encode(request.getParameter("managerName"),"ISO-8859-1")+"|"+
					URLEncoder.encode(request.getParameter("managerDesc"),"ISO-8859-1")
					);
			response.addCookie(NewListN);
		}
		if(request.getParameter("del") != null && request.getParameter("del").contains("Y")){
			Cookie cookies[] = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals(request.getParameter("managerId"))) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		if (request.getParameter("date") != null) {
			response.sendRedirect("managerSearch.jsp?date="+request.getParameter("date"));
		}else {
			response.sendRedirect("managerSearch.jsp");
		}
	}

}
