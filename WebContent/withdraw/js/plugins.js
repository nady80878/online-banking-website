$(document).ready(function(){
	$(".formdiv").slideDown(2000);
	
	
	$(".btn").click(function(){
		
		
		$(".get").text($("YOUR MAIL IS:" +  "#exampleInputEmail1").val());
	$(".get2").text($("YOUR PASSWARD IS" + "#exampleInputPassword1").val());
		
		
		});
	
    
});