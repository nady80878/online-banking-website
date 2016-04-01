<%@page import="com.online_banking.example.DB_Signup"%>
<%@page import="com.online_banking.example.DB_Login"%>
<%@page import="com.online_banking.example.UserInfo"%>
<%@page import="com.online_banking.example.Validator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link href="css/withdraw.css" rel="stylesheet" type="text/css">
<title>sign up</title>
</head>
<%! private String error = ""; %>
<%
String nat_id = UserInfo.getUserNationalId(request);
if(nat_id.length() > 0 && !nat_id.equals("bad")){
	response.sendRedirect("profile.jsp");
}
	if(	request.getParameter("f_name") != null &&
			request.getParameter("l_name") != null &&
			request.getParameter("email") != null &&
			request.getParameter("username") != null &&
			request.getParameter("password") != null &&
			request.getParameter("conf_password") != null &&
			request.getParameter("national_id") != null &&
			request.getParameter("card_number") != null &&
			request.getParameter("zip_code") != null &&
			request.getParameter("country") != null &&
			request.getParameter("city") != null &&
			request.getParameter("state") != null &&
			request.getParameter("street") != null &&
			request.getParameter("fax") != null &&
			request.getParameter("telephone") != null){

			
					String f_name = request.getParameter("f_name") ;
					String l_name = request.getParameter("l_name") ;
					String email = request.getParameter("email") ;
					String username = request.getParameter("username") ;
					String password = request.getParameter("password") ;
					String conf_password = request.getParameter("conf_password") ;
					String national_id = request.getParameter("national_id") ;
					String card_number = request.getParameter("card_number") ;
					String zip_code = request.getParameter("zip_code") ;
					String country = request.getParameter("country") ;
					String city = request.getParameter("city") ;
					String state = request.getParameter("state") ;
					String street = request.getParameter("street") ;
					String fax= request.getParameter("fax") ;
					String telephone = request.getParameter("telephone");
					
		if(f_name.length() > 0 && l_name.length() > 0 && email.length() > 0&& username.length() > 0
				&& password.length() > 0&& conf_password.length() > 0&& national_id.length() > 0&& 
				card_number.length() > 0&& zip_code.length() > 0&& country.length() > 0
				&& city.length() > 0&& state.length() > 0
				&& fax.length() > 0&& street.length() > 0&& telephone.length() > 0){
			String address = country + ", " + city + ", " + state + ", " + street;
			boolean checkError = false;
	
			if(!Validator.validateName(f_name)){
				out.println("<script>alert('the first name must consists of alphabetic characters at least 2 chars  and at most 20 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateName(l_name)){
				out.println("<script>alert('the last name must consists of alphabetic characters at least 2 chars  and at most 20 chars in length')</script>");
				checkError = true;
			}
			
			
			if(!Validator.validateUsername(username)){
				out.println("<script>alert('the username must consists of alphanumeric characters at least 4 chars and at most 20 chars in length");
				checkError = true;
			}
			
			if(!Validator.validateEmail(email)){
				out.println("<script>alert('the email must matches a valid email standard < info@example.com >')</script>");
				checkError = true;
			}
			
			if(!Validator.validateMatchedPasswords(password, conf_password)){
				out.println("<script>alert('the password must matches  a given confirm Password')</script>");
				checkError = true;
			}
			
			if(!Validator.validatePassword(password)){
				out.println("<script>alert('the password must consists of (alphabetic , _ or - ) and numeric characters at least 8 chars and at most 30 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateNationalId(national_id)){
				out.println("<script>alert('the nationalId must consists of numeric characters at least 14 chars and at most 14 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateCardNumber(card_number)){
				out.println("<script>alert('the cardNumber must consists of numeric characters at least 16 chars and at most 16 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateZipcode(zip_code)){
				out.println("<script>alert('the zipCode must consists of numeric characters or dashes at least 5 chars and at most 16 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateFaxOrTelephone(telephone)){
				out.println("<script>alert('the telephone must consists of numeric characters at least 11 chars and at most 30 chars in length')</script>");
				checkError = true;
			}
			
			if(!Validator.validateFaxOrTelephone(fax)){
				out.println("<script>alert('the fax must consists of numeric characters at least 11 chars and at most 30 chars in length')</script>");
				checkError = true;
			}
			
			DB_Login login = new DB_Login();
			if(!login.checkValidUser(email, password)){
				if(!checkError){	
					DB_Signup signup = new DB_Signup();
					signup.updateDatabase(f_name, l_name, username, email, password, national_id, card_number, zip_code, 0, address, telephone, fax);
					Cookie cook = new Cookie("nat_id",national_id);
					cook.setMaxAge(7*24*60*60);
					cook.setPath("/");
					response.addCookie(cook);
					response.sendRedirect("profile.jsp");
				}
			}else{
				out.println("<script>alert('Choose Another Email')</script>");
			}
		}else{
			out.println("<script>alert('Complete the form with correct Information')</script>");
		}
		}


%>
<body>
	<header class="header">
	<div class="slider">
		<div class="intro">
			<div class="continar">
				<div class="navbar clear">
					<ul class="navbar-links clear">
						<li><a href="index.html">Services</a></li>
					</ul>
				</div>
				<h1>
					<span>O</span>nline <span>B</span>anking
				</h1>

				<div class="withdraw clear" style="height: 500px;">
					<div class="section" style="width:97%">
						<form action="signup.jsp" method="post" spellcheck="false"
							accept-charset="utf-8">
							<ul class="tabs clear">
								<li><label for="tab-1" onclick='moveToTab("tab-1")'>
										<span class="tab-num">1</span>
										<div class="tab-lbl">Personal</div>
								</label></li>
								<li class="tab-sperator"></li>
								<li><label for="tab-2" onclick='moveToTab("tab-2")'>
										<span class="tab-num">2</span>
										<div class="tab-lbl">Shipping</div>
								</label></li>
								<li class="tab-sperator"></li>
								<li><label for="tab-3" onclick='moveToTab("tab-3")'>
										<span class="tab-num">3</span>
										<div class="tab-lbl">Finish</div>
								</label></li>
							</ul>
							<div class="tab">
								<input id="tab-1" name="tab" class="tab-radio" type="radio"
									checked>
								<div class="tab-content">
									<div class="fields">
										<div class="row">
											<div>
												<label for="f_name">first name</label>
											</div>
											<div>
												<input type="text" id="f_name" name="f_name">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="l_name">last name</label>
											</div>
											<div>
												<input type="text" id="l_name" name="l_name">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="telephone">telephone</label>
											</div>
											<div>
												<input type="text" id="telephone" name="telephone">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="national_id">national id</label>
											</div>
											<div>
												<input type="text" id="national_id" name="national_id">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="card_number">card_number</label>
											</div>
											<div>
												<input type="text" id="card_number" name="card_number">
											</div>
										</div>
										<div class="btn">
											<button type="reset">Clear</button>
											<button type="button" onclick='moveToTab("tab-2")'>Next
												Step</button>
										</div>
									</div>

								</div>
							</div>
							<div class="tab">
								<input id="tab-2" name="tab" class="tab-radio" type="radio">
								<div class="tab-content">
									<div class="fields">
										<div class="row">
											<div>
												<label for="country">Country</label>
											</div>
											<div>
												<select id="country" name="country">
													<option value="">Country...</option>
													<option value="Afganistan">Afghanistan</option>
													<option value="Albania">Albania</option>
													<option value="Algeria">Algeria</option>
													<option value="American Samoa">American Samoa</option>
													<option value="Andorra">Andorra</option>
													<option value="Angola">Angola</option>
													<option value="Anguilla">Anguilla</option>
													<option value="Antigua &amp; Barbuda">Antigua
														&amp; Barbuda</option>
													<option value="Argentina">Argentina</option>
													<option value="Armenia">Armenia</option>
													<option value="Aruba">Aruba</option>
													<option value="Australia">Australia</option>
													<option value="Austria">Austria</option>
													<option value="Azerbaijan">Azerbaijan</option>
													<option value="Bahamas">Bahamas</option>
													<option value="Bahrain">Bahrain</option>
													<option value="Bangladesh">Bangladesh</option>
													<option value="Barbados">Barbados</option>
													<option value="Belarus">Belarus</option>
													<option value="Belgium">Belgium</option>
													<option value="Belize">Belize</option>
													<option value="Benin">Benin</option>
													<option value="Bermuda">Bermuda</option>
													<option value="Bhutan">Bhutan</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Bonaire">Bonaire</option>
													<option value="Bosnia &amp; Herzegovina">Bosnia
														&amp; Herzegovina</option>
													<option value="Botswana">Botswana</option>
													<option value="Brazil">Brazil</option>
													<option value="British Indian Ocean Ter">British
														Indian Ocean Ter</option>
													<option value="Brunei">Brunei</option>
													<option value="Bulgaria">Bulgaria</option>
													<option value="Burkina Faso">Burkina Faso</option>
													<option value="Burundi">Burundi</option>
													<option value="Cambodia">Cambodia</option>
													<option value="Cameroon">Cameroon</option>
													<option value="Canada">Canada</option>
													<option value="Canary Islands">Canary Islands</option>
													<option value="Cape Verde">Cape Verde</option>
													<option value="Cayman Islands">Cayman Islands</option>
													<option value="Central African Republic">Central
														African Republic</option>
													<option value="Chad">Chad</option>
													<option value="Channel Islands">Channel Islands</option>
													<option value="Chile">Chile</option>
													<option value="China">China</option>
													<option value="Christmas Island">Christmas Island</option>
													<option value="Cocos Island">Cocos Island</option>
													<option value="Colombia">Colombia</option>
													<option value="Comoros">Comoros</option>
													<option value="Congo">Congo</option>
													<option value="Cook Islands">Cook Islands</option>
													<option value="Costa Rica">Costa Rica</option>
													<option value="Cote DIvoire">Cote D'Ivoire</option>
													<option value="Croatia">Croatia</option>
													<option value="Cuba">Cuba</option>
													<option value="Curaco">Curacao</option>
													<option value="Cyprus">Cyprus</option>
													<option value="Czech Republic">Czech Republic</option>
													<option value="Denmark">Denmark</option>
													<option value="Djibouti">Djibouti</option>
													<option value="Dominica">Dominica</option>
													<option value="Dominican Republic">Dominican
														Republic</option>
													<option value="East Timor">East Timor</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Egypt">Egypt</option>
													<option value="El Salvador">El Salvador</option>
													<option value="Equatorial Guinea">Equatorial
														Guinea</option>
													<option value="Eritrea">Eritrea</option>
													<option value="Estonia">Estonia</option>
													<option value="Ethiopia">Ethiopia</option>
													<option value="Falkland Islands">Falkland Islands</option>
													<option value="Faroe Islands">Faroe Islands</option>
													<option value="Fiji">Fiji</option>
													<option value="Finland">Finland</option>
													<option value="France">France</option>
													<option value="French Guiana">French Guiana</option>
													<option value="French Polynesia">French Polynesia</option>
													<option value="French Southern Ter">French
														Southern Ter</option>
													<option value="Gabon">Gabon</option>
													<option value="Gambia">Gambia</option>
													<option value="Georgia">Georgia</option>
													<option value="Germany">Germany</option>
													<option value="Ghana">Ghana</option>
													<option value="Gibraltar">Gibraltar</option>
													<option value="Great Britain">Great Britain</option>
													<option value="Greece">Greece</option>
													<option value="Greenland">Greenland</option>
													<option value="Grenada">Grenada</option>
													<option value="Guadeloupe">Guadeloupe</option>
													<option value="Guam">Guam</option>
													<option value="Guatemala">Guatemala</option>
													<option value="Guinea">Guinea</option>
													<option value="Guyana">Guyana</option>
													<option value="Haiti">Haiti</option>
													<option value="Hawaii">Hawaii</option>
													<option value="Honduras">Honduras</option>
													<option value="Hong Kong">Hong Kong</option>
													<option value="Hungary">Hungary</option>
													<option value="Iceland">Iceland</option>
													<option value="India">India</option>
													<option value="Indonesia">Indonesia</option>
													<option value="Iran">Iran</option>
													<option value="Iraq">Iraq</option>
													<option value="Ireland">Ireland</option>
													<option value="Isle of Man">Isle of Man</option>
													<option value="Israel">Israel</option>
													<option value="Italy">Italy</option>
													<option value="Jamaica">Jamaica</option>
													<option value="Japan">Japan</option>
													<option value="Jordan">Jordan</option>
													<option value="Kazakhstan">Kazakhstan</option>
													<option value="Kenya">Kenya</option>
													<option value="Kiribati">Kiribati</option>
													<option value="Korea North">Korea North</option>
													<option value="Korea Sout">Korea South</option>
													<option value="Kuwait">Kuwait</option>
													<option value="Kyrgyzstan">Kyrgyzstan</option>
													<option value="Laos">Laos</option>
													<option value="Latvia">Latvia</option>
													<option value="Lebanon">Lebanon</option>
													<option value="Lesotho">Lesotho</option>
													<option value="Liberia">Liberia</option>
													<option value="Libya">Libya</option>
													<option value="Liechtenstein">Liechtenstein</option>
													<option value="Lithuania">Lithuania</option>
													<option value="Luxembourg">Luxembourg</option>
													<option value="Macau">Macau</option>
													<option value="Macedonia">Macedonia</option>
													<option value="Madagascar">Madagascar</option>
													<option value="Malaysia">Malaysia</option>
													<option value="Malawi">Malawi</option>
													<option value="Maldives">Maldives</option>
													<option value="Mali">Mali</option>
													<option value="Malta">Malta</option>
													<option value="Marshall Islands">Marshall Islands</option>
													<option value="Martinique">Martinique</option>
													<option value="Mauritania">Mauritania</option>
													<option value="Mauritius">Mauritius</option>
													<option value="Mayotte">Mayotte</option>
													<option value="Mexico">Mexico</option>
													<option value="Midway Islands">Midway Islands</option>
													<option value="Moldova">Moldova</option>
													<option value="Monaco">Monaco</option>
													<option value="Mongolia">Mongolia</option>
													<option value="Montserrat">Montserrat</option>
													<option value="Morocco">Morocco</option>
													<option value="Mozambique">Mozambique</option>
													<option value="Myanmar">Myanmar</option>
													<option value="Nambia">Nambia</option>
													<option value="Nauru">Nauru</option>
													<option value="Nepal">Nepal</option>
													<option value="Netherland Antilles">Netherland
														Antilles</option>
													<option value="Netherlands">Netherlands (Holland,
														Europe)</option>
													<option value="Nevis">Nevis</option>
													<option value="New Caledonia">New Caledonia</option>
													<option value="New Zealand">New Zealand</option>
													<option value="Nicaragua">Nicaragua</option>
													<option value="Niger">Niger</option>
													<option value="Nigeria">Nigeria</option>
													<option value="Niue">Niue</option>
													<option value="Norfolk Island">Norfolk Island</option>
													<option value="Norway">Norway</option>
													<option value="Oman">Oman</option>
													<option value="Pakistan">Pakistan</option>
													<option value="Palau Island">Palau Island</option>
													<option value="Palestine">Palestine</option>
													<option value="Panama">Panama</option>
													<option value="Papua New Guinea">Papua New Guinea</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Peru">Peru</option>
													<option value="Phillipines">Philippines</option>
													<option value="Pitcairn Island">Pitcairn Island</option>
													<option value="Poland">Poland</option>
													<option value="Portugal">Portugal</option>
													<option value="Puerto Rico">Puerto Rico</option>
													<option value="Qatar">Qatar</option>
													<option value="Republic of Montenegro">Republic of
														Montenegro</option>
													<option value="Republic of Serbia">Republic of
														Serbia</option>
													<option value="Reunion">Reunion</option>
													<option value="Romania">Romania</option>
													<option value="Russia">Russia</option>
													<option value="Rwanda">Rwanda</option>
													<option value="St Barthelemy">St Barthelemy</option>
													<option value="St Eustatius">St Eustatius</option>
													<option value="St Helena">St Helena</option>
													<option value="St Kitts-Nevis">St Kitts-Nevis</option>
													<option value="St Lucia">St Lucia</option>
													<option value="St Maarten">St Maarten</option>
													<option value="St Pierre &amp; Miquelon">St Pierre
														&amp; Miquelon</option>
													<option value="St Vincent &amp; Grenadines">St
														Vincent &amp; Grenadines</option>
													<option value="Saipan">Saipan</option>
													<option value="Samoa">Samoa</option>
													<option value="Samoa American">Samoa American</option>
													<option value="San Marino">San Marino</option>
													<option value="Sao Tome &amp; Principe">Sao Tome
														&amp; Principe</option>
													<option value="Saudi Arabia">Saudi Arabia</option>
													<option value="Senegal">Senegal</option>
													<option value="Serbia">Serbia</option>
													<option value="Seychelles">Seychelles</option>
													<option value="Sierra Leone">Sierra Leone</option>
													<option value="Singapore">Singapore</option>
													<option value="Slovakia">Slovakia</option>
													<option value="Slovenia">Slovenia</option>
													<option value="Solomon Islands">Solomon Islands</option>
													<option value="Somalia">Somalia</option>
													<option value="South Africa">South Africa</option>
													<option value="Spain">Spain</option>
													<option value="Sri Lanka">Sri Lanka</option>
													<option value="Sudan">Sudan</option>
													<option value="Suriname">Suriname</option>
													<option value="Swaziland">Swaziland</option>
													<option value="Sweden">Sweden</option>
													<option value="Switzerland">Switzerland</option>
													<option value="Syria">Syria</option>
													<option value="Tahiti">Tahiti</option>
													<option value="Taiwan">Taiwan</option>
													<option value="Tajikistan">Tajikistan</option>
													<option value="Tanzania">Tanzania</option>
													<option value="Thailand">Thailand</option>
													<option value="Togo">Togo</option>
													<option value="Tokelau">Tokelau</option>
													<option value="Tonga">Tonga</option>
													<option value="Trinidad &amp; Tobago">Trinidad
														&amp; Tobago</option>
													<option value="Tunisia">Tunisia</option>
													<option value="Turkey">Turkey</option>
													<option value="Turkmenistan">Turkmenistan</option>
													<option value="Turks &amp; Caicos Is">Turks &amp;
														Caicos Is</option>
													<option value="Tuvalu">Tuvalu</option>
													<option value="Uganda">Uganda</option>
													<option value="Ukraine">Ukraine</option>
													<option value="United Arab Erimates">United Arab
														Emirates</option>
													<option value="United Kingdom">United Kingdom</option>
													<option value="United States of America">United
														States of America</option>
													<option value="Uraguay">Uruguay</option>
													<option value="Uzbekistan">Uzbekistan</option>
													<option value="Vanuatu">Vanuatu</option>
													<option value="Vatican City State">Vatican City
														State</option>
													<option value="Venezuela">Venezuela</option>
													<option value="Vietnam">Vietnam</option>
													<option value="Virgin Islands (Brit)">Virgin
														Islands (Brit)</option>
													<option value="Virgin Islands (USA)">Virgin
														Islands (USA)</option>
													<option value="Wake Island">Wake Island</option>
													<option value="Wallis &amp; Futana Is">Wallis
														&amp; Futana Is</option>
													<option value="Yemen">Yemen</option>
													<option value="Zaire">Zaire</option>
													<option value="Zambia">Zambia</option>
													<option value="Zimbabwe">Zimbabwe</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div>
												<label for="city">City</label>
											</div>
											<div>
												<input type="text" id="city" name="city">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="state">state</label>
											</div>
											<div>
												<input type="text" id="state" name="state">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="street">street</label>
											</div>
											<div>
												<input type="text" id="street" name="street">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="zip_code">zip code</label>
											</div>
											<div>
												<input type="text" id="zip_code" name="zip_code">
											</div>
										</div>
										
										<div class="btn">
											<button type="reset">Clear</button>
											<button type="button" onclick='moveToTab("tab-3")'>Next
												Step</button>
										</div>
									</div>
								</div>
							</div>
							<div class="tab">
								<input id="tab-3" name="tab" class="tab-radio" type="radio">
								<div class="tab-content">

									<div class="fields">
										<div class="row">
											<div>
												<label for="email">E-mail</label>
											</div>
											<div>
												<input type="email" id="email" name="email">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="username">Username</label>
											</div>
											<div>
												<input type="text" id="username" name="username">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="password">Password</label>
											</div>
											<div>
												<input type="password" id="password" name="password">
											</div>
										</div>
										<div class="row">
											<div>
												<label for="password">Confirm Password</label>
											</div>
											<div>
												<input type="password" id="password" name="conf_password">
											</div>
										</div>
											<div class="row">
											<div>
												<label for="fax">fax</label>
											</div>
											<div>
												<input type="text" id="fax" name="fax">
											</div>
										</div>
										<div class="btn">
											<button type="reset">Clear</button>
											<button type="submit">Finish</button>
										</div>
									</div>
								</div>
							</div>
						</form>
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
	function moveToTab(name){
		$("#"+name).attr("checked" , true).siblings(".tab-content").css({
			display:"block",
			width:"100%"
		}) ;
		$("input[type=radio]:not(input#"+name+")").removeAttr("checked").siblings(".tab-content").css("display","none");
		$("label").find("span").removeClass("tab-num-focus");
		$("label").find("div").removeClass("tab-lbl-focus");
		$("label[for="+name+"]").find("span").addClass("tab-num-focus");
		$("label[for="+name+"]").find("div").addClass("tab-lbl-focus");
	}
	moveToTab('tab-1');
	</script>
</body>
</html>