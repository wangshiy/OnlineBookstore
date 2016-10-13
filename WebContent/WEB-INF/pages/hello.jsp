<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script>
	$(document).ready(function() {
		$("#loginForm").on("submit", validateForm);
	});
	function validateForm() {
		$("#nameAndAgeReq").hide();
		$("#nameReq").hide();
		$("#ageReq").hide();
		$("#ageIllegal").hide();
		var name = $("#j_name").val();
		var age = $("#j_age").val();
		if (name.length==0 && age.length==0) {
			$("#nameAndAgeReq").show();
			return false;
		} else if (name.length==0) {
			$("#nameReq").show();
			return false;
		} else if (age.length==0) {
			$("#ageReq").show();
			return false;
		} else if (!($.isNumeric(age) && Math.floor(age)==age)) {
			$("#ageIllegal").show();
			return false;
		} 
		return true;
	}
</script>
<style>
	.alert {
		color: red;
		background: #fdf1e5;
		font-size: 10px;
		line-height: 16px;
		width: 200px;
		margin: 10;
		position: relative;
	}
</style>
</head>
<body>
<h2><font color="green">Test</font></h2>
<!-- Alerts for missing form info  --> 
<div class="alert" style="display: none;" id="nameAndAgeReq">
	<p>Name and Age are required</p>
</div>
<div class="alert" style="display:none;" id="nameReq">
	<p>Name is required</p>
</div>
<div class="alert" style="display:none;" id="ageReq">
	<p>Age is required</p>
</div>
<div class="alert" style="display:none;" id="ageIllegal">
	<p>Age is NOT an integer</p>
</div>
<!-- Form -->
<form action="hello.html" method="post" id="loginForm">
	<table>
		<tr>
			<td>Username: </td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>Email: </td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="text" name="password" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear"/>
				<input type="submit" value="Submit"/>
			</td>
		</tr>
	</table>
</form>
<!-- Book Form -->
<form action="querybook.html" method="get" id="bookForm">
	<table>
		<tr>
			<td>ISBN: </td>
			<td><input type="text" name="isbn" /></td>
		</tr>
		<tr>
			<td>Bookname: </td>
			<td><input type="text" name="bookname" /></td>
		</tr>
		<tr>
			<td>Author: </td>
			<td><input type="text" name="author" /></td>
		</tr>
		<tr>
			<td>Press: </td>
			<td><input type="text" name="press" /></td>
		</tr>
		<tr>
			<td>ReleasedMin: </td>
			<td><input type="date" name="releasedMin" /></td>
		</tr>
		<tr>
			<td>ReleasedMax: </td>
			<td><input type="date" name="releasedMax" /></td>
		</tr>
		<tr>
			<td>PriceMin: </td>
			<td><input type="number" name="priceMin" /></td>
		</tr>
		<tr>
			<td>PriceMax: </td>
			<td><input type="number" name="priceMax" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear"/>
				<input type="submit" value="Submit"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>