CREATE TABLE CATEGORIES(
	category_id IDENTITY,
	category_name VARCHAR(50) NOT NULL,
	category_description VARCHAR(255) NOT NULL
);

--PRODUCTS TABLE

CREATE TABLE PRODUCTS
(
	product_id IDENTITY,
	product_name VARCHAR(50) NOT NULL,
	product_description VARCHAR(1000) NOT NULL,
	product_price DECIMAL(8,2) NOT NULL,
	product_quantity Number(5) NOT NULL,
	category_id BIGINT(10) NOT NULL,
	CONSTRAINT fk_product_category_id FOREIGN KEY(category_id)
	REFERENCES CATEGORIES(category_id)
);

--USERS

CREATE TABLE USERS(
	user_id IDENTITY,
	user_email VARCHAR(100) NOT NULL UNIQUE,
	user_password VARCHAR(100) NOT NULL,
	user_first_name VARCHAR(100) NOT NULL,
	user_last_name VARCHAR(100) NOT NULL,
	user_gender VARCHAR(10) NOT NULL,
	user_mobile_number VARCHAR(15) NOT NULL UNIQUE,
	user_enabled BOOLEAN DEFAULT 'TRUE',
	USER_ROLE VARCHAR(20) DEFAULT 'USER',
	CART_ID INT(10) NOT NULL,
	CONSTRAINT fk_user_cart_id FOREIGN KEY(CART_ID)
	REFERENCES CART(CART_ID)
);

--Addresses
CREATE TABLE ADDRESSES(
	addr_id IDENTITY,
	user_id int(10) NOT NULL,
	addr_first_name VARCHAR(50) NOT NULL,
	addr_last_name VARCHAR(50) NOT NULL,
	addr_line_one VARCHAR(500) NOT NULL,
	addr_line_two VARCHAR(500) NOT NULL,
	addr_landmark VARCHAR(500) NOT NULL,
	addr_city VARCHAR(50) NOT NULL,
	addr_state VARCHAR(50) NOT NULL,
	addr_country VARCHAR(50) NOT NULL,
	addr_pincode Number(10) NOT NULL,
	addr_mobile_number Number(15) NOT NULL,
	addr_default boolean NOT NULL,
	CONSTRAINT fk_addr_user_id FOREIGN KEY (user_id)
	REFERENCES USERS(user_id)
);



--ORDERS
CREATE TABLE ORDERS(
	order_id IDENTITY,
	user_id int(10) NOT NULL,
	CONSTRAINT fk_orders_user_id FOREIGN KEY(user_id)
	REFERENCES USERS(user_id)
);

--ORDERED_ITEMS

CREATE TABLE ORDERED_ITEMS(
	o_id IDENTITY,
	order_id int(10) NOT NULL,
	product_id int(10) NOT NULL,
	o_price DECIMAL(8,2) NOT NULL,
	o_quantity int(10) NOT NULL,
	o_total DECIMAL(8,2) NOT NULL,
	CONSTRAINT fk_o_order_id FOREIGN KEY (order_id)
	REFERENCES ORDERS(order_id),
	CONSTRAINT fk_o_product_id FOREIGN KEY (product_id)
	REFERENCES PRODUCTS(product_id)
);

--Seller

CREATE TABLE Seller(
	
	id IDENTITY,
	name VARCHAR(50) NOT NULL,
	seller_name VARCHAR(50) NOT NULL,
	seller_line_one VARCHAR(50) NOT NULL,
	seller_line_two VARCHAR(50) NOT NULL,
	seller_city VARCHAR(50) NOT NULL,
	seller_state VARCHAR(50) NOT NULL,
	seller_country VARCHAR(50) NOT NULL,
	mobile BIGINT(15) NOT NULL

);

--Cart

CREATE TABLE CART(
	CART_ID IDENTITY,
	GRAND_TOTAL INT(10) NOT NULL,
	NO_OF_CART_ITEMS INT(10) NOT NULL,
	USER_ID INT(10) NOT NULL,
	CONSTRAINT fk_cart_user_id FOREIGN KEY(USER_ID)
	REFERENCES USERS(USER_ID)
);

--CART ITEMS

CREATE TABLE CART_ITEMS(
	item_id IDENTITY,
	cart_id int(10) NOT NULL,
	product_id int(10) NOT NULL,
	item_price DECIMAL(8,2) NOT NULL,
	item_quantity int(10) NOT NULL,
	item_total DECIMAL(8,2) NOT NULL,
	CONSTRAINT fk_item_cart_id FOREIGN KEY(cart_id)
	REFERENCES CART(cart_id),
	CONSTRAINT fk_item_product_id FOREIGN KEY(product_id)
	REFERENCES PRODUCTS(product_id)
);


