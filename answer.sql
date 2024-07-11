-- TYPE YOUR SQL QUERY BELOW

-- On 2018-06-02, we released the Kanban Board on Shiptivity app, 1527868800
-- 'card', 'card_change_history', 'login_history', 'user'

-- ATTACH DATABASE 'shiptivity.db' AS 'data';

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

-- Average Daily Login Count Before 
SELECT AVG(login_count)
FROM (
    SELECT 
        COUNT(user_id) as 'login_count', 
        date(login_timestamp, 'unixepoch') as login_date
    FROM 'login_history'
    GROUP BY login_date
) as dailyLogin
WHERE unixepoch(login_date) < 1527868800;

-- Average Daily Login Count After
SELECT AVG(login_count)
FROM (
    SELECT 
        COUNT(user_id) as 'login_count', 
        date(login_timestamp, 'unixepoch') as login_date
    FROM 'login_history'
    GROUP BY login_date
) as dailyLogin
WHERE unixepoch(login_date) >= 1527868800;

-- PART 2: Create a SQL query that indicates the number of status changes by card

-- Number of status changes by card id
SELECT 
    cardID,
    COUNT(id) as 'status_change_count'
FROM 'card_change_history' as history
WHERE oldStatus != newStatus
GROUP BY cardID


