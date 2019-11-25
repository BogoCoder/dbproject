<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<!--Font-->
	<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="../css/pago_en_linea.css">
	

	<title>Pago en línea</title>
	<link rel="icon" href="../img/favicon.png">
</head>

<body>
	<div class="container">

	<form class="needs-validation" novalidate action="/arrpi/arrpiServlet/PagoEnLinea">

		<div class="form-group">
				<label for="input_codfac">Código de restaurante</label>
				<input type="number" class="form-control" name = "input_codfac" id="input_codfac"  placeholder="Léelo bien..." required>
				<div class="invalid-feedback">
					Debe haber un código.
				</div>
		</div>

		<div class="form-group">
				<label for="input_nombre">Nombre de usuario</label>
				<input type="text" class="form-control" name = "input_nombre" id="input_nombre"  placeholder="¡No apellidos!" required>
				<div class="invalid-feedback">
					Según nuestras fuentes, deberías tener nombre.
				</div>
		</div>

		<div class="form-group">
				<label for="input_fecha">Fecha</label>
				<input type="text" class="form-control" name = "input_fecha" id="input_fecha"  placeholder="AA-MM-DD" required>
				<div class="invalid-feedback">
					Mira tu calendario...
				</div>
		</div>

		<div class="form-group">
				<label for="input_cantidad">Cantidad</label>
				<input type="number" class="form-control" name = "input_cantidad" id="input_cantidad"  placeholder="Que sea más de 0..." required>
				<div class="invalid-feedback">
					Que sea maś de 0...
				</div>
		</div>

		<div class="alert alert-info" role="alert">
				<h4 class="alert-heading">Resultado</h4>
				<p><strong>${confirm}</strong></p>
		</div>

		<button type="submit" class="btn btn-danger enviar">Enviar</button>
	</form>
	<!-- <div class = "principal">
			<a href="index.html"><img class = "principaltext" src= "../img/principal.png" alt="principal"></a> 
	</div> -->
	<div class = "arrpi">
			<a><img class = "arrpilogo" src= "../img/arrpi.png" alt="arrpi"></a> 
	</div> 
	
	<script>
			// Example starter JavaScript for disabling form submissions if there are invalid fields
			(function() {
			  'use strict';
			  window.addEventListener('load', function() {
				// Fetch all the forms we want to apply custom Bootstrap validation styles to
				var forms = document.getElementsByClassName('needs-validation');
				// Loop over them and prevent submission
				var validation = Array.prototype.filter.call(forms, function(form) {
				  form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
					  event.preventDefault();
					  event.stopPropagation();
					}
					form.classList.add('was-validated');
				  }, false);
				});
			  }, false);
			})();
	</script>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
</body>
</html>