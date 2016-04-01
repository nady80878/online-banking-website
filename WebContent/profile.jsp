<%@page import="com.online_banking.example.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>

<link rel="stylesheet" type="text/css" href="css/profile.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
</head>
<body>
	<!-- Start header-->
	
	<%! private UserInfo user; %>
	<% 
	String nat_id = UserInfo.getUserNationalId(request);
	if(nat_id.equals("bad")){
		response.sendRedirect("login");
	}
		this.user = new UserInfo(nat_id);
	%>
	<header class="header">
	<div class="slider">
		<div class="intro">
			<div class="continar">
				<div class="navbar clear">
					<ul class="navbar-links clear">
						<li><a href="index.html">Services</a></li>
						<li class="menu"><a href="#">Tasks &nbsp;<i class="fa fa-caret-down"></i></a>
							<ul class="sub-menu">
								<li><a href="withdraw">Withdraw</a></li>
								<li><a href="deposit">Deposit</a></li>
								<li><a href="transfer.jsp">Transfer</a></li>
								<li><a href="profile.jsp">Profile</a></li>
								<li><a href="Logout">Logout</a></li>
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
				<div class="wrapper clear">
				
						<div class="section">
							<div class="section-slider">
								<ul class="slides">
									<li class="slide">
										<div class="section-info">
											<div class="section-info-box">
												<div class="profile-avatar">
													<img src="img/avatar.png" alt="Avatar" />
												</div>
												<div class="profile-contact">
													<div class="username"><%=this.user.getF_name()+" "+this.user.getL_name() %></div>
													<div class="user-email"><%=this.user.getEmail() %></div>
												</div>
											</div>
										</div>
									</li>
									<li class="slide">
										<div class="balance">
											<div class="balance-content">
												<i class="fa fa-gbp"></i> <span class="money"><%=this.user.formatNum(this.user.getBalance()) %></span>
											</div>
											<div class="balance-content">
												<i class="fa fa-usd"></i> <span class="money"><%=this.user.formatNum(this.user.getBalanceUSD()) %></span>
											</div>
											<div class="balance-content">
												<i class="fa fa-eur"></i> <span class="money"><%=this.user.formatNum(this.user.getBalanceEUR()) %></span>
											</div>
										</div>
										<div class="balance-lbl">balance</div>
									</li>
									<li class="slide">
										<div class="card-box">
											<div class="card-bank">Online-banking</div>
											<div class="card-username"><%=this.user.getUsername()%></div>
											<div class="card-number">
												<span>1234</span> <span>2352</span> <span>9652</span> <span>7466</span>
											</div>
											<div class="card-details clear">
												<div class="card-secret">1234</div>
												<div class="card-date">
													<div class="card-date-lbl">Expire date</div>
													<span>12/6</span>
												</div>
											</div>
										</div>
									</li>
									<li class="slide"><div class="privates-accordion">
											<ul>
												<li><a class="accordion-tab" href="#">personal
														details<span class="accordion-lock fa fa-lock"></span>
												</a>
													<div class="accordion-content accordion-content-click">
	
														<div class="accordion-item clear">
															<div class="accordion-item-head">Full name</div>
															<div class="accordion-item-body"><%=this.user.getF_name()+" "+this.user.getL_name() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Nat id</div>
															<div class="accordion-item-body"><%=this.user.getNat_id() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Username</div>
															<div class="accordion-item-body"><%=this.user.getUsername() %></div>
														</div>
	
													</div></li>
												<li><a class="accordion-tab" href="#">Address <span
														class="accordion-lock fa fa-lock"></span></a>
													<div class="accordion-content">
														<div class="accordion-item clear">
															<div class="accordion-item-head">Country</div>
															<div class="accordion-item-body"><%=this.user.getCountry() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">City</div>
															<div class="accordion-item-body"><%=this.user.getCity() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">State</div>
															<div class="accordion-item-body"><%=this.user.getState() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Zip-code</div>
															<div class="accordion-item-body"><%=this.user.getZip_code() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Street</div>
															<div class="accordion-item-body"><%=this.user.getStreet() %></div>
														</div>
	
													</div></li>
												<li><a href="#" class="accordion-tab">Contacts<span
														class="accordion-lock fa fa-lock"></span></a>
													<div class="accordion-content">
														<div class="accordion-item clear">
															<div class="accordion-item-head">E-mail</div>
															<div class="accordion-item-body"><%=this.user.getEmail() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Telephone</div>
															<div class="accordion-item-body"><%=this.user.getTelephone() %></div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Fax</div>
															<div class="accordion-item-body"><%=this.user.getFax()%></div>
														</div>
													</div>
												<li>
												<a href="#" class="accordion-tab">Card details <span
														class="accordion-lock fa fa-lock"></span></a>
													<div class="accordion-content">
														<div class="accordion-item clear">
															<div class="accordion-item-head">Number</div>
															<div class="accordion-item-body"><%=this.user.getCard_number() %> </div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Secret</div>
															<div class="accordion-item-body">1234</div>
														</div>
														<div class="accordion-item clear">
															<div class="accordion-item-head">Expire</div>
															<div class="accordion-item-body">12/06</div>
														</div>
													</div></li>
											</ul>
										</div></li>
								</ul>
							</div>
							<div class="section-controls">
								<ul>
									<li onclick="slideLeft(0)">
										<div class="control">
											<div class="control-icon">
												<i class="fa fa-tachometer fa-2x"></i>
											</div>
											<div class="control-lbl">dashboard</div>
										</div>
									</li>
									<li onclick="slideLeft(1)">
										<div class="control">
											<div class="control-icon">
												<i class="fa fa-suitcase fa-2x"></i>
											</div>
											<div class="control-lbl">balance</div>
										</div>
									</li>
									<li onclick="slideLeft(2)">
										<div class="control">
											<div class="control-icon">
												<i class="fa fa-inbox fa-2x"></i>
											</div>
											<div class="control-lbl">details</div>
										</div>
									</li>
									<li onclick="slideLeft(3)">
										<div class="control">
											<div class="control-icon">
												<i class="fa fa-lock fa-2x"></i>
											</div>
											<div class="control-lbl">privates</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					
					<div class="profile-controls">
						<ul>
							<li>
								<div class="control">
									<div class="control-icon">
										<i class="fa fa-user fa-4x"></i>
									</div>
									<div class="control-lbl">profile</div>
								</div>
							</li>
							<li>
								<div class="control">
									<div class="control-icon">
										<i class="fa fa-tags fa-3x"></i>
									</div>
									<div class="control-lbl">account</div>
								</div>
							</li>
							<li>
								<div class="control">
									<div class="control-icon">
										<i class="fa fa-cogs fa-3x"></i>
									</div>
									<div class="control-lbl">settings</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- Start header-->
	<!-- the scripts for moving between steps -->
	<script src="js/jquery.js"></script>
	<script type="text/javascript">
	(function($) {
		$.fn.clickToggle = function(func1, func2) {
			var funcs = [func1, func2];
			this.data('toggleclicked', 0);
			this.click(function() {
				var data = $(this).data();
				var tc = data.toggleclicked;
				$.proxy(funcs[tc], this)();
				data.toggleclicked = (tc + 1) % 2;
			});
			return this;
		};
	}(jQuery));
		function slideLeft(degree) {
			$(".slides").animate({
				"margin-left": (-1*degree * 739)+"px"
			},1000);
		}
		function slideTop(degree) {
			$(".slides").animate({
				"margin-top": (-1*degree * 500)+"px"
			},1000);
		}
		$(".accordion-tab").click(function(e){
			e.preventDefault();
			lock = $(this).find(".accordion-lock");
			$(".accordion-lock").addClass("fa-lock");
			$(".accordion-lock").removeClass("fa-unlock");
			$(".accordion-content").removeClass("accordion-content-click");//css("height","0");
		}).clickToggle(function(){
			$(this).siblings(".accordion-content").addClass("accordion-content-click");//css("height","150px");
			lock.addClass("fa-unlock");
			lock.removeClass("fa-lock");
		},function(){
			$(this).siblings(".accordion-content").removeClass("accordion-content-click");//css("height","0");
			lock.addClass("fa-lock");
			lock.removeClass("fa-unlock");
		});
	</script>
</body>
</html>