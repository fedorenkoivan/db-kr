INSERT INTO users (username, email, password_hash, full_name)
VALUES ('ivanko_seller', 'ivan@auction.com', 'hash1', 'Ivan Seller'),
('olena_bidder', 'olena@auction.com', 'hash2', 'Olena Buyer'),
('petro_collector', 'petro@auction.com', 'hash3', 'Petro Collector'),
('anna_art', 'anna@auction.com', 'hash4', 'Anna ArtLover'),
('ivanko__evil_seller', 'ivan.evil@auction.com', 'hash21', 'Ivan Evil Seller'),
('denys_deals', 'denys@auction.com', 'hash5', 'Denys Dealer'),
('mykola_tech', 'mykola@auction.com', 'hash6', 'Mykola Techie'),
('sofia_vintage', 'sofia@auction.com', 'hash7', 'Sofia Vintage'),
('viktor_books', 'viktor@auction.com', 'hash8', 'Viktor Books'),
('zoya_cards', 'zoya@auction.com', 'hash9', 'Zoya Cards');

INSERT INTO categories (category_name, description)
VALUES ('Antiques', 'Items older than 50 years.'),
('Collectibles', 'Coins, stamps, cards, models.'),
('Art', 'Paintings, sculptures, installations.'),
('Gaming', 'Items for gamers.'),
('Working Electronics', 'Gadgets and devices in working condition.');

INSERT INTO lots (seller_id, category_id, title, description, start_price, current_price, start_time, end_time, status)
VALUES
(
    1, 2, 'Silver Coin 1901', 'Rare coin in excellent condition.', 500.00, 750.00, NOW() - INTERVAL '2 days', NOW() + INTERVAL '5 days', 'Active'
),
(
    3, 1, 'Kyiv Clock 1950s', 'Wooden cased desk clock, needs repair.', 2000.00, 2000.00, NOW(), NOW() + INTERVAL '3 days', 'Active'
),
(
    4, 3, 'Painting "Sunrise"', 'Canvas, oil. Contemporary Ukrainian art.', 15000.00, 15000.00, NOW() - INTERVAL '10 days', NOW() - INTERVAL '1 day', 'Expired'
),
(
    5, 4, 'Rare PS5 Controller', 'Limited edition controller, mint condition.', 150.00, 210.00, NOW() - INTERVAL '1 day', NOW() + INTERVAL '1 day', 'Active'
),
(
    1, 3, 'Abstract Sculpture', 'Bronze, modern style.', 5000.00, 5000.00, NOW(), NOW() + INTERVAL '14 days', 'Active'
),
(
    6, 2, 'Vintage Stamp Set', 'Rare stamps.', 100.00, 100.00, NOW() - INTERVAL '3 days', NOW() + INTERVAL '2 days', 'Active'
),
(
    7, 1, 'Antique Dresser', '18th Century oak dresser.', 8000.00, 10500.00, NOW() - INTERVAL '30 days', NOW() - INTERVAL '25 days', 'Sold'
),
(
    8, 2, 'First Edition Novel', 'Signed by author, 1965.', 1200.00, 1550.00, NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 hour', 'Sold'
),
(
    9, 4, 'Collector Card Set', 'Complete set of rare trading cards.', 300.00, 620.00, NOW() - INTERVAL '4 days', NOW() - INTERVAL '1 day', 'Sold'
),
(
    10, 1, 'Broken Porcelain', 'Very good condition.', 50.00, 50.00, NOW() - INTERVAL '14 days', NOW() - INTERVAL '7 days', 'Expired'
);

INSERT INTO bids (lot_id, bidder_id, bid_amount, bid_time)
VALUES (1, 2, 600.00, NOW() - INTERVAL '1 day 10 hours'),
(1, 3, 750.00, NOW() - INTERVAL '1 day'),
(3, 2, 16000.00, NOW() - INTERVAL '9 days'),
(3, 4, 18000.00, NOW() - INTERVAL '8 days'),
(4, 7, 180.00, NOW() - INTERVAL '18 hours'),
(4, 5, 200.00, NOW() - INTERVAL '10 hours'),
(4, 8, 210.00, NOW() - INTERVAL '5 hours'),
(7, 2, 9000.00, NOW() - INTERVAL '28 days'),
(7, 3, 10000.00, NOW() - INTERVAL '27 days'),
(7, 7, 10500.00, NOW() - INTERVAL '26 days'),
(8, 9, 1300.00, NOW() - INTERVAL '4 days'),
(8, 10, 1550.00, NOW() - INTERVAL '3 hours'),
(9, 6, 400.00, NOW() - INTERVAL '3 days'),
(9, 5, 500.00, NOW() - INTERVAL '2 days'),
(9, 7, 620.00, NOW() - INTERVAL '1 day 2 hours');

INSERT INTO transactions (lot_id, winner_id, final_price, transaction_date, payment_status)
VALUES (3, 4, 18000.00, NOW() - INTERVAL '20 hours', 'Pending'),
(7, 7, 10500.00, NOW() - INTERVAL '24 days', 'Paid'),
(8, 10, 1550.00, NOW() - INTERVAL '30 minutes', 'Pending'),
(9, 7, 620.00, NOW() - INTERVAL '18 hours', 'Paid');