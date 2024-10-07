
-- Analyze the cumulative revenue generated over time. -- 

select order_date,
sum(revenue) over(order by order_daste) as cum_revenue
from
(select orders.order_date,
sum(order_details,quantity * pizzas.price) as revenue
from order_details join pizzas
on order_details.pizzas_id = pizzas.pizza_id
join orders
on order.order_id = order_details.order_id
group by orders.order_date) as sales;