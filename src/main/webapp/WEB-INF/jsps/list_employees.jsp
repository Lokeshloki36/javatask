<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap.css">
<style>
body {
	padding: 20px;
}

table {
	background-color: #e9ecef;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th {
	background-color: #348feb;
}
</style>
</head>
<body>
	<a href="createEmployee">New Employee</a>
	<div class="container">
		<h1 class="text-center">Employee List</h1>
		<div class="table-responsive">
			<table class="table table-striped ">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Name</th>
						<th>Email</th>
						<th>Date of Birth</th>
						<th>Age</th>
						<th>Salary</th>
						<th>Status</th>
						<th colspan="2">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${employee}">
						<tr>
							<td>${employee.id}</td>
							<td>${employee.name}</td>
							<td>${employee.email}</td>
							<td>${employee.dob}</td>
							<td>${employee.age}</td>
							<td>${employee.salary}</td>
							<td>${employee.status}</td>
							<td><a href="update?id=${employee.id}"
								class="btn btn-primary" role="button">Update</a></td>
							<td><a href="delete?id=${employee.id}">Delete</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>