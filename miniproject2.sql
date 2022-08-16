-- Creating 3 tables; one for insurance products/types, users/customers, and purchase history of insurance.
CREATE TABLE insurance_product (
	insurance_product_id INT PRIMARY KEY,
	insurance_type VARCHAR(50) NOT NULL,
	price NUMERIC;
);

CREATE TABLE users (
	user_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50),
	state CHAR(2) NOT NULL,
	email VARCHAR(225) NOT NULL,
	created_at TIMESTAMP,
	deleted_at TIMESTAMP
);

CREATE TABLE insurance_purchase (
	insurance_product_id INT REFERENCES insurance_product(insurance_product_id),
	created_at TIMESTAMP,
	deleted_at TIMESTAMP,
	customer_id INT REFERENCES users(user_id)
);

-- QUERIES!!!
-- People who bought insurance 
SELECT * FROM insurance_purchase ip
JOIN users us
ON ip.customer_id = us.user_id;

-- People who bought home insurance
SELECT * FROM insurance_purchase ip
JOIN users us
ON ip.customer_id = us.user_id
WHERE ip.insurance_product_id = 1;

-- People who bought boat insurance
SELECT * FROM insurance_purchase ip
JOIN users us
ON ip.customer_id = us.user_id
WHERE ip.insurance_product_id = 5;

-- People who bought more than one insurance product
SELECT us.name, COUNT(ip.insurance_product_id) FROM insurance_purchase ip
JOIN users us
ON ip.customer_id = us.user_id
GROUP BY us.name
HAVING COUNT(ip.insurance_product_id) > 1;

-- People who didn't buy insurance
SELECT us.name FROM insurance_purchase ip
RIGHT OUTER JOIN users us
ON ip.customer_id = us.user_id
WHERE insurance_product_id IS NULL;
