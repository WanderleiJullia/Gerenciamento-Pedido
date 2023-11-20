create table Clientes(
ClienteID int auto_increment primary key, 
NomeCliente varchar(255),
Email varchar(255),
Telefone varchar(100)
);

create table Pedidos(
PedidoID int auto_increment primary key, 
ClienteID int, 
Descricao varchar(400),
DataPedido date,
ValorPedido decimal(10,2),

foreign key (ClienteID) references Clientes(ClienteID)

);
