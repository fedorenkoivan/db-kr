INSERT INTO categories (category_name, description)
VALUES ('Jewelry', 'Fine and costume jewelry, rings, necklaces.');

INSERT INTO lots (seller_id, category_id, title, description, start_price, current_price, start_time, end_time, status) 
VALUES
(
    2, 
    4, 
    'Gold Necklace', 
    '18k gold necklace with diamond pendant.', 
    1200.00, 
    1500.00, 
    NOW() - INTERVAL '1 days', 
    NOW() + INTERVAL '6 days', 
    'Active'
);

UPDATE lots
SET current_price = 800.00
WHERE lot_id = 1 AND current_price < 800.00;

UPDATE transactions
SET payment_status = 'Paid', transaction_date = NOW()
WHERE transaction_id = 1 AND payment_status = 'Pending';

DELETE FROM users
WHERE user_id = 5;

DELETE FROM categories
WHERE category_name = 'Gaming';


SELECT
    l.title,
    l.current_price,
    l.end_time
FROM
    lots l
JOIN
    categories c ON l.category_id = c.category_id
WHERE
    l.status = 'Active'
    AND c.category_name = 'Collectibles'
ORDER BY
    l.end_time ASC;

SELECT
    b.lot_id,
    u.full_name AS bidder_name,
    b.bid_amount,
    b.bid_time
FROM
    bids b
JOIN
    users u ON b.bidder_id = u.user_id
WHERE
    b.lot_id = 1
ORDER BY
    b.bid_amount DESC,
    b.bid_time ASC;