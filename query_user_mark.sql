SELECT
    mark,
    COUNT(*) AS count
FROM
    users
GROUP BY
    mark
UNION
SELECT
    'A+B' AS mark,
    COUNT(*) AS count
FROM
    users
WHERE
    mark IN ('A', 'B')
UNION
SELECT
    'A+C' AS mark,
    COUNT(*) AS count
FROM
    users
WHERE
    mark IN ('A', 'C')
UNION
SELECT
    'B+C' AS mark,
    COUNT(*) AS count
FROM
    users
WHERE
    mark IN ('B', 'C')
UNION
SELECT
    'A+B+C' AS mark,
    COUNT(*) AS count
FROM
    users
WHERE
    mark IN ('A','B', 'C');
