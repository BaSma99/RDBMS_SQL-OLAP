USE HSD_DSA
GO

CREATE TABLE TimeLine (
	TimeID 			    Int 			NOT NULL,
	DateText			Char(25)		NOT NULL,
	MonthNumber			int		        NOT NULL, 
	MonthText 		    Char(30)		NULL,
	QrtNumber 		    Numeric(4)		NULL, 
	QrtText 		    char(25)		NULL,
	Year_               int             NOT NULL,
	CONSTRAINT 	TimeIDPK 			   PRIMARY KEY(TimeID)

	);

CREATE TABLE Customer (
	CustomerID 			Int 			NOT NULL ,
	CustomerName 		Char(35) 		NOT NULL,
	Email 				Char(30)		NOT NULL,
	Phone 				int 		    NOT NULL,
	City 		        char(50)    	NULL ,
	State 			    Char(25) 	    NOT NULL,
	Zip                 char(25)        NULL,
	CONSTRAINT 	CustomerIDPK			PRIMARY KEY(CustomerID)
					
	);

CREATE TABLE ProductNumberTable (
	ProductNumber 		Char(25) 		NOT NULL,
	ProductType 		Char(50) 		NOT NULL,
	ProductName 		Char(100) 		NOT NULL,	
	CONSTRAINT 	ProductNumberPK			PRIMARY KEY(ProductNumber)

	);

CREATE TABLE ProductSales (
	TimeID		        Int 			NOT NULL,
	CustomerID	        int          	NOT NULL,
	ProductNumber 		char(25)		NOT NULL, 
	Quantity			int          	NOT NULL,
	UnitPrice			NUMERIC			   NOT NULL,
	CustomerPaid 	    NUMERIC             NOT	NULL, 

  CONSTRAINT 	 CustomerFK FOREIGN KEY(CustomerID)
						REFERENCES Customer(CustomerID)
							ON UPDATE NO ACTION
							ON DELETE CASCADE,
 CONSTRAINT 	 productFK FOREIGN KEY(ProductNumber)
						REFERENCES ProductNumberTable(ProductNumber)
							ON UPDATE NO ACTION
							ON DELETE CASCADE,
 CONSTRAINT 	 TimeFK FOREIGN KEY(TimeID)
						REFERENCES TimeLine(TimeID)
							ON UPDATE NO ACTION
							ON DELETE CASCADE
      
	);
	


INSERT INTO Customer VALUES (1, 'Jacobs, Nancy', 'somewhere.com', '817', 'Fort Worth', 'TX', '76110');
INSERT INTO Customer VALUES (2, 'Jacobs, Chantel', 'somewhere.com', '817', 'Fort Worth', 'TX', '76112');
INSERT INTO Customer VALUES (3, 'Able, Ralph', 'somewhere.com', '210', 'San Antonio', 'TX', '78214');
INSERT INTO Customer VALUES (4, 'Baker, Susan', 'elsewhere.com', '210', 'San Antonio', 'TX', '78216');
INSERT INTO Customer VALUES (5, 'Eagleton, Sam', 'elsewhere.com', '210', 'San Antonio', 'TX', '78218');
INSERT INTO Customer VALUES (6, 'Foxtrot, Kathy', 'somewhere.com', '972', 'Dallas', 'TX', '75220');
INSERT INTO Customer VALUES (7, 'George, Sally', 'somewhere.com', '972', 'Dallas', 'TX', '75223');
INSERT INTO Customer VALUES (8, 'Hullett, Shawn', 'elsewhere.com', '972', 'Dallas', 'TX', '75224');
INSERT INTO Customer VALUES (9, 'Pearson, Bobbi', 'elsewhere.com', '512', 'Austin', 'TX', '78710');
INSERT INTO Customer VALUES (10, 'Ranger, Terry', 'somewhere.com', '512', 'Austin', 'TX', '78712');
INSERT INTO Customer VALUES (11, 'Tyler, Jenny', 'somewhere.com', '972', 'Dallas', 'TX', '75225');
INSERT INTO Customer VALUES (12, 'Wayne, Joan', 'elsewhere.com', '817', 'Fort Worth', 'TX', '76115');


INSERT INTO ProductNumberTable VALUES ('BK001', 'Book', 'Kitchen Remodeling Basics For Everyone');
INSERT INTO ProductNumberTable VALUES ('BK002', 'Book', 'Advanced Kitchen Remodeling For Everyone');
INSERT INTO ProductNumberTable VALUES ('BK003', 'Book', 'Kitchen Remodeling Dallas Style For Everyone');
INSERT INTO ProductNumberTable VALUES ('VB001', 'Video Companion', 'Kitchen Remodeling Basics');
INSERT INTO ProductNumberTable VALUES ('VB002', 'Video Companion', 'Advanced Kitchen Remodeling I');
INSERT INTO ProductNumberTable VALUES ('VB003', 'Video Companion', 'Kitchen Remodeling Dallas Style');
INSERT INTO ProductNumberTable VALUES ('VK001', 'Video', 'Kitchen Remodeling Basics');
INSERT INTO ProductNumberTable VALUES ('VK002', 'Video', 'Advanced Kitchen Remodeling');
INSERT INTO ProductNumberTable VALUES ('VK003', 'Video', 'Kitchen Remodeling Dallas Style');
INSERT INTO ProductNumberTable VALUES ('VK004', 'Video', 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16');


INSERT INTO ProductSales VALUES (43023, 3, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43023, 3, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43033, 4, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43033, 4, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43033, 4, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43089, 7, 'VK004', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43184, 4, 'BK002', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43184, 4, 'VK002', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43184, 4, 'VK004', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43186, 6, 'BK002', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43186, 6, 'VB003', 1, 9.99, 9.99);
INSERT INTO ProductSales VALUES (43186, 6, 'VK002', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43186, 6, 'VK003', 1, 19.95, 19.95);
INSERT INTO ProductSales VALUES (43186, 6, 'VK004', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43186, 7, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43186, 7, 'BK002', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43186, 7, 'VK003', 1, 19.95, 19.95);
INSERT INTO ProductSales VALUES (43186, 7, 'VK004', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43190, 9, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43190, 9, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43190, 9, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43193, 11, 'VB003', 2, 9.99, 19.98);
INSERT INTO ProductSales VALUES (43193, 11, 'VK003', 2, 19.95, 39.90);
INSERT INTO ProductSales VALUES (43193, 11, 'VK004', 2, 24.95, 49.90);
INSERT INTO ProductSales VALUES (43198, 1, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43198, 1, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43198, 1, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43198, 5, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43198, 5, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43198, 5, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43213, 3, 'BK001', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43227, 9, 'VB002', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43227, 9, 'VK002', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43241, 8, 'VB003', 1, 9.99, 9.99);
INSERT INTO ProductSales VALUES (43241, 8, 'VK003', 1, 19.95, 19.95);
INSERT INTO ProductSales VALUES (43241, 8, 'VK004', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43256, 3, 'BK002', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43256, 3, 'VB001', 1, 7.99, 7.99);
INSERT INTO ProductSales VALUES (43256, 3, 'VB002', 2, 7.99, 15.98);
INSERT INTO ProductSales VALUES (43256, 3, 'VK001', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43256, 3, 'VK002', 2, 14.95, 29.90);
INSERT INTO ProductSales VALUES (43256, 11, 'VB002', 2, 7.99, 15.98);
INSERT INTO ProductSales VALUES (43256, 11, 'VK002', 2, 14.95, 29.90);
INSERT INTO ProductSales VALUES (43256, 12, 'BK002', 1, 24.95, 24.95);
INSERT INTO ProductSales VALUES (43256, 12, 'VB003', 1, 9.99, 9.99);
INSERT INTO ProductSales VALUES (43256, 12, 'VK002', 1, 14.95, 14.95);
INSERT INTO ProductSales VALUES (43256, 12, 'VK003', 1, 19.95, 19.95);
INSERT INTO ProductSales VALUES (43256, 12, 'VK004', 1, 24.95, 24.95);



INSERT INTO TimeLine VALUES (43023, '15-OCT-2017', 10, 'October', 3, 'Qtr3', 2017);
INSERT INTO TimeLine VALUES (43033, '25-OCT-2017', 10, 'October', 3, 'Qtr3', 2017);
INSERT INTO TimeLine VALUES (43089, '20-DEC-2017', 12, 'December', 3, 'Qtr3', 2017);
INSERT INTO TimeLine VALUES (43184, '25-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TimeLine VALUES (43186, '27-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TimeLine VALUES (43190, '31-MAR-2018', 3, 'March', 1, 'Qtr1', 2018);
INSERT INTO TimeLine VALUES (43193, '03-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TimeLine VALUES (43198, '08-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TimeLine VALUES (43213, '23-APR-2018', 4, 'April', 2, 'Qtr2', 2018);
INSERT INTO TimeLine VALUES (43227, '07-MAY-2018', 5, 'May', 2, 'Qtr2', 2018);
INSERT INTO TimeLine VALUES (43241, '21-MAY-2018', 5, 'May', 2, 'Qtr2', 2018);
INSERT INTO TimeLine VALUES (43256, '05-JUN-2018', 6, 'June', 2, 'Qtr2', 2018);

-- part 2: 2(a)
Select c.CustomerName ,c.CustomerID ,sum(p.Quantity) as Quantity  From Customer as c 
inner join ProductSales as p on c.CustomerID = p.CustomerID
where Quantity = 1

GROUP BY c.CustomerID,c.CustomerName

HAVING SUM(Quantity) >= 5 


-- part 2: 2(b)
Select c.CustomerName ,c.CustomerID ,sum(p.Quantity)as Quantity ,SUM(p.UnitPrice) as Total_paid  From Customer as c 
inner join ProductSales as p on c.CustomerID = p.CustomerID

GROUP BY c.CustomerID,c.CustomerName

ORDER BY Total_paid DESC


-- part 2: 2(c)
Select t.Year_,sum(p.CustomerPaid) as total_sales from TimeLine as t

inner join ProductSales as p on t.TimeID = p.TimeID

GROUP BY t.Year_


-- part 2: 3(a1)

/*
here the analyst want to aggregate by the total sales for each state to see what happed during this three month
*/
select t.MonthText  , c.City , AVG(p.CustomerPaid) as average_customer_paid,sum(p.CustomerPaid) as sum_customer_paid  from Customer as c
inner join ProductSales as p on c.CustomerID = p.CustomerID
inner join TimeLine as t on t.TimeID = p.TimeID
where t.MonthNumber between 4 and 6

group by  c.City ,t.MonthText
order by c.City

/*
as we can see from the next table that there is a decrese in sales in the Dallas city in may and june

*/


-- part 2: 3(a2)
/*
here the analyst want to aggregate by the total sales for each product to see what happed during this three month
*/
select n.ProductType,t.MonthText , AVG(p.CustomerPaid) as average_sales ,sum(p.CustomerPaid) as sum_of_sales from ProductSales as p
inner join ProductNumberTable as n on n.ProductNumber = p.ProductNumber
inner join TimeLine as t on t.TimeID = p.TimeID
where t.MonthNumber between 4 and 6
GROUP BY n.ProductType,t.MonthText
order by n.ProductType

/*
in the book product there is a decrease in sales from April to june
in the video product it achive a good sales in april , decrease in may and achive the best sales in june
in the video campanion product it achive a good sales in april , decrease in may and achive the best sales in june


-- part 2: 3(b)
/*
here in the nex query it will contain a detail report about total sales fro each state categorized
by the product type so we can see why dallas achive the high sales in april due to the video prouct
*/

Select c.City ,p.ProductType,t.MonthText,sum(s.CustomerPaid) as totalsales from Customer as c
inner join ProductSales s on c.CustomerID = s.CustomerID
inner join TimeLine t on s.TimeID = t.TimeID
inner join ProductNumberTable p on p.ProductNumber = s.ProductNumber
where t.MonthNumber between 4 and 6
group by c.City ,p.ProductType,t.MonthText
