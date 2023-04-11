-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT * 
FROM actor 
WHERE last_name = 'Wahlberg';

SELECT count(actor_id) 
FROM actor 
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
SELECT * 
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;

SELECT count(amount) 
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id) AS film_count
FROM inventory
GROUP BY film_id
HAVING COUNT(film_id) = (
	SELECT MAX(film_count)
	FROM (
		SELECT film_id, COUNT(film_id) AS film_count
		FROM inventory
		GROUP BY film_id
	) AS max_count
);

-- 4. How many customers have the last name ‘William’?
SELECT * 
FROM customer 
WHERE last_name = 'William';

SELECT count(customer_id) 
FROM customer 
WHERE last_name = 'William';

-- we don't have any with William with have with Williams
SELECT * 
FROM customer 
WHERE last_name = 'Williams';

SELECT count(customer_id) 
FROM customer 
WHERE last_name = 'Williams';

-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY staff_id
HAVING COUNT(rental_id) = (
	SELECT MAX(rental_count)
	FROM (
		SELECT staff_id, COUNT(rental_id) AS rental_count
		FROM rental
		GROUP BY staff_id
	) AS max_count
);
-- 6. How many different district names are there?

SELECT COUNT(DISTINCT first_name)
FROM customer;

SELECT DISTINCT first_name
FROM customer;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id) 
FROM film_actor
GROUP BY film_id
HAVING COUNT(actor_id) = (
	SELECT MAX(actor)
	FROM (
		SELECT film_id, COUNT(actor_id) AS actor
		FROM film_actor
		GROUP BY film_id
	) AS max_count
);


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id 
HAVING store_id = 1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount_count)
FROM (
	SELECT COUNT(amount) as amount_count
	FROM payment
	WHERE customer_id BETWEEN 380 AND 430
	GROUP BY amount
	HAVING COUNT(rental_id) > 250
) AS count_count;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT (SELECT COUNT(DISTINCT(rating)) FROM film), rating
FROM (
	SELECT rating
	FROM film
	GROUP BY rating
	HAVING COUNT(rating) = (
		SELECT MAX(rating_count)
		FROM (
			SELECT COUNT(rating) AS rating_count
			FROM film
			GROUP BY rating
		) AS max_count
	)
) AS most_rated;



