ALTER TABLE product
    ADD COLUMN IF NOT EXISTS price DOUBLE PRECISION;

UPDATE product p
SET price = pi.price FROM   product_info pi
WHERE pi.id = p.id;

ALTER TABLE orders
    ADD COLUMN IF NOT EXISTS date_created DATE;

UPDATE orders o
SET date_created = od.date_created FROM   orders_date od
WHERE od.id = o.id;

ALTER TABLE order_product
    ADD COLUMN IF NOT EXISTS quantity INTEGER;

ALTER TABLE order_product
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders (id),
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id);

DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;
