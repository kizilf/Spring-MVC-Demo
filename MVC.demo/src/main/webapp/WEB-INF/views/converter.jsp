<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Currency Converter</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Custom CSS -->
<link href="/WEB-INF/css/styling.css" rel="stylesheet">
<!-- Javascript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
html {
	font-size: 20px;
}

.panel {
	background: #333333;
	border: solid white;
}

.results {
	font-size: 1em;
	color: #FFFFFF;
}

.dropdown {
	margin-bottom: 50px;
}

.inline-block {
	display: inline-block;
}

.center {
	width: 90%;
	margin: 0 auto 30px;
}
</style>

</head>

<body>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Personal
				Website of Mine</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<security:authorize access="hasAnyRole('ADMIN','USER')">
						<li class="nav-item active"><a class="nav-link" href="/">Home
								<span class="sr-only">(current)</span>
						</a></li>
					</security:authorize>
					<!-- Only Admin Can Show Students -->
					<security:authorize access="hasRole('ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/list">Students</a>
						</li>
					</security:authorize>

					<!-- Only Logged in Users  Can Show Currency -->
					<security:authorize access="hasAnyRole('ADMIN','USER')">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/converter">Currency
								Converter</a></li>
					</security:authorize>
					
				</ul>
				<!-- Only Anonymous Users  Can Show Students -->
				<security:authorize access="hasRole('ANONYMOUS')">

					<form:form
						action="${pageContext.request.contextPath}/authenticateTheUser"
						method="POST">
						<ul class="navbar-nav navbar-right">

							<li><input type="text" name="username"
								placeholder="username" class="form-control"></li>
							<li><input type="password" name="password"
								placeholder="password" class="form-control"></li>


							<li>
								<button type="submit" class="btn btn-success">Sign In</button>
							</li>
							<li><a
								href="${pageContext.request.contextPath}/showStudentForm"
								class="btn btn-primary">Register</a></li>

						</ul>
					</form:form>
				</security:authorize>
				
				<security:authorize access="hasAnyRole('ADMIN','USER')">

					<form:form
						action="${pageContext.request.contextPath}/logout"
						method="POST">
						<ul class="navbar-nav navbar-right">
							<li>
								<button type="submit" value="Logout" class="btn btn-success">Logout</button>
							</li>
						</ul>
					</form:form>
				</security:authorize>
			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div class=container>
		<table class="table table-striped">
			<tr>
				<th>Currency Name</th>
				<th>Rate</th>
				<th>Inverse Rate</th>
			</tr>
			<tr>
				<td>${currency.usd.name}</td>
				<td>${currency.usd.rate} ${currency.usd.code}</td>
				<td>${currency.usd.inverseRate} ${currency.usd.code}</td>
			</tr>
			<tr>
				<td>${currency.eur.name}</td>
				<td>${currency.eur.rate} ${currency.eur.code}</td>
				<td>${currency.eur.inverseRate} ${currency.eur.code}</td>
			</tr>
			<tr>
				<td>${currency.gbp.name}</td>
				<td>${currency.gbp.rate} ${currency.gbp.code}</td>
				<td>${currency.gbp.inverseRate} ${currency.gbp.code}</td>
			</tr>
			<tr>
				<td>${currency.cad.name}</td>
				<td>${currency.cad.rate} ${currency.cad.code}</td>
				<td>${currency.cad.inverseRate} ${currency.cad.code}</td>
			</tr>
			<tr>
				<td>${currency.jpy.name}</td>
				<td>${currency.jpy.rate} ${currency.jpy.code}</td>
				<td>${currency.jpy.inverseRate} ${currency.jpy.code}</td>
			</tr>
			<tr>
				<td>${currency.chf.name}</td>
				<td>${currency.chf.rate} ${currency.chf.code}</td>
				<td>${currency.chf.inverseRate} ${currency.chf.code}</td>
			</tr>
		</table>
	</div>
	<!-- /.row -->

	<br>
	<br>
	<!-- Money pics -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<img
						src="http://a57.foxnews.com/images.foxnews.com/content/fox-news/tech/2016/11/30/u-k-s-first-ever-plastic-5-bill-has-really-upset-vegans/_jcr_content/par/featured_image/media-0.img.jpg/876/493/1480522867287.jpg"
						alt="Pic1" style="width: 100%">
					
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
				<img
						src="https://w-dog.net/wallpapers/12/1/458166855232810/money-euro-euro-currency-notes-close-up.jpg"
						alt="Pic2" style="width: 100%">
				
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<img
						src="https://cdn.shutterstock.com/shutterstock/videos/7477096/thumb/9.jpg"
						alt="Pic3" style="width: 100%">
				</div>
			</div>
		</div>
	</div>
	<!-- End of money pics -->

	<!-- Footer -->
	<div class=footer>
		<center>
			<i>Values are updating daily</i>
		</center>
	</div>
</body>

</html>

</html>