with t as (
SELECT customer_id,
substring(MIN(rental_date),6,2 ) as month_
FROM Rental r 
group by customer_id )
SELECT month_,
COUNT( customer_id) 
from t
group by month_