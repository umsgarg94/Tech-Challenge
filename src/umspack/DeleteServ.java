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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteServ
 */
@WebServlet("/DeleteServ")
public class DeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delete=request.getParameter("delete");
		System.out.println("dfjgafg=="+delete);
		
		HttpSession session = request.getSession();
		String pdtid = (String)session.getAttribute("pdtid");
		System.out.println("Product id ="+pdtid);
		try{
			Connection con = ConnectionProvider.initiateConnection();
			PreparedStatement ps;
			System.out.println("con="+con);
			System.out.println("You are "+delete+"ing the stock unit at "+pdtid);
			ps = con.prepareStatement("Delete from product where pdtid=?");
			ps.setString(1,pdtid);
			int i = ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
				rd.forward(request, response);
				System.out.println("deleted successully");
				
			}
			
			}catch(Exception e)
			{
				e.printStackTrace();
			}
}

}
