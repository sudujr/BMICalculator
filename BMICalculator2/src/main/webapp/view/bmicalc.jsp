<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bmicalc Page</title>
<!-- StyleSheet for BMI Calculation and diet prediction page -->
<style type="text/css">
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

.buttonSubmit:hover {
	background-color: dodgerblue;
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

#enter {
	text-align: center;
	color: black;
	font-size: 20px;
}

#s {
	text-align: center;
	color: black;
	font-size: 25px
}

#x {
	text-align: justify;
	font-size: 25px;
	color: green;
	margin-left: 30%;
	margin-right: 30%;
	margin-left: 30%;
}
</style>
</head>
<body>

	<!-- Includes logout page -->
	<!-- Helps to remove redundant coding -->
	<jsp:include page="logout.jsp"></jsp:include>

	<p id="enter">Enter the following details</p>

	<!-- Form to collect user data -->
	<form action="inForm" method="post">
		<table class="center">
			<tr>
				<td>Age</td>
				<td><input class="in" type="text" name="age" value="${obj.age}" />
				</td>
			</tr>
			<tr>
				<td>Sex</td>
				<td><input class="in" type="text" name="sex" value="${obj.sex}" /></td>
			</tr>
			<tr>
				<td>Weight</td>
				<td><input class="in" type="text" name="weight"
					value="${obj.weight}" /></td>
			</tr>
			<tr>
				<td>Height</td>
				<td><input class="in" type="text" name="height"
					value="${obj.height}" /></td>
			</tr>
		</table>
		<center>
			&nbsp;&nbsp;&nbsp;
			<button class="buttonSubmit" name="1" value="bmic">ComputeBMI</button>
		</center>
	</form>

	<!-- Display after computing bmi value -->
	<c:if test="${not empty obj.bmi}">
		<p id="s">BMI = ${obj.bmi}</p>

		<!-- Form for User to view Diet and Exercise suggestion -->
		<form action="dietForm" method="post">



			<input type="hidden" name="age" value="${obj.age}"> <input
				type="hidden" name="sex" value="${obj.sex}"> <input
				type="hidden" name="weight" value="${obj.weight}"> <input
				type="hidden" name="height" value="${obj.height}"> <input
				type="hidden" name="bmi" value="${obj.bmi}"> <input
				type="hidden" name="Category" value="${obj.type}">
			<c:if test="${not empty obj.type}">
				<p id="s">Type = ${obj.type}</p>
			</c:if>
			<center>


				<button class="buttonSubmit" name="0" value="diet">View
					Diet and Exercise Suggestion</button>
			</center>
		</form>

	</c:if>

	<!-- Display Diet Suggestion -->
	<c:if test="${not empty s1}">
		<p id=s>DIET SUGGESTION</p>

		<p id="x">${s1}</p>
	</c:if>
	&nbsp;&nbsp;

	<!-- Display Exercise Siggestion -->
	<c:if test="${not empty s2}">
		<p id=s>EXERCISE SUGGESTION</p>

		<p id="x">${s2}</p>
	</c:if>


</body>
</html>