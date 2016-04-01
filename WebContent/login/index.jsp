<%@page import="com.online_banking.example.DB_Login"%>
<%@page import="com.online_banking.example.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/normalize.css">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>log in</title>
</head>

<body>
	<%
	String nat_id = UserInfo.getUserNationalId(request);
	if(nat_id.length() > 0 && !nat_id.equals("bad")){
		response.sendRedirect("../profile.jsp");
	}

		if(request.getParameter("email") != null &&
				request.getParameter("password") != null){

				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				if(email.length() > 0 && password.length() > 0){
					
					DB_Login login = new DB_Login();
					if(login.checkValidUser(email, password)){
						Cookie cook = new Cookie("nat_id",login.getNat_id());
						cook.setMaxAge(7*24*60*60);
						cook.setPath("/");
						response.addCookie(cook);
						response.sendRedirect("../profile.jsp");
					}else{
						out.println("<script>alert('Invalid Username and password Compinations');</script>");
					}
				}
				}
	
	%>
<header class="header">
<div class="slider">
			<div class="intro">
		    <div class="continar">
<h1><span>O</span>nline <span>B</span>anking</h1> 
                
<div class="formdiv">
<form action="index.jsp" method="post" spellcheck="false">
	<h5 style="font-size:24px; margin-right:83%;margin-top:-1px" >e-mail</h5>
	<input type="email" name="email" placeholder="Email" style="width:400px; direction:ltr;height:40px; margin-bottom:0px; margin-top:-30px; margin-right:50px; " >
	<h5 style="font-size:24px; margin-right:75%">password</h5>
	<input type="password" name="password" placeholder="passward" style="width:400px; direction:ltr;height:40px;  margin-bottom:-20px;margin-top:-30px;margin-right:50px;  "> 
	<a href="#" ><p style="color:#0FF;" >forget your password</p></a>
 	<button type="submit" class="btn btn-default" >log in</button>
</form>     
 
 <script src="js/jquery-1.9.1.js"></script>
 <script src="js/bootstrap.js"></script>
  <script src="js/plugins.js"></script>
                
                	</div>
	    	</div>
				</div>

	</header>
         
</body>
</html>
