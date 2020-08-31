<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMICalculator</title>
<!-- Style Sheet for SignIn/ Signout Page -->
<style>
h3 {
	text-align: center;
	text-color: white;
}

/* Style the tab buttons */
.buttonSubmit {
	text-align: center;
	background-color: red;
	left: 50%;
	color: white;
	float: center;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 25%;
	text-align: center;
}

.i {
	width: 100;
}

#enter {
	text-align: center;
	color: black;
	font-size: 20px;
}

/* Change background color of buttons on hover */
.buttonSubmit:hover {
	background-color: dodgerblue;
}

.center {
	margin-right: 35%;
	margin-left: 35%;
}

table.center {
	margin-left: auto;
	margin-right: auto;
}

table, td {
	text-align: center;
	left: 50%;
	color: black;
	float: center;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 25%;
	justify-content: center;
	text-align: center;
}

.in {
	/*color: #FFFFFF;*/
	font-family: Verdana;
	font-size: 16px;
}

#s {
	text-align: center;
	color: red;
	text-weight: bold;
	font-size: 25px;
}

h2 {
	text-align: center;
	color: black;
}
</style>
</head>
<body>
	<!-- Includes the header footer page -->
	<!-- Helps to remove redundant coding -->
	<jsp:include page="hf.jsp"></jsp:include>
	<p id="enter">First time user ? SignUp ::: Existing User ? SignIn
		to get access</p>
		
	<!-- Form to select between SignIn or SignUp option -->	
	<form action="logForm" method="post">
		<div class="center">

			<center>
				<button class="buttonSubmit" name="0" value="signin">SignIn</button>
				<button class="buttonSubmit" name="1" value="signup">SignUp</button>
			</center>

		</div>
	</form>

	<!-- This part of code activates if SignIn option is selected -->
	<!-- Lets user to sign in with credential -->
	<c:if test="${sign == 'in'}">
		<h2>Enter SignIn details</h2>
		<!-- Form to collect SignIn details -->
		<form name=inForm action="signInForm"
			onsubmit="return validateInForm()" method="post" required>
			<c:if test="${not empty error}">
				<p id="s">Invalid Username/Password</p>
				<p id="s">Re-enter the details</p>
			</c:if>
			<c:if test="${not empty suc}">
				<p id="s">SignUp successful</p>
				<p id="s">SignIn to get access</p>
			</c:if>
			<table class="center">
				<tr>
					<td>UserId</td>
					<td><input class="in" type="text" name="userid"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input class="in" type="password" name="password"></td>
				</tr>
			</table>
			<center>
				&nbsp;&nbsp;&nbsp;
				<button class="buttonSubmit" name="0" value="signin">SignIn</button>
			</center>
		</form>
	</c:if>
	
	<!-- This part of code gets activated if SignUp option is selected -->
	<!-- Lets user to signup with the website -->
	<c:if test="${sign == 'up'}">
		<h2>Enter SignUp details</h2>
		<!-- Form to colect signup details -->
		<form name="upForm" action="signUpForm"
			onsubmit="return validateUpForm()" method="post">
			<c:if test="${not empty err}">
				<p id="s">UserName exists already</p>
				<p id="s">Enter a different UserName</p>
			</c:if>
			<table class="center">
				<tr>
					<td>Name</td>
					<td><input class="in" type="text" name="name"></td>
				</tr>
				<tr>
					<td>UserName</td>
					<td><input class="in" type="text" name="userid"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input class="in" type="password" name="password"></td>
				</tr>
			</table>
			<center>
				&nbsp;&nbsp;&nbsp;
				<input type="button"  class="buttonSubmit" name="1" value="signUp">SignUp</button>
			</center>
		</form>
	</c:if>
	
	<!-- Script for validating forms -->
	<script>
		function validateInForm() {
			var y = document.forms["inForm"]["userid"].value;
			var z = document.forms["inForm"]["password"].value;
			if (y == "" || y == null || z == "" || z == null) {
				alert("All Fields must be filled");
				return false;
			}
		}

		function validateUpForm() {
			var x = document.forms["upForm"]["name"].value;
			var y = document.forms["upForm"]["userid"].value;
			var z = document.forms["upForm"]["password"].value;
			if (x == "" || x == null || y == "" || y == null || z == "" || z == null ) {
				alert("All Fields must be filled");
				return false;
			}
		}
	</script>




</body>
</html>