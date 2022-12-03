SELECT a2.first_name || " " || a2.last_name
from Actor a2 left join FilmActor fa2 on (fa2.actor_id = a2.actor_id)
				left join Film f2 on (f2.film_id = fa2.film_id)
where f2.title in
(select f.title
from Rental r left join Inventory i on (r.inventory_id = i.inventory_id)
				LEFT join Film f  on (i.film_id = f.film_id)
				left join FilmActor fa on (fa.film_id = f.film_id)
				left join Actor a on (a.actor_id = fa.actor_id)
GROUP by f.title
ORDER by count(DISTINCT r.rental_id) DESC 
limit 16)
group by a2.first_name || " " || a2.last_name 
order by count(a2.first_name || " " || a2.last_name) desc
limit 1