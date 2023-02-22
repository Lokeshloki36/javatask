<!DOCTYPE html>
<html>
<head>
<title>create new employee</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script>
        $( function() {
            $( "#dob" ).datepicker({
            		 changeMonth:true,
                     changeYear:true,
                     yearRange:'1950:2020'
            });
        } );
    </script>
</head>
<body>
	<a href="listall">Home</a>
	<div class="container">
		<header class="text-center">
			<h1>Create New Employee</h1>
		</header>
	</div>
	<form action="saveEmployee" method="post">
		<div class="container">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" name="name" id="name" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" name="email" id="email" required>
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth:</label> <input type="text"
					class="form-control" name="dob" id="dob" onchange="calculateAge()"
					required>
			</div>
			<div class="form-group">
				<label for="age">Age:</label> <input type="number"
					class="form-control" name="age" id="age" readonly>
			</div>
			<div class="form-group">
				<label for="salary">Salary:</label> <input type="text"
					class="form-control" name="salary" id="salary" required>
			</div>
			<div class="form-group">
				<label for="status">Status:</label> <select name="status"
					class="form-control" id="status" required>
					<option value="true">Active</option>
					<option value="false">InActive</option>
				</select>
			</div>

			<button type="submit" class="btn btn-default">Submit</button>
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