SELECT f.title,
		COUNT(DISTINCT r.rental_id) 
from Rental r left join Inventory i on (r.inventory_id = i.inventory_id)
				left join Film f  on (i.film_id = f.film_id)
GROUP BY f.Title
order by COUNT(r.rental_id) desc
limit 2