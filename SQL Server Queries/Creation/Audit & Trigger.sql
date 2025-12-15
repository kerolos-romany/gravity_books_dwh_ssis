CREATE TABLE Audit_LatestOrder (
    FactBookOrderSK INT PRIMARY KEY,
    DateSK INT
);

INSERT INTO Audit_LatestOrder (FactBookOrderSK, DateSK)
SELECT TOP 1 [order_sk] , [date_sk]
FROM [dbo].[fact_order]
ORDER BY [order_sk] DESC;

select *
from Audit_LatestOrder;

CREATE TRIGGER trg_UpdateLatestOrder
ON [dbo].[fact_order]
AFTER INSERT
AS
BEGIN
    DECLARE @LatestOrderSK INT, @LatestDateSK int;

    SELECT TOP 1 
        @LatestOrderSK = [order_sk],
        @LatestDateSK = [date_sk]
    FROM [dbo].[fact_order]
    ORDER BY [order_sk] DESC;

    UPDATE Audit_LatestOrder
    SET 
        FactBookOrderSK = @LatestOrderSK,
        DateSK = @LatestDateSK;
END;