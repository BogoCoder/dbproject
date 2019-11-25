--createdb arrpi
--psql -d arrpi -f GomezLopez_tarea2_punto2.sql

-- insert into Usuario
insert into Usuario values('samuelperez.di', '12358', 'Samuel', 'Perez', '1007490336', '3225861027', 'samuelperez.di@gmail.com');
insert into Usuario values('nicolasdb10', '100900', 'Nicolas', 'Duque', '1000249103', '313565646', 'nicolasduque33@gmail.com');
insert into Usuario values('juanferna.perez', '1$315#$!', 'Juan', 'Perez', '5722123345', '3225161426', 'juanferna.perez@urosario.edu.co');

-- insert into Cuenta_Bancaria
insert into Cuenta_Bancaria values('1034678951', 'debito', 'bancolombia');
insert into Cuenta_Bancaria values('1467925831', 'debito', 'bancolombia');
insert into Cuenta_Bancaria values('1287469535', 'credito', 'colpatria');

-- insert into Usuario_Cuenta_Bancaria
insert into Usuario_Cuenta_Bancaria values('1034678951', 'bancolombia', 'samuelperez.di');
insert into Usuario_Cuenta_Bancaria values('1467925831', 'bancolombia', 'nicolasdb10');
insert into Usuario_Cuenta_Bancaria values('1287469535', 'colpatria', 'juanferna.perez');

-- insert into App_Usuario
insert into App_Usuario values('samuelperez.di', '2015-05-14', '0');
insert into App_Usuario values('nicolasdb10', '2018-07-10', '0');
insert into App_Usuario values('juanferna.perez', '2002-11-30', '15000000');

-- insert into Restaurante
insert into Restaurante values('001', '001#', 'Dados Pizza', 'Candelaria', 'Pizza', 'Pizza de distintos tamaños y sabores, junto con bebida', '15000', 4.6);
insert into Restaurante values('002', '002#', 'Crips or Wiffles', 'Cedritos', 'Crepes', 'Crepes de distintos tamaños y sabores, junto con bebida natural', '40000', 4.3);
insert into Restaurante values('003', '003#', 'CFK', 'Usaquen', 'Pollo', 'Pollo de distintos tamaños y sabores, junto con gaseosa', '25000', 4.7);

-- insert into App_Restaurante
insert into App_Restaurante values('001', '1991-03-11', '60000000');
insert into App_Restaurante values('002', '1995-05-10', '100000000');
insert into App_Restaurante values('003', '2005-12-25', '20000000');

-- insert into Reservar
insert into Reservar values('samuelperez.di', '001', '1', '2019-06-12');
insert into Reservar values('nicolasdb10', '002', '2', '2019-05-20');
insert into Reservar values('juanferna.perez', '003', '2', '2019-11-20');

-- insert into Calificar
insert into Calificar values('samuelperez.di', '001', 3.5, 'El timepo de espera es demasiado. Bajarle en grasa a la pizza de lechuga');
insert into Calificar values('nicolasdb10', '002', 4.1, 'El tamaño de la imagen en la app es engañoso');
insert into Calificar values('juanferna.perez', '003', 3.9, 'La bebida llega al clima. Muy pocos sobres de salsas');


-- insert into Pagar
insert into Pagar values('samuelperez.di', '001', '2019-05-12', '12000');
insert into Pagar values('nicolasdb10', '002', '2019-03-11', '5000');
insert into Pagar values('juanferna.perez', '003', '2019-06-21', '64500');

-- insert into Recargar
insert into Recargar values('samuelperez.di', '1034678951', 'bancolombia', '2019-10-12', 56000);
insert into Recargar values('nicolasdb10', '1467925831', 'bancolombia', '2019-10-09', 90000);
insert into Recargar values('juanferna.perez', '1287469535', 'colpatria', '2019-11-02', 150000);

-- insert into Transferir
insert into Transferir values('nicolasdb10', 'samuelperez.di', '2019-08-11', '1000');
insert into Transferir values('juanferna.perez', 'nicolasdb10', '2019-09-12', '500');
insert into Transferir values('samuelperez.di', 'juanferna.perez', '2019-09-20', '50000');

