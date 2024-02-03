use sakila;

-- 1.a
Select title , first_name, last_name from film INNER JOIN (film_actor INNER JOIN actor on film_actor.actor_id = actor.actor_id) on film.film_id = film_actor.film_id order by title;

-- 1.b
Select customer.customer_id, sum(amount) from customer INNER JOIN payment ON customer.customer_id = payment.customer_id GROUP BY customer_id;

-- 1.c
Select title from rental inner join (inventory Inner join film on inventory.film_id = film.film_id) on inventory.inventory_id=rental.inventory_id where rental_date NOT IN (2005-01) group by title;

-- 1.d 
Select store.store_id, sum(amount) from (staff INNER JOIN payment on staff.staff_id = payment.staff_id) INNER JOIN store on store.store_id = staff.store_id group by store_id;

-- 1.e
Select customer.customer_id from customer INNER JOIN rental on customer.customer_id = rental.customer_id where date_sub(rental_date , INTERVAL 30 day)<0 group by customer.customer_id;