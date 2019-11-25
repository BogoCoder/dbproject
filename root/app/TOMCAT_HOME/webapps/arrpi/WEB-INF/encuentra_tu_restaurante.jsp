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

	<link rel="stylesheet" href="../css/encuentra_tu_restaurante.css">
	

	<title>Encuentra tu restaurante</title>
	<link rel="icon" href="../img/favicon.png">
</head>

<body>
	<div class="container">

	<form class="needs-validation" novalidate action="/arrpi/arrpiServlet/EncuentraTuRestaurante">
		<div class="form-group">
				<label for="input_comida">Tipo de comida</label>
				<select name = "input_comida" id="input_comida" class="form-control">
					<option selected>Pizza</option>
					<option>Crepes</option>
					<option>Pollo</option>
				</select>
		</div>
		<div class="form-group">
				<label for="input_presupuesto">Presupuesto</label>
				<div class="input-group">
					<div class="input-group-prepend">
					<div class="input-group-text">$</div>
					</div>
					<input type="number" class="form-control" name = "input_presupuesto" id="input_presupuesto"  placeholder="Ojalá no sea 0... (COP)" required>
					<div class="invalid-feedback">
						Es diferente 0 a vacío.
					</div>
				</div>
		</div>

		<div class="form-group">
				<label for="input_zona">Zona</label>
				<select name = "input_zona" id="input_zona" class="form-control">
					<option selected>Candelaria</option>
					<option>Cedritos</option>
					<option>Usaquén</option>
				</select>
		</div>
		<button type="submit" class="btn btn-danger enviar">Enviar</button>
		<div class="alert alert-info" role="alert">
				<h4 class="alert-heading">Resultados</h4>
				<p><strong>${confirm}</strong></p>
				<p class="mb-0">Puedes <a href="/arrpi/arrpiServlet/PagoEnLinea" class="alert-link">pagar en línea</a>,hacer una <a href="/arrpi/arrpiServlet/Reservas" class="alert-link">reserva</a>, o <a href="/arrpi/arrpiServlet/PagoEnLinea" class="alert-link">calificar</a>.</p>
		</div>
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