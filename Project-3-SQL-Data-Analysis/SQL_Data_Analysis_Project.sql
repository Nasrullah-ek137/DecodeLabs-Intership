Create table Order_Details
(

OrderID varchar(40) not null,
Date date not null,
CustomerID varchar(30) not null,
Product varchar(30) not null,
Quantity int not null,
UnitPrice decimal(10,2),
ShippingAddress varchar(40),
PaymentMethod varchar(25),
OrderStatus varchar(30),
TrackingNumber varchar(25),
ItemsInCart int,
CouponCode varchar(25),
ReferralSource varchar(30),
TotalPrice decimal(10,2) default 0
)


--SECTION 1 — BASIC SELECT QUERIES

-- Q1. Display all records from the orders table.
select * from Order_Details;

-- Q2. Display only Product and TotalPrice columns.
select product,totalprice from Order_Details;

-- Q3. Show CustomerID and PaymentMethod.
select customerid,paymentmethod from Order_Details;

-- Q4. Display all unique products.
select distinct product from Order_Details;

-- Q5. Display all unique payment methods.
select distinct paymentmethod from Order_Details;


-- SECTION 2 — WHERE CLAUSE

-- Q6. Find orders where TotalPrice is greater than 1000.
select * from Order_Details
where totalprice > 1000;

-- Q7. Show orders where Quantity is greater than or equal to 3.
select * from Order_Details
where quantity >= 3;

-- Q8. Display all delivered orders.
select * from Order_Details
where orderstatus = 'Delivered';

-- Q9. Find orders paid using UPI.
select * from Order_Details
where paymentmethod = 'UPI';

-- Q10. Show orders having more than 2 items in cart.
select * from Order_Details
where itemsincart > 2;


-- SECTION 3 — ORDER BY

-- Q11. Display orders sorted by TotalPrice in descending order.
select * from Order_Details
order by totalprice desc;

-- Q12. Display orders sorted by Quantity in ascending order.
select * from Order_Details
order by quantity asc;

-- Q13. Show Product and TotalPrice sorted by highest price.
select product,totalprice from Order_Details
order by totalprice desc;

-- Q14. Sort customer orders by Date.
select * from Order_Details
order by date;

-- Q15. Display orders sorted by ItemsInCart.
select * from Order_Details
order by itemsincart desc;


-- SECTION 4 — AGGREGATE FUNCTIONS

-- Q16. Count total number of orders.
select count(orderid) from Order_Details;

-- Q17. Calculate total revenue.
select sum(totalprice) as Revenue from Order_Details;

-- Q18. Find average order value.
select avg(totalprice) as AvgValue from Order_Details;

-- Q19. Find highest order value.
select max(totalprice) as Highest_Value from Order_Details;

-- Q20. Find minimum order value.
select min(totalprice) as Minimum_Value from Order_Details;


-- SECTION 5 — GROUP BY

-- Q21. Count total orders for each product.
select product,count(orderid) from Order_Details
group by product;

-- Q22. Count usage of each payment method.
select paymentmethod,count(*) from Order_Details
group by paymentmethod;

-- Q23. Count orders based on order status.
select OrderStatus, count(*) as StatusCount from orders
group by OrderStatus;

-- Q24. Find average revenue by referral source.
select referralsource,avg(totalprice) as Avg_Rev from Order_Details
group by referralsource;

-- Q25. Find total quantity sold for each product.
select product,sum(quantity) as Total_quantity from Order_Details
group by product;


-- SECTION 6 — HAVING CLAUSE

-- Q26. Display products having revenue greater than 5000.
select product,sum(totalprice) as Revenue from Order_Details
group by product
having Revenue > 5000;

-- Q27. Show payment methods used more than 50 times.
select paymentmethod,count(*) from Order_Details
group by paymentmethod
having count(*) > 50;

-- Q28. Display referral sources with average sales greater than 1000.
select referralsource,avg(totalprice) from Order_Details
group by referralsource
having avg(totalprice) > 1000;

-- Q29. Show products having average quantity greater than or equal to 2.
select product,avg(quantity) from Order_Details
group by product
having avg(quantity) >= 2;

-- Q30. Display order statuses having more than 20 orders.
select orderstatus,count(*) from Order_Details
group by orderstatus
having count(*) > 20;


-- SECTION 7 — LIKE OPERATOR

-- Q31. Find coupon codes starting with SAVE.
select * from Order_Details
where couponcode like '%SAVE%';

-- Q32. Find products containing the word Phone.
select * from Order_Details
where product like '%Phone';

-- Q33. Find referral sources containing Instagram.
select * from Order_Details
where referralsource like '%Instagram';

-- Q34. Find payment methods containing Card.
select * from Order_Details
where paymentmethod like '%Card%';

-- Q35. Find shipping addresses containing Mumbai.
select * from Order_Details
where shippingaddress like '%Mumbai%';


-- SECTION 8 — BETWEEN OPERATOR

-- Q36. Find orders with TotalPrice between 1000 and 5000.
select * from Order_Details
where totalprice between 1000 and 5000;

-- Q37. Find orders where Quantity is between 2 and 5.
select * from Order_Details
where quantity between 2 and 5;

-- Q38. Find orders where ItemsInCart is between 1 and 3.
select * from Order_Details
where itemsincart between 1 and 3;

-- Q39. Display orders placed in the year 2025.
select * from Order_Details
where date between '2025-01-01' and '2025-12-31';

-- Q40. Find products with UnitPrice between 500 and 2000.
select * from Order_Details
where unitprice between 500 and 2000;


-- SECTION 9 — ADVANCED QUERIES

-- Q41. Find revenue generated by each product.
select product,sum(totalprice) as Revenue from Order_Details
group by product
order by Revenue desc;

-- Q42. Calculate total sales by payment method.
select paymentmethod,sum(totalprice) as Total_Sales from Order_Details
group by paymentmethod
order by Total_Sales desc;

-- Q43. Count customers from each referral source.
select referralsource,count(*) as Count_Cust from Order_Details
group by referralsource
order by Count_Cust desc;

-- Q44. Find average unit price of each product.
select product,avg(unitprice) as Avgup from Order_Details
group by product
order by Avgup desc;

-- Q45. Calculate revenue generated by each order status.
select orderstatus,sum(totalprice) as Revenue from Order_Details
group by orderstatus
order by Revenue desc;


-- SECTION 10 — PROFESSIONAL LEVEL QUERIES

-- Q46. Count unique customers.
select count(distinct customerid) from Order_Details;

-- Q47. Find maximum sale value for each product.
select product,max(totalprice) from Order_Details
group by product;

-- Q48. Find minimum sale value for each product.
select product,min(totalprice) from Order_Details
group by product;

-- Q49. Find average transaction amount for each payment method.
select paymentmethod,avg(totalprice) from Order_Details
group by paymentmethod;

-- Q50. Find total quantity sold through each referral source.
select referralsource,sum(quantity) as Total_quantity from Order_Details
group by referralsource
order by Total_quantity desc;












