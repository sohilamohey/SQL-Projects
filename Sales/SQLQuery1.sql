use Sales;
--------------------------------
select* from dbo.[Sales Data]
--------------------------------
alter table dbo.[Sales Data]
drop column column1
--------------------------------
select
sum( case when Product is null then 1 else 0 end) as "Product",
sum( case when Quantity_Ordered is null then 1 else 0 end) as "Quantity_Ordered",
sum( case when Price_Each is null then 1 else 0 end) as "Price_Each",
sum( case when Sales is null then 1 else 0 end) as "Sales",
sum( case when Order_Date is null then 1 else 0 end) as "Order_Date",
sum( case when City is null then 1 else 0 end) as "City"
 from dbo.[Sales Data]

--------------------------------
--------------------------------
--------------------------------

--------------------------------
--------------------------------