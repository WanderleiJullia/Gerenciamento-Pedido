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
