<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.online_banking.example.UserInfo"%>
<%@page import="com.online_banking.example.DB_Withdraw"%>
<%@page import="com.online_banking.example.DB_Login"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/normalize.css">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title>
</head>
<body>
<%! private UserInfo user; %>

	<%

	String nat_id = UserInfo.getUserNationalId(request);
	if(nat_id.length() > 0 && nat_id.equals("bad")){
		response.sendRedirect("../login");
	}
		// getting parameters values
		this.user = new UserInfo(UserInfo.getUserNationalId(request));
		
		if(	request.getParameter("amount") != null &&
			request.getParameter("email") != null &&
			request.getParameter("password") != null){
			
			String amountStr = request.getParameter("amount");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			if(amountStr.length() > 0 && email.length() > 0 && password.length() > 0){
				Double amount = Double.parseDouble(amountStr);
				//compute the old and the latest balance
				Double oldBalance = this.user.getBalance();
				Double latestBalance = UserInfo.getLatestBalance(amount , oldBalance);
				
				//updating the database with the new values
				try {
					DB_Login login = new DB_Login();
					if(login.checkValidUser(email, password)){
						if(latestBalance != (double)-1 && oldBalance > 0){
							DB_Withdraw withdraw = new DB_Withdraw(this.user.getNat_id());
							withdraw.updateDatabase(amount, oldBalance, latestBalance);
							out.println("<script>alert('The withdraw is already done successfully...');</script>");
						}else{
							out.println("<script>alert('Sorry, the amount you entered is over your balance...');</script>");
						}
					}else{
						out.println("<script>alert('Enter avalid email and password');</script>");
					}
					
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}	
		}
	
	%>
<header class="header">
	<div class="slider">
		<div class="intro">
			<div class="continar">
				<div class="navbar clear">
					<ul class="navbar-links clear">
						<li><a href="../index.html">Services</a></li>
						<li class="menu"><a href="#">Tasks &nbsp;<i class="fa fa-caret-down"></i></a>
							<ul class="sub-menu">
								<li><a href="../withdraw">Withdraw</a></li>
								<li><a href="../deposit">Deposit</a></li>
								<li><a href="../transfer.jsp">Transfer</a></li>
								<li><a href="../profile.jsp">Profile</a></li>
								<li><a href="../Logout">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="title">
					<h1>
						<span>O</span>n <span>L</span>ine <span>B</span>anking
					</h1>
					<p>Sneak peaks and thinkings from the CS DEPT team</p>
				</div>
	
   <h3>Withdraw</h3>   
 <form action="index.jsp" method="post"  spellcheck="false">         
<div class="formdiv">
  <h5 style="font-size:24px; margin-right:80%;margin-top:-1px;margin-bottom:10px">email</h5>
<input type="email" name="email" placeholder="Email" style="width:400px; height:30px; margin-bottom:10px; direction:ltr;margin-top:0; margin-right:30px; ">
<h5 style="font-size:24px; margin-right:71%;margin-top:-1px;margin-bottom:10px;"  >password</h5>
<input type="password" name="password" placeholder="passward" style="width:400px; height:30px;  margin-bottom:10px; direction:ltr;margin-right:30px; ">
  <h5 style="font-size:24px; margin-right:75%;margin-top:-1px;margin-bottom:10px;"  >amount</h5>
<input type="text" name="amount" placeholder="Amount" style="width:400px; height:30px;  margin-bottom:10px;direction:ltr;margin-right:30px; "> 
   <a href="#" ><p style="color:#0FF; padding-top:-200px" >forget your password</p></a>
   <div class="btn1" >  
 <button type="submit" class="btn btn-default" style="background-color:#0CF; margin-right:200px;margin-top:117px">Submit</button>
</div>
 <div class="btn2" > 
  <button type="button" class="btn btn-default" onclick="window.location='../index.html';" style="background-color:#0CF;margin-top:169px;margin-right:-20px">Exit</button>
</div>



 <script src="js/jquery-1.9.1.js"></script>
 <script src="js/bootstrap.js"></script>
  <script src="js/plugins.js"></script>
                
                	</div>
	   </form> 
	    	</div>
	    
 
				</div>
		</header>
         
</body>
</html>
