INSERT INTO users (username, email, password_hash, full_name)
VALUES ('ivanko_seller', 'ivan@auction.com', 'hash1', 'Ivan Seller'),
('olena_bidder', 'olena@auction.com', 'hash2', 'Olena Buyer'),
('petro_collector', 'petro@auction.com', 'hash3', 'Petro Collector'),
('anna_art', 'anna@auction.com', 'hash4', 'Anna ArtLover');

INSERT INTO categories (category_name, description)
VALUES ('Antiques', 'Items older than 50 years.'),
('Collectibles', 'Coins, stamps, cards, models.'),
('Art', 'Paintings, sculptures, installations.');

INSERT INTO lots (seller_id, category_id, title, description, start_price, current_price, start_time, end_time, status) 
VALUES
(
    1, 
    2, 
    'Silver Coin 1901', 
    'Rare coin in excellent condition.', 
    500.00, 
    750.00, 
    NOW() - INTERVAL '2 days', 
    NOW() + INTERVAL '5 days', 
    'Active'
),
(
    3, 
    1, 
    'Kyiv Clock 1950s', 
    'Wooden cased desk clock, needs repair.', 
    2000.00, 
    2000.00, 
    NOW(), 
    NOW() + INTERVAL '3 days', 
    'Active'
),
(
    4, 
    3, 
    'Painting "Sunrise"', 
    'Canvas, oil. Contemporary Ukrainian art.', 
    15000.00, 
    15000.00, 
    NOW() - INTERVAL '10 days', 
    NOW() - INTERVAL '1 day', -- lot expired
    'Expired'
);

INSERT INTO bids (lot_id, bidder_id, bid_amount, bid_time)
VALUES (1, 2, 600.00, NOW() - INTERVAL '1 day 10 hours'),
(1, 3, 750.00, NOW() - INTERVAL '1 day'),
(3, 2, 16000.00, NOW() - INTERVAL '9 days'),
(3, 4, 18000.00, NOW() - INTERVAL '8 days'); -- winning bid for lot 3

INSERT INTO transactions (lot_id, winner_id, final_price, transaction_date, payment_status) 
VALUES (
    3, 
    4, 
    18000.00, 
    NOW() - INTERVAL '20 hours', 
    'Pending'
);