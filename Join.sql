SELECT 
    pc.NomeCliente,
    p.PedidoID,
    p.Descricao,
    p.DataPedido,
    c.ValorPedido
FROM 
    PedidosClientes pc
JOIN 
    Pedidos p ON pc.PedidoID = p.PedidoID
JOIN 
    Clientes c ON pc.ClienteID = c.ClienteID;

