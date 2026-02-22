INSERT INTO product (id, name, picture_url, price)
VALUES (1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
       (2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
       (3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
       (4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg',
        315.00),
       (5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00),
       (6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

INSERT INTO orders (id, status, date_created)
SELECT
    gs,
    (ARRAY['pending', 'shipped', 'cancelled'])[1 + (random() * 2)::int],
    NOW() - (random() * 30)::int * INTERVAL '1 day'
FROM generate_series(1, 1000000) AS gs;

INSERT INTO order_product (order_id, product_id, quantity)
SELECT
    (random() * 999999 + 1)::bigint,
    (random() * 4 + 1)::bigint,
    (random() * 10 + 1)::int
FROM generate_series(1, 2000000);

ANALYZE product;
ANALYZE orders;
ANALYZE order_product;