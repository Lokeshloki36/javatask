<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>create new employee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$("#dob").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1970:2020'
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a href="listall" class="nav-link active">Home</a>
					</li>
					<li class="nav-item"><a href="createEmployee"
						class="nav-link active">Create</a>
				</ul>
				<form action="search" method="get" class="d-flex">
					<input class="form-control me-2" type="text"name="name"
						placeholder="Enter Name" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<header class="text-center">
			<h1>Create New Employee</h1>
		</header>
	</div>
	<div class="container">
		<form:form action="saveEmployee" method="post"
			modelAttribute="employee">
			<div class="form-group">
				<form:label path="name">Name :</form:label>
				<form:input path="name" class="form-control"
					placeholder="Enter Name" id="name" required="true" />
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input type="email" class="form-control"
					placeholder="Enter Email" path="email" id="email" required="true" />
			</div>
			<div class="form-group">
				<form:label path="dob">Date of Birth:</form:label>
				<form:input class="form-control" placeholder="Enter DateOfBirth"
					path="dob" id="dob" onchange="calculateAge()" required="true" />
			</div>
			<div class="form-group">
				<form:label path="age">Age:</form:label>
				<form:input class="form-control" path="age" id="age" readonly="true" />
			</div>
			<div class="form-group">
				<form:label path="salary">Salary:</form:label>
				<form:input class="form-control" path="salary" id="salary"
					required="true" />
			</div>
			<div class="form-group">
				<form:label path="status">Status:</form:label>
				<form:select path="status" class="form-control" id="status"
					required="true">
					<form:option value="true">Active</form:option>
					<form:option value="false">InActive</form:option>
				</form:select>
			</div>
			<br>
			<button type="submit" class="btn btn-primary">Submit</button>
			<a href="listall" class="btn btn-danger">Cancel</a>
		</form:form>
	</div>
	<script>
		function calculateAge() {
			var dob = document.getElementById("dob").value;
			var today = new Date();
			var birthDate = new Date(dob);
			var age = today.getFullYear() - birthDate.getFullYear();
			var m = today.getMonth() - birthDate.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
				age--;
			}
			document.getElementById("age").value = age;
		}
	</script>
</body>
</html>