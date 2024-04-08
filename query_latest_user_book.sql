SELECT u.name, b.name, b.date
FROM Books b
JOIN (
    SELECT user_id, MAX(date) AS max_date
    FROM Books
    GROUP BY user_id
) latest ON b.user_id = latest.user_id AND b.date = latest.max_date
JOIN users u ON u.id = latest.user_id
ORDER BY b.date desc;