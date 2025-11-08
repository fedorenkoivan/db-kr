-- Знайти лоти з найбільшою кількістю ставок
WITH LotBidCounts AS (
    SELECT
        lot_id,
        COUNT(bid_id) AS total_bids
    FROM
        bids
    GROUP BY
        lot_id
),
RankedLots AS (
    SELECT
        l.title,
        lbc.total_bids,
        RANK() OVER (ORDER BY lbc.total_bids DESC) as bid_rank
    FROM
        LotBidCounts lbc
    JOIN
        lots l ON lbc.lot_id = l.lot_id
)
SELECT
    title,
    total_bids
FROM
    RankedLots
WHERE
    bid_rank = 1;

-- Обчислити середню фінальну ціну за категоріями
SELECT
    c.category_name,
    COUNT(t.transaction_id) AS total_sales,
    ROUND(AVG(t.final_price), 2) AS average_final_price
FROM
    transactions t
JOIN
    lots l ON t.lot_id = l.lot_id
JOIN
    categories c ON l.category_id = c.category_id
GROUP BY
    c.category_name
ORDER BY
    average_final_price DESC;

-- Ранжувати користувачів за загальною сумою виграних аукціонів (віконні функції)
SELECT
    u.user_id,
    u.full_name,
    SUM(t.final_price) AS total_won_amount,
    RANK() OVER (ORDER BY SUM(t.final_price) DESC) AS user_rank
FROM 
    users u
JOIN 
    transactions t ON u.user_id = t.winner_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    user_rank;

-- Знайти лоти, які не отримали жодної ставки
SELECT
    l.title,
    l.start_price,
    l.current_price
FROM
    lots l
LEFT JOIN
    bids b ON l.lot_id = b.lot_id
WHERE
    b.bid_id IS NULL;
