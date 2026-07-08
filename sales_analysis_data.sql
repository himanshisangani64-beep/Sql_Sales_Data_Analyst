create database salaes_Database;

use salaes_Database;


-- 1) Show Data 
SELECT * FROM salaes_database.sales_data;

-- 2) Customer_Name and Product 
select  Customer_Name, Product from 
salaes_database.sales_data;

-- 3)All Laptop Order 
select Order_ID , Customer_Name,Product from
salaes_database.sales_data 
where Product="Laptop";

-- 4) find order from rajkot 

select Order_ID ,Order_Date ,Customer_Name ,City ,Product
from salaes_database.sales_data where City="Rajkot";

-- 5) count total order

select count(Order_ID) as Total_Order from salaes_database.sales_data;

-- 6) Count Unique Customer

select count(distinct(Customer_Name)) as Total_Unique_Customer from salaes_database.sales_data ;

-- 7) find maximum unit Price

select max(Unit_Price) as maximum_Unit_Price from salaes_database.sales_data;

-- 8) Minimum Unit Price

select min(Unit_Price) as minimum_Unit_Price from salaes_database.sales_data;

-- 9) average Unit Price

select avg(Unit_Price) as average_Unit_Price from salaes_database.sales_data;

-- 10) Total Quantity
select sum(Quantity) as Total_Quantity from salaes_database.sales_data;

-- 11)  Total Sales Amoung Each Order

select Order_ID, sum(Quantity*Unit_Price) as Each_Order_In_Total_Sales
from salaes_database.sales_data group by Order_ID;

-- 12) find Total Revenue

select sum(Quantity*Unit_Price) as Total_Revenue
from salaes_database.sales_data;

-- 13) Total Revenue By Category

select  Category , sum(Quantity*Unit_Price) as Total_Revenue
from salaes_database.sales_data group by Category;

-- 14) Total Revenue By City

select  City , sum(Quantity*Unit_Price) as Total_Revenue
from salaes_database.sales_data group by City;

-- 15) total quantity by product

select  Product , sum(Quantity) as Total_Quanty
from salaes_database.sales_data group by Product; 

-- 16) top 5 hightest value orders

select Order_ID, sum(Quantity*Unit_Price) as Each_Order_In_Total_Sales
from salaes_database.sales_data
group by Order_ID
order by sum(Quantity*Unit_Price) desc limit 5;

-- 17) coustomer who spent hight money
select Customer_Name , Unit_Price from salaes_database.sales_data order by Unit_Price desc limit 1;

-- 18) city hight revenu
select City , sum(Unit_Price*Quantity) as Total_Renenu
 from salaes_database.sales_data 
 group by City order by sum(Unit_Price*Quantity) desc limit 1;
 
 -- 19) category hight revenu
 select  Category , sum(Quantity*Unit_Price) as Total_Revenue
from salaes_database.sales_data group by Category 
order by Total_Revenue desc limit 1;

-- 20) aveg order values
select avg(Quantity*Unit_Price) as avrage_rvenue
from salaes_database.sales_data;

-- 21) rank costomer spen money
select Customer_Name , Unit_Price ,(
case 
 when Unit_Price between 51000 and 54000 then 1
 when Unit_Price between 7000 and 50000 then 2
 when Unit_Price between 500 and 4000 then 3
end
) as ranks from salaes_database.sales_data order by Unit_Price desc;

-- 22) Find Top 3 Customer Renenu
select Customer_ID , sum(Quantity*Unit_Price) as Total_Revenue
from salaes_database.sales_data group by Customer_ID order by sum(Quantity*Unit_Price) desc limit 3 ;

-- 23) runing total sales by date 

select  Order_Date ,sum(Quantity*Unit_Price )as Total_Revenue 
from salaes_database.sales_data group by Order_Date;

-- 24) find monthly revenu 
select month(Order_Date) as Month_No,sum(Quantity*Unit_Price )as Total_Revenue 
from salaes_database.sales_data group by month(Order_Date) ;

-- 25) persentage of each category

select Category,sum(Quantity*Unit_Price) * 100 / 
(select sum(Quantity*Unit_Price) from sales_data) as Persentage
 from salaes_database.sales_data group by Category;
 
 -- 26)  repeate Customer 
 
 select Customer_Name,count(*) as Repeate_Customer_More_Than_2
 from salaes_database.sales_data group by Customer_Name having count(*) > 2; 
 
 -- 28)  second hight number
 select Order_ID, Customer_Name , Unit_Price from salaes_database.sales_data order by Unit_Price desc limit 1 OFFSET 1  ;

 --  30) report slaes perfomance 
 WITH Sales_Report AS
(
    SELECT Customer_Name,
           SUM(Quantity * Unit_Price) AS Revenue
    FROM sales_data
    GROUP BY Customer_Name
)
SELECT *
FROM Sales_Report
ORDER BY Revenue DESC;
 
 




 









 


