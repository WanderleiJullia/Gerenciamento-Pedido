DELIMITER // 
create procedure InserirPedido(
in ClienteID int,
in Descricao varchar(400),
in DataPedido date,
in ValorPedido decimal(10,2)
)

begin 

insert into Pedido (ClienteID, Descricao, DataPedido, ValorPedido)
values (cliente_ID, descricao, datapedido, valorpedido);
END// 

DELIMITER ; 
