create table Usuario ( 
	usuario varchar not null check (char_length(usuario) between 5 and 20), 
	contraseña varchar  not null,
	nombre varchar not null,
	apellido varchar not null,
	cedula varchar(15) not null,
	numero_cel varchar(20) not null,
	correo varchar not null check (correo LIKE '%@%'),	
	primary key (usuario)
	);	
		
create table Cuenta_Bancaria(
	numero varchar not null,
	tipo varchar not null,
	banco varchar not null,
	primary key (numero, banco)
	);
	
create table Usuario_Cuenta_Bancaria(
	numero varchar not null,
	banco varchar not null,
	usuario varchar not null,
	primary key (numero,banco),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade,
	foreign key (numero, banco) references Cuenta_Bancaria
		on delete cascade		
		on update cascade	
	);
	
create table App_Usuario(
	usuario varchar not null,
	fecha_creacion timestamp not null,
	saldo varchar not null,
	primary key (usuario),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade
	);	

create table Restaurante ( 
	codigo varchar not null, 
	contraseña varchar not null,
	nombre varchar(20) not null,
	direccion varchar not null,
	tipo_comida varchar not null,
	descripcion varchar(600) not null,
	precios varchar not null,
	calificacion numeric not null check (calificacion between 0 and 5),
	primary key(codigo)
	);	
	
create table App_Restaurante(
	codigo_restaurante varchar not null,
	fecha_creacion timestamp not null,
	saldo varchar not null,
	primary key (codigo_restaurante),
	foreign key (codigo_restaurante) references Restaurante(codigo)
		on delete cascade
		on update cascade
	);
	
create table Reservar (
	usuario varchar not null,
	codigo_restaurante varchar not null,
	numero_personas varchar not null,
	fecha timestamp not null,
	primary key(usuario, codigo_restaurante, fecha),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade,
	foreign key (codigo_restaurante) references Restaurante(codigo)
		on delete cascade
		on update cascade
	);		
	
create table Calificar (
	usuario varchar not null,
	codigo_restaurante varchar not null,
	calificacion numeric not null check(calificacion between 0 and 5),
	sugerencia varchar(600),
	primary key (usuario, codigo_restaurante),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade,
	foreign key (codigo_restaurante) references Restaurante(codigo)
		on delete cascade
		on update cascade
	);
	
create table Pagar(
	usuario varchar not null,
	codigo_restaurante varchar not null,
	fecha timestamp not null,
	cantidad int not null,
	primary key (usuario, codigo_restaurante, fecha),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade,
	foreign key (codigo_restaurante) references Restaurante(codigo)
		on delete cascade
		on update cascade
	);
	
create table Recargar (
	usuario varchar not null,
	numero_cuenta varchar not null,
	banco_cuenta varchar not null,
	fecha timestamp not null,
	cantidad int not null,
	primary key (usuario, numero_cuenta, banco_cuenta, fecha),
	foreign key (usuario) references Usuario
		on delete cascade
		on update cascade,
	foreign key (numero_cuenta, banco_cuenta) references Cuenta_Bancaria(numero, banco)
		on delete cascade
		on update cascade
	);

create table Transferir(
	receptor varchar not null,
	emisor varchar not null,
	fecha timestamp not null,
	cantidad varchar not null,
	primary key(emisor, receptor, fecha),
	foreign key (emisor) references Usuario(usuario)
		on delete cascade
		on update cascade,
	foreign key (receptor) references Usuario(usuario)
		on delete cascade
		on update cascade
	);
	
	
create or replace function establecer_calificacion()
returns trigger as
$$
begin
	update Restaurante set calificacion = (select avg(calificacion) from Calificar where codigo_restaurante = new.codigo_restaurante) where codigo = new.codigo_restaurante;
	
return new;
end;
$$
language 'plpgsql';
	
	
create trigger calificacion1 after insert on Calificar for each row execute procedure establecer_calificacion();
create trigger calificacion2 after update on Calificar for each row execute procedure establecer_calificacion();
	








	
	

	
	
