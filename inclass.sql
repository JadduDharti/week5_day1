-- Basic select all query to pull all records

SELECT * 
FROM actor;

-- SELECT * 
-- FROM address;

-- Query for first name and last name from actor table

SELECT first_name, last_name
FROM actor;

-- query that firstname is nick

SELECT first_name, last_name 
FROM actor
WHERE first_name = 'Nick';

-- Query for firstname = Nick using the LIKE and WHERE clauses

SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'John%';

-- % is the whildcard to get all records start with that **
SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'J%';

-- _ holds the place of possible letters
SELECT * 
FROM actor
WHERE first_name LIKE 'K__';

-- Quesry for all first name data that starts with K and ends with th

SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'K%th';


SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'J%__';

-- Comparing up of operator <, >, <=, >=, <>(not equal)

--query to select all data from payment table
SELECT * 
FROM payment;

-- query for data that show customer who pay amount > $2 for rental

SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for cuatomer who pay under 7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- less then equals
SELECT customer_id, amount
FROM payment
WHERE amount <= 5.99;

--grater equal
SELECT customer_id, amount
FROM payment
WHERE amount >= 7.99;

-- Query order ASC is ascending and DESC for descending

SELECT customer_id, amount
FROM payment
WHERE amount >= 2.99 
ORDER BY amount ASC;

--Query for all amount between 7.99 and 9.99

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 7.99 AND 9.99;

--Query for not equal

SELECT customer_id, amount
FROM payment
WHERE amount <> 5.99
ORDER BY amount DESC;

-- SQL aggregation SUM(), AVG(), COUNT(), MAX(), MIN()

SELECT SUM(amount)
FROM payment;

SELECT SUM(amount)
FROM payment
WHERE amount < 5.99;

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

SELECT COUNT(amount)
FROM payment
WHERE amount = 5.99;

SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--GROUP BY
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- How much each customer id has paid for rentals
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;


SELECT *
FROM customer;

SELECT COUNT(first_name), first_name
FROM customer
WHERE first_name LIKE 'J%'
GROUP BY first_name
HAVING COUNT(first_name) > 1;

