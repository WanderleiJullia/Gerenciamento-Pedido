# Gerenciamento-Pedido
O objetivo da atividade é realizar  um sistema de gerenciamento de pedidos em um banco de dados utilizando stored procedures, triggers, views e JOINs no MySQL Workbench. Abaixo, possui todas as etapas das atividades solicitadas. 
![image](https://github.com/WanderleiJullia/Gerenciamento-Pedido/assets/144744092/0081ea28-a81d-4fb3-a447-0eb282d5ab8b)

# 1º Criação de tabelas, incluindo a inserção de dados. 
``` SQL
create table Clientes(
ClienteID int auto_increment primary key, 
NomeCliente varchar(255),
Email varchar(255),
Telefone varchar(100),
Pedido_Total double(10,9)
);

create table Pedidos(
PedidoID int auto_increment primary key, 
ClienteID int, 
Descricao varchar(400),
DataPedido date,
ValorPedido decimal(10,2),

foreign key (ClienteID) references Clientes(ClienteID)
);
```
![image](https://github.com/WanderleiJullia/Gerenciamento-Pedido/assets/144744092/146e0f25-ad9f-456b-bc01-21455e1bb45e)
![image](https://github.com/WanderleiJullia/Gerenciamento-Pedido/assets/144744092/fabf5cc8-883d-4795-8723-99a4ad16b33e)

# 2º Criação de Stored Procedure. 
Inserindo um novo peddido com as mesmas descrições. 
``` SQL
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
 ```
# 3º Trigger.
Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos". A trigger deve calcular o valor total dos pedidos para o cliente correspondente e atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.
```SQL
CREATE TRIGGER CalculaTotalPedidos
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Clientes
    SET TotalPedidos = (
        SELECT COALESCE(SUM(ValorPedido), 0)
        FROM Pedidos
        WHERE ClienteID = NEW.ClienteID
    )
    WHERE ClienteID = NEW.ClienteID;
END;
```

# 4º View 
Crie uma visualização chamada "PedidosClientes" que combina informações das tabelas "Clientes" e "Pedidos" usando JOIN para exibir os detalhes dos pedidos e os nomes dos clientes.
``` SQL
CREATE VIEW PedidosClientes AS
SELECT Pedidos.*, Clientes.Nome AS NomeCliente
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;
```
![image](https://github.com/WanderleiJullia/Gerenciamento-Pedido/assets/144744092/89f2bbcb-2024-430d-868f-f55085998103)

# 5º Consulta Join; 
Escreva uma consulta SQL que utiliza JOIN para listar os detalhes dos pedidos de cada cliente, incluindo o nome do cliente e o valor total de seus pedidos. Utilize a view "PedidosClientes" para essa consulta.
``` SQL
select 
     pc.NomeCliente,
     p.PedidoID,
     p.Descricao,
     p.DataPedido,
     c.ValorPedido
join 

	Pedidos p on pc.PedidoID = p.PedidoID
    
join 
   
   Clientes c on pc.ClienteID = c.ClienteID;
```
![image](https://github.com/WanderleiJullia/Gerenciamento-Pedido/assets/144744092/24c97b4a-f54a-45d8-87c5-767153dbc1ec)

Jullia Santos Wanderlei
Bancos de Dados 
Composição da AF




