-- muestra los 5 aeropuertos con más vuelos
select  ad.airport_name, count(f.departure_airport) as fly_departure  from flights f 
join airports_data ad  
on  f.departure_airport = ad.airport_code
group by airport_name order by fly_departure desc limit 5;

-- muestra las 5 aeropuertos con mayor salida de vuelos realizados
select  ad.airport_name, count(f.departure_airport) as fly_departure  from flights f 
join airports_data ad  
on  f.departure_airport = ad.airport_code where f.status = 'Arrived'
group by airport_name order by fly_departure desc limit 5;


-- muestra las 5 aeropuertos con mayor vuelos cancelados realizados
select  ad.airport_name, count(f.departure_airport) as fly_departure  from flights f 
join airports_data ad  
on  f.departure_airport = ad.airport_code where f.status = 'Cancelled'
group by airport_name order by fly_departure desc limit 5;

-- muestra la cuidad con mas llegadas de vuelo a la cuidad
select  ad.city , count(f.arrival_airport) as fly_arrival from flights f 
join airports_data ad  
on  f.arrival_airport  = ad.airport_code
group by ad.city order by fly_arrival desc limit 5;

-- muestra los 5 aeropuertos con menos vuelos
select  ad.airport_name, count(f.departure_airport) as fly_departure  from flights f 
join airports_data ad  
on  f.departure_airport = ad.airport_code
group by airport_name order by fly_departure asc limit 5;

-- muestra la cuidad con menos vuelos
select  ad.city , count(f.arrival_airport) as fly_arrival from flights f 
join airports_data ad  
on  f.arrival_airport  = ad.airport_code
group by ad.city order by fly_arrival asc limit 5;

-- mostrar el promedio de valor del ticket por avion y monto acumulado
select ad.model , avg(tf.amount)::numeric(10,2) as promedio_valor_ticket , 
SUM(tf.amount)::numeric(100,2) as cantidad_acumulada
from aircrafts_data ad join flights f on ad.aircraft_code = f.aircraft_code
join ticket_flights tf on tf.flight_id = f.flight_id  
group by ad.model
order by promedio_valor_ticket desc;