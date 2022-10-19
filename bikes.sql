CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    model_code VARCHAR(5) PRIMARY KEY,
    model_name VARCHAR(25) NOT NULL UNIQUE,
    base_price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers,
    order_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    model_code VARCHAR(5) NOT NULL REFERENCES models,
    item_cost NUMERIC(10, 2) NOT NULL,
    note TEXT NOT NULL DEFAULT ''
);
