<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.sql.*,umspack.*" %>
    <%try{
    Connection con = ConnectionProvider.initiateConnection();
    System.out.print(con);
    PreparedStatement ps = con.prepareStatement("select * from order1");
    ResultSet rs = ps.executeQuery();
    System.out.print("rs");
    %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link type="text/css" rel="stylesheet" href="css/easy-responsive-tabs.css" />
</head>
<body>


<div>
<%String user=(String)session.getAttribute("user");
if(user!=null)
{%><a href="/Crud_operations/logout.jsp">Logout</a>
<%} %>

</div>
<table border="1" class="table table-striped" align="center" cstyle="width:50%">
        <thead>

            <tr>

                <th>Order id</th>

                <th>order date</th>

                <th>Stock unit</th>

                <th>Quantity</th>

                <th >Total amount</th>

            </tr>
       

        </thead>
<tbody>

  <% while(rs.next()){
	String order_id = rs.getString("order_id");
	String	order_date =rs.getString("order_date");
	String	stock_unit =rs.getString("stock_unit");
	String	quanity =rs.getString("quanity");
	String	tot_amount = rs.getString("total_amnt");
	%>          
<tr>

			<td><%=order_id %></td>
             <td><%=order_date %></td>

                    <td><%=stock_unit %></td>

                    <td><%=quanity %></td>

                    <td><%=tot_amount %></td>
  
                    
                    <br>
<%}}catch(Exception e)
    {e.printStackTrace();}%>
                </tr>

            

        </tbody>

    </table>
</body>
</html>