<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>
<style>
.buttonSub {
	position: absoute;
	text-align: center;
	background-color: red;
	/*left: 50%;*/
	color: white;
	float: center;
	border: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;;
	text-align: center;
	margin: 0 0 0 48%;
}

.buttonSub:hover {
	background-color: dodgerblue;
}
</style>

<body>
	<!-- Includes the header footer page -->
	<!-- Helps to remove redundant coding -->
	<jsp:include page="hf.jsp"></jsp:include>
	<!-- Form for logout button -->
	<form action="logoutForm" method="post">
		<button class="buttonSub" name="0" value="signin">Logout</button>
	</form>
</body>
</html>