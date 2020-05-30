<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Personal Varying Project of Mine</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/business-frontpage.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
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
						<li class="nav-item active"><a class="nav-link" href="#">Home
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
							<li>
							<a
								href="${pageContext.request.contextPath}/showStudentForm"
								class="btn btn-primary">Register</a>
								</li>

						</ul>
					</form:form>
				</security:authorize>

				<security:authorize access="hasAnyRole('ADMIN','USER')">

					<form:form action="${pageContext.request.contextPath}/logout"
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

	<!-- Header with Background Image -->
	<header class="business-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="display-3 text-center text-white mt-4">Invisable
						Header</h1>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-xs-15">
				<div>

					<!-- Check for login error -->

					<c:if test="${param.error != null}">

						<div class="alert alert-danger col-xs-offset-1 col-xs-10">
							Invalid username and password.</div>

					</c:if>

					<!-- Check for logout -->

					<c:if test="${param.logout != null}">

						<div class="alert alert-success col-xs-offset-1 col-xs-10">
							You have been logged out.</div>

					</c:if>

				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2 class="mt-4">Personal Project</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A
					deserunt neque tempore recusandae animi soluta quasi? Asperiores
					rem dolore eaque vel, porro, soluta unde debitis aliquam
					laboriosam. Repellat explicabo, maiores!</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Omnis optio neque consectetur consequatur magni in nisi, natus
					beatae quidem quam odit commodi ducimus totam eum, alias, adipisci
					nesciunt voluptate. Voluptatum.</p>

			</div>
			<div class="col-sm-4">
				<h2 class="mt-4">Contact</h2>
				<address>
					<strong>Furkan KIZILTAN</strong> <br>Ovecler 4.Cadde <br>Ankara
					/ Cankaya <br>
				</address>
				<address>
					<abbr title="Phone">P:</abbr> (530) 443-6110 <br> <abbr
						title="Email">E:</abbr> <a href="mailto:#">kiziltan.furkan@gmail.com</a>
				</address>
			</div>
		</div>
		<!-- /.row -->
		<div class=container>
			<div class="row">
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top"
							src="https://media.giphy.com/media/7yDthHaq2haXS/giphy.gif"
							alt="">
					</div>
				</div>
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top"
							src="https://media.giphy.com/media/c4u2gld3Or69i/giphy.gif"
							alt="">
					</div>
				</div>
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top"
							src="https://media.giphy.com/media/KodIwOqmyQ5Us/giphy.gif"
							alt="">
					</div>
				</div>

			</div>
			<!-- /.row -->
		</div>
	</div>

	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Furkan
				KIZILTAN 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>