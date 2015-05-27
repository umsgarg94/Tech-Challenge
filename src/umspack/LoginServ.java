package umspack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		try{
		Connection con = ConnectionProvider.initiateConnection();
		PreparedStatement ps=con.prepareStatement("select * from users where user=? and pass=?");
	    ps.setString(1,user);
	    ps.setString(2,pass);
	    ResultSet rs =ps.executeQuery();
	    while(rs.next())
	    {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("user", user);
	    	RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
	    	rd.forward(request, response);
	    }
	    
		}
		catch(Exception e){e.printStackTrace();}
	}

}
