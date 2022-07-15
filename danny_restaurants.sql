/*What is the total amount each customer spent at the retaurant*/
SELECT DISTINCT customer_id AS customer,SUM(price) AS amount
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY 1

/*How many days has each customer visited the restaurant*/
SELECT DISTINCT customer_id AS customer, COUNT(DISTINCT(order_date)) AS days
FROM sales
GROUP BY 1

/*What was the first item from the menu purchased by each customer*/
SELECT DISTINCT customer_id AS customer, MIN(order_date) AS order_date,MIN(product_name) AS product
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY 1

/*What is the most purchased item on the menu and how many times was it purchased by all customers*/
SELECT MAX(product_name) AS product, COUNT(DISTINCT(order_date)) AS purchased_times
FROM sales
JOIN menu
ON sales.product_id = menu.product_id

/*Which item was the most popular for each customer*/
SELECT customer_id AS customer, MAX(product_name) AS pop_item
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY 1

/*Which item was purchased first by the customer after they became a member*/
SELECT DISTINCT members.customer_id AS customer, product_name AS product, order_date AS Date
FROM members
JOIN sales
ON sales.customer_id = members.customer_id
JOIN menu
ON sales.product_id = menu.product_id
WHERE order_date='2021-01-07' OR order_date='2021-01-11' AND members.customer_id IN('B')
GROUP BY 1,2,3

/*Which item was purchased just before the customer became a member*/
SELECT DISTINCT members.customer_id AS customer, product_name AS product, order_date AS Date
FROM members
JOIN sales
ON sales.customer_id = members.customer_id
JOIN menu
ON sales.product_id = menu.product_id
WHERE order_date='2021-01-01' AND members.customer_id IN('A') OR order_date='2021-01-04'
GROUP BY 1,2,3

/*What is the total items and amount spent for each member before they became a member*/
SELECT members.customer_id,COUNT(DISTINCT(product_name)),SUM(price)
FROM members
JOIN sales
ON sales.customer_id = members.customer_id
JOIN menu
ON sales.product_id = menu.product_id
WHERE join_date > order_date
GROUP BY 1


