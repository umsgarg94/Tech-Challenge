package umspack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/RegServ")
public class RegServ extends HttpServlet {
	   
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String user = request.getParameter("user");
		  String pass = request.getParameter("pass");
		 try
		     {
			  System.out.println("Loading driver...");
			  Connection con = ConnectionProvider.initiateConnection();
			  PreparedStatement ps=con.prepareStatement("insert into users values(?,?);");
			 
			  ps.setString(1,user);			ps.setString(2,pass);
			  int i = ps.executeUpdate();
			  if(i>0)
			  {
				  RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			    	rd.forward(request, response);
			  }}
		 catch(Exception e){e.printStackTrace();}
	}
}