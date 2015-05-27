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
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delete = "jk",update="up";
		delete=request.getParameter("delete");
		System.out.println("dfjgafg=="+delete);
		update=	request.getParameter("update");
		HttpSession session = request.getSession();
		String pdtid = (String)session.getAttribute("pdtid");
		System.out.println("Product id ="+pdtid);
		try{
			Connection con = ConnectionProvider.initiateConnection();
			PreparedStatement ps;
			System.out.println("con="+con);
			
				System.out.println("You are "+update+"ing the stock unit at "+pdtid);
				String stk = request.getParameter("stk");
				String pdt_name = request.getParameter("pdt_name");
				String desp = request.getParameter("desp");
				String amnt = request.getParameter("amnt");
				System.out.println("stk="+stk+" ,pdtname="+pdt_name);
				ps = con.prepareStatement("update product SET stock_unit=? ,pdt_name=?,description=?,amount=? where pdtid=? ");
				ps.setString(1,stk);
				ps.setString(2,pdt_name);
				ps.setString(3,desp);
				ps.setString(4,amnt);
				ps.setString(5,pdtid);
				int i = ps.executeUpdate();
				if(i>0){
						RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
						rd.forward(request, response);
						System.out.println("Updated successully");
						}
			
			
			}catch(Exception e)
			{
				e.printStackTrace();
			}
}

}
