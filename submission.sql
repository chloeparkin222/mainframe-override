--1. I explored all tables
\dt
\d forum_posts
\d forum_accounts
\d emptystack_accounts

-- 2. Found April 2048 post mentioning EmptyStack and dad
SELECT *
FROM forum_posts
WHERE date >= '2048-04-01'
  AND date <  '2048-05-01'
  AND content ILIKE '%emptystack%'
  AND content ILIKE '%dad%';

-- 3. I use the author id from the post to find the author account
SELECT *
FROM forum_accounts
WHERE id = ???;

-- 4. I found other forum accounts with the same last name, so I had to see who was active. (Noted that fa and fp are shortcuts)
SELECT forum_accounts.id, forum_accounts.username, COUNT(fp.id) AS post_count
FROM forum_accounts
JOIN forum_posts fp ON fp.forum_account_id = forum_accounts.id
WHERE forum_accounts.last_name = '???'
GROUP BY forum_accounts.id, forum_accounts.username
ORDER BY post_count DESC;

-- 5. I searched emptystack employee accounts using dad's name
SELECT *
FROM emptystack_accounts
WHERE last_name = '???';