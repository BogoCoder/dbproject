-- Busqueda de restaurantes
select nombre from Restaurante where nombre = input_nombre; -- Prototipo
select nombre from Restaurante where nombre  = 'Dados Pizza'; -- Ejemplo

select * from Restaurante where tipo_comida = input_tipo_comida AND input_precios <= precios AND direccion = input_direccion; -- Prototipo

select * from Restaurante where tipo_comida = 'Pollo' AND '25000' >= precios AND direccion = 'Usaquen'; -- Ejemplo


-- ARRPI Pay
select saldo from App_Usuario where usuario = input_usuario; -- Prototipo

select saldo from App_Usuario where usuario = 'samuelperez.di'; -- Ejemplo

-- Pago en linea
select nombre from Restaurante where nombre = input_nombre; -- Prototipo
select nombre from Restaurante where nombre  = 'CFK'; -- Ejemplo

-- Reservas
select nombre from Restaurante where nombre = input_nombre; -- Prototipo
select nombre from Restaurante where nombre  = 'Crips or Wiffles'; -- Ejemplo

-- Calificación y sugerencias
select nombre from Restaurante where nombre = input_nombre;
-- Ejemplo igual que en los casos anteriores
