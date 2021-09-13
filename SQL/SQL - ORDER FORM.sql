
CREATE TABLE Quantity(
   QuantityId int,
   QuantityValue int,
   PRIMARY KEY (QuantityId)
);

INSERT INTO Quantity (QuantityId,QuantityValue)
VALUES (1,5 );

INSERT INTO Quantity (QuantityId,QuantityValue)
VALUES (2,1 );

CREATE TABLE Price(
   PriceId int,
   ItemName varchar(50),
   QuantityId int,
   UnitPrice int,
   PRIMARY KEY (PriceId),
   FOREIGN KEY (QuantityId) REFERENCES Quantity(QuantityId)
);

INSERT INTO Price (PriceId,ItemName,QuantityId,UnitPrice)
VALUES (1,'Shirt',1,1200);

INSERT INTO Price (PriceId,ItemName,QuantityId,UnitPrice)
VALUES (2,'Pant',1,1500);

INSERT INTO Price (PriceId,ItemName,QuantityId,UnitPrice)
VALUES (3,'Belt',2,800);

INSERT INTO Price (PriceId,ItemName,QuantityId,UnitPrice)
VALUES (4,'Shoes',2,800);

CREATE TABLE Item(
   ItemId int,
   PriceId int,
   QuantityId int,
   TotalPrice int,
   PRIMARY KEY (ItemId),
   FOREIGN KEY (PriceId) REFERENCES Price(PriceId),
   FOREIGN KEY (QuantityId) REFERENCES Quantity(QuantityId)
);

INSERT INTO Item (ItemId,PriceId,QuantityId,TotalPrice)
VALUES ( 1 ,1 , 1, 6000);

INSERT INTO Item (ItemId,PriceId,QuantityId,TotalPrice)
VALUES ( 2 ,2 , 1, 7500);

INSERT INTO Item (ItemId,PriceId,QuantityId,TotalPrice)
VALUES ( 3 ,3 , 2, 800);

INSERT INTO Item (ItemId,PriceId,QuantityId,TotalPrice)
VALUES ( 4 ,1 , 2,2500);

SELECT * FROM Quantity;
SELECT * FROM Price;
SELECT * FROM Item;


