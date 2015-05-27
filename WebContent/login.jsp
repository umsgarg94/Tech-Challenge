<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="WebContent/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="WebContent/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="WebContent/css/bootstrap-theme.css" type="text/css" rel="stylesheet">
<link href="WebContent/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
<link href="WebContent/css/style.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<body>

<!-- Login here --> 
				
		<div class="Container">	
		<div class="hie">
			 <form action="/Crud_operations/LoginServ" method="post">
				 <div class="form-group">
					 <h5>User Name:</h5>	
					 <input type="text" class="form-control" name="user" value="">
					 </div>
					 <div class="form-group">
					 <h5>Password:</h5>
					 <input type="password" class="form-control"  name="pass"value=""><br>
					 </div>		
					 <div class="form-group">	
					 <input type="submit" class="btn btn-default" value="Login">	
					 </div>  
				 </form>
				
				</div> 
				 
				<div class="hie">
				<!--Register here-->
				 <form action= "/Crud_operations/RegServ" method="post">
							 
					<div class="form-group">
						<h5>User Name:</h5>
						 <input type="text" class="form-control" name="user"value="">
						 </div>
						 <div class="form-group">
					<h5> Password: </h5>
						 <input type="password" class="form-control" name="pass"value=""><br>
						 </div>
					<div class="form-group">
					 <input type="submit" class="btn btn-default" value="Register Now">
					 </div>
					  </form>
				 </div>
				
				 </div>		 
		 

</body>
</html>