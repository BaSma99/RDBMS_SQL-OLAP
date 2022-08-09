-- part 1 : (a)
-- Identify the transaction with null value
SELECT * FROM TRANS as t 
WHERE t.DateSold is null
-- return all record from the table without null value
SELECT * FROM TRANS as t 
WHERE t.DateSold is not null

-- part 1 : (b)
USE VRG

SELECT WorKID ,Title,Medium ,w.ArtistID,CONCAT (a.FirstName,' ' ,a.LastName) as FullName from WORK as w
INNER JOIN ARTIST as a on a.ArtistID = w.ArtistID
WHERE 
    (w.Title like '%Yellow%' or w.Title like '%Blue%' or w.Title like '%White%')
    
    
-- part 1 : (c)
Select AVG(t.SalesPrice)as AverageOfSubTotal , SUM(t.SalesPrice) as SumOfSubTotal, DATEPART(YEAR , t.DateSold) as year_, c.ArtistID  
from TRANS as t 
Inner join CUSTOMER_ARTIST_INT as c on c.CustomerID = t.CustomerID
group by ArtistID ,  DATEPART(YEAR , t.DateSold) 


-- part 1 : (d)
SELECT w.ArtistID , a.FirstName, a.LastName ,t.WorkID, w.Title from WORK as w
inner join TRANS as t on  t.WorkID = w.WorkID 
inner join CUSTOMER as a on a.CustomerID = t.CustomerID

WHERE t.SalesPrice > (SELECT AVG(t.SalesPrice) FROM TRANS as t)


-- part 1 : (e)
UPDATE CUSTOMER 
set EmailAddress = 'Johnson.lynda@somewhere.com' ,EncryptedPassword = 'aax1xbB'
WHERE LastName='Johnson' and FirstName='Lynda'

SELECT * FROM CUSTOMER

-- part 1 : (f)
select *,DATEDIFF(day,m.DateSold,m.nextpurchase) as differanceday from(

Select c.*,t.DateSold ,lead(t.DateSold,1,Null) over (PARTITION BY c.CustomerID ORDER BY t.DateSold) as nextpurchase 
from CUSTOMER AS c
inner join TRANS as t on c.CustomerID = t.CustomerID) m

where m.nextpurchase is not Null


-- part 1 : (g)
CREATE VIEW CustomerTransactionSummary AS

SELECT top 100 CONCAT(c.FirstName ,' ' ,c.LastName) as FullName, w.Title ,t.DateAcquired , t.DateSold ,(t.SalesPrice - t.AcquisitionPrice) as profit
from CUSTOMER as c

inner join TRANS as t on t.CustomerID = c.CustomerID
inner join WORK as w on w.WorkID = t.WorkID
where t.AskingPrice > 20000

order by AskingPrice Desc 

Select * from CustomerTransactionSummary


-- part 1 : (h)
with purchase(CustomerID,mindate,maxdate)as(
select t.CustomerID , min(t.DateAcquired) as mindate ,max(t.DateAcquired) as maxdate from TRANS as t 
group by t.CustomerID

)

SELECT t.TransactionID ,t.DateAcquired , t.CustomerID , c.FirstName ,c.LastName ,p.maxdate,p.mindate,w.Medium,
CASE
    WHEN w.Medium ='High Quality Limited Print' THEN 1
	WHEN w.Medium ='Color aquatint' THEN 2
    WHEN w.Medium = 'WaterColor and Ink' THEN 3
    WHEN w.Medium = 'Oil and Collage' THEN 4
    ELSE 5
END as Medium_encode
--INTO #Purchase
From TRANS as t

inner join CUSTOMER as c on c.CustomerID = t.CustomerID
inner join WORK as w on t.WorkID = w.WorkID
inner join purchase p on p.CustomerID = c.CustomerID

Where t.DateAcquired between '2015-01-01' AND '2017-12-31'

