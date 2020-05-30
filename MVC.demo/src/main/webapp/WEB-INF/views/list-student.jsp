<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Student Registration System</title>
</head>
<body>

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

						<li><input type="text" name="username" placeholder="username"
							class="form-control"></li>
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

	<div class="container">
		<div class="jumbotron">
			<h1>Welcome to User Registration System!</h1>
			<p>
				<a class="btn btn-primary btn-lg"
					onclick="window.location.href='${pageContext.request.contextPath}/showStudentForm'; return false;"
					type="button" role="button">Add New User</a>
			</p>
		</div>


		<div>
			<table class="table table-striped">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
					<th>Password</th>
					<th>Update/Delete</th>
				</tr>
				<c:forEach var="tempStudent" items="${students}">
		
					<tr>
						<td>${tempStudent.firstName}</td>
						<td>${tempStudent.lastName}</td>
						<td>${tempStudent.username}</td>
						<td>${tempStudent.password}</td>
						
						<td><a class="btn btn-warning"
							href="${pageContext.request.contextPath}/admin/showFormForUpdate?studentID=${tempStudent.username}">Update</a>
							<a class="btn btn-danger"
							href="${pageContext.request.contextPath}/admin/deleteStudent?studentID=${tempStudent.username}"
							onclick="if(!(confirm('Are you sure?'))) return false;">Delete</a></td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>