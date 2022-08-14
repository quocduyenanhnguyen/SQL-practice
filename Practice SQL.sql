use Restaurant

select firstname, lastname, email, count(orderID)
from ordersnum
group by firstname, lastname, email
order by count(orderID) desc
limit 5;

select firstname, lastname, email, count(orders.orderID) as Nums from customers
join orders on orders.customerID = customers.customerID
group by customers.customerID
order by nums desc
limit 5;


use Library

select distinct b.bookID, b.title, b.published, l.loandate, l.duedate, l.returneddate from Books as b
join loans as l on l.bookID = b.bookID 
where b.title = 'Dracula' 

select * from books where title = 'Dracula'


select * from loans 
join books on books.bookID = loans.bookID 
where patronID = (select patronID from patrons where patronID = 50)

update loans set ReturnedDate = '2020-07-05' where bookid in (select bookid from books where barcode = '8730298424') 


select books.title, books.bookID, books.author, books.published, loans.returneddate from books
join loans on books.bookID = loans.bookID
where books.published > 1889 and books.published < 1900
and loans.returneddate <> '' --( equivalent to 'is not null')
group by books.bookID, books.title, loans.returneddate

select bookID, title from booksavailable where bookID <> 11 and bookID <> 154 group by bookID, title 

-- the first report 
select published, count(distinct title) from books group by published order by count(title) desc
select  distinct title from books where published = '1895'

-- the second report 
select distinct count(l.loanID), b.title from loans as l
join books as b on b.bookID = l.bookID
group by b.title order by count(l.loanID) desc limit 5

select count(bookID) from loans where bookID = 180

select * from books where title like 'Frank%'
