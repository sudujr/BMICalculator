<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HeaderFooterPage</title>
</head>

<!-- Css Stylesheet for header and Fotter -->
<style>
body {
	background-image:
		url("<c:url value='/webapp/resources/images/back.jpg'/>");
	padding-top: 80px;
	padding-bottom: 80px;
}

.full-width {
	text-align: center;
	position: fixed;
	margin: 0 -9999rem;
	/* add back negative margin value */
	padding: 0.25rem 9999rem;
	background: black;
	top: 0;
}

header {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color: black;
	color: white;
	text-align: center;
	left: 0;
}

footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: black;
	color: white;
	text-align: center;
}
</style>
<body>
	<!-- Header -->
	<header class="full-width">
		<h3>
			<marquee behavior="scroll" direction="left">BMI CALCULATOR</marquee>
		</h3>
	</header>
	<!-- Footer -->
	<footer>
		<p>2020 © Sudharshan</p>
	</footer>

</body>
</html>