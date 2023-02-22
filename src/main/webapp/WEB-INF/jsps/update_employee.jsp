<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update employee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script>
	$(function() {
		$("#dob").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1950:2020'
		});
	});
</script>
</head>
<body>
	<a href="listall">Home</a>
	<a href="createEmployee">Create</a>
	<div class="container">
		<header class="text-center">
			<h1>Update Employee Details</h1>
		</header>
	</div>
	<form action="updateEmployee" method="post">
		<div class="container">
			<input type="hidden" name="id" value="${employee.id}">

			<div class="form-group">
				<label for="name">Name :</label> <input type="text"
					class="form-control w-50" name="name" value="${employee.name}">
			</div>

			<div class="form-group">
				<label for="name">Email :</label> <input type="email"
					class="form-control w-50" name="email" value="${employee.email}">
			</div>

			<div class="form-group">
				<label for="name">DOB :</label> <input type="text"
					class="form-control w-50" name="dob" id="dob"
					onchange="calculateAge()" value="${employee.dob}">
			</div>

			<div class="form-group">
				<label for="name">Age :</label> <input type="text"
					class="form-control w-50" name="age" id="age"
					value="${employee.age}">
			</div>

			<div class="form-group">
				<label for="name">Salary :</label> <input type="text"
					class="form-control w-50" name="salary" value="${employee.salary}">
			</div>

			<div class="form-group">
				<label for="name">Status :</label> <select name="status"
					class="form-control w-50">
					<option value="true">Active</option>
					<option value="false">InActive</option>
				</select>
			</div>
			<button type="submit" class="btn btn-default">Update</button>
		</div>
	</form>
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