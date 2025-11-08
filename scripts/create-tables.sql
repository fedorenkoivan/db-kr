CREATE TABLE IF NOT EXISTS users 
(
    user_id serial PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    email varchar(100) NOT NULL UNIQUE,
    password_hash varchar(255) NOT NULL,
    full_name varchar(100) NOT NULL,
    registration_date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categories 
(
    category_id serial PRIMARY KEY,
    category_name varchar(50) NOT NULL UNIQUE,
    description text
);

CREATE TABLE IF NOT EXISTS lots 
(
    lot_id serial PRIMARY KEY,
    seller_id integer not null references users(user_id),
    category_id integer not null references categories(category_id),
    title varchar(255) NOT NULL,
    description text NOT NULL,
    start_price decimal(10, 2) NOT NULL,
    current_price decimal(10, 2) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    status varchar(10) NOT NULL CHECK (status IN ('Active', 'Sold', 'Expired', 'Canceled')),
    image_url varchar(255)
);

CREATE TABLE IF NOT EXISTS bids 
(
    bid_id serial PRIMARY KEY,
    lot_id integer not null references lots(lot_id),
    bidder_id integer not null references users(user_id),
    bid_amount decimal(10, 2) NOT NULL,
    bid_time timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (bid_amount > 0)
);


CREATE TABLE IF NOT EXISTS transactions
(
    transaction_id serial PRIMARY KEY,
    lot_id integer not null references lots(lot_id),
    winner_id integer not null references users(user_id),
    final_price decimal(10, 2) NOT NULL,
    transaction_date timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_status varchar(10) NOT NULL CHECK (payment_status IN ('Pending', 'Paid', 'Failed'))
);