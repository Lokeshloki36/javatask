<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view details</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
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
					<input class="form-control me-2" type="text" name="name"
						placeholder="Enter Name" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<h1 class="text-center">Records Found : </h1>
		<div class="table-responsive">
			<table class="table table-striped" id="tb">
				<thead>
					<tr>
						<th class="col-lg-1 col-md-1 col-sm-1">S.No</th>
						<th class="col-lg-2 col-md-2 col-sm-2">Name</th>
						<th class="col-lg-2 col-md-2 col-sm-2">Email</th>
						<th class="col-lg-2 col-md-2 col-sm-2">Date of Birth</th>
						<th class="col-lg-1 col-md-1 col-sm-1">Age</th>
						<th class="col-lg-2 col-md-2 col-sm-2">Salary</th>
						<th class="col-lg-1 col-md-1 col-sm-1">Status</th>
						<th colspan="2" class="col-lg-1 col-md-1 col-sm-1 text-center">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${record}">
						<tr>
							 <td class="col-lg-1 col-md-1 col-sm-1">${employee.id}</td>
							 <td class="col-lg-2 col-md-2 col-sm-2">${employee.name}</td>
							 <td class="col-lg-2 col-md-2 col-sm-2">${employee.email}</td>
							 <td class="col-lg-2 col-md-2 col-sm-2">${employee.dob}</td>
							 <td class="col-lg-1 col-md-1 col-sm-1">${employee.age}</td>
							 <td class="col-lg-2 col-md-2 col-sm-2">${employee.salary}</td>
							 <td class="col-lg-1 col-md-1 col-sm-1"><c:choose>
								<c:when test="${employee.status==true}">
									Active
								</c:when>
									<c:otherwise>
								Inactive
								</c:otherwise>
								</c:choose></td>
							<td class="col-lg-1 col-md-1 col-sm-1"><a href="update?id=${employee.id}" class="btn btn-info"><i
									class="fas fa-edit"></i></a></td>
							<td class="col-lg-1 col-md-1 col-sm-1"><a href="delete?id=${employee.id}"
								class="btn btn-danger"><i class="fas fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>