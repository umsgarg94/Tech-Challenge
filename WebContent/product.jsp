<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link type="text/css" rel="stylesheet" href="css/easy-responsive-tabs.css" />
<title>Insert title here</title>
</head>

<%@ page import="java.sql.*,umspack.ConnectionProvider" %>

<%!String pdtid,stock_unit,pdt_name,desp,amount; %>
<%
System.out.println("Connection started");
Connection con = ConnectionProvider.initiateConnection();
PreparedStatement ps = con.prepareStatement("select * from product");
ResultSet rs = ps.executeQuery();
%>
       

<body>
<h1>Your product details are</h1>


<div>
<%String user=(String)session.getAttribute("user");
if(user!=null)
{%><a href="/Crud_operations/logout.jsp">Logout</a>
<%} %>

</div>
<div>
<a href="/Crud_operations/order.jsp">Check order</a>
</div>
<table class="table table-striped" border="1" align="center" style="width:50%">
        <thead>

            <tr>

                <th>Stock Unit</th>

                <th>Product name</th>

                <th>Description</th>

                <th>Amount</th>

                <th colspan=2>Action</th>

            </tr>
       

        </thead>
<tbody>

  <% while(rs.next()){
	  pdtid = rs.getString("pdtid");
		stock_unit =rs.getString("stock_unit");
		pdt_name =rs.getString("pdt_name");
		desp =rs.getString("description");
		amount = rs.getString("amount");
		session.setAttribute("pdtid",pdtid);
	%>          

                <form action="/Crud_operations/UpdateServlet" method="post">     
        <tr>
             <td>
             <input type="text" name="stk" value=<%=stock_unit %>></td>
                    <td><input type="text" name="pdt_name" value=<%=pdt_name %>></td>
                    <td><input type="text" name="desp" value=<%=desp %>></td>
					<td><input type="text" name="amnt" value=<%=amount %>	></td>
 					
 					<td><input type="submit" name= "update" value="update"></td>
                   
                    
                    <br>
                </tr>
                </form>
                <form action="/Crud_operations/DeleteServ" method="post">     
        <tr>
             <td>
             <input type="text" name="stk" value=<%=stock_unit %>></td>
                    <td><input type="text" name="pdt_name" value=<%=pdt_name %>></td>
                    <td><input type="text" name="desp" value=<%=desp %>></td>
					<td><input type="text" name="amnt" value=<%=amount %>	></td>
 					<td><input type="submit" name= "delete" value="delete"></td>
                   
                    
                    <br>
                </tr>
                </form>
<%} %>
            

        </tbody>

    </table>


</body>
</html>