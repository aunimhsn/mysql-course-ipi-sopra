-- 1.
SELECT * FROM users;

-- 2.
SELECT email FROM users ORDER BY email ASC; 

-- 3.
SELECT COUNT(*) FROM articles;

-- 4.
SELECT title, created_at 
FROM articles 
ORDER BY created_at DESC LIMIT 4;

-- 5.
SELECT articles.title, categories.title 
FROM articles
INNER JOIN categories ON articles.categories_id = categories.id
WHERE categories.title IN ('Travel', 'Art');

-- 6.
SELECT * FROM users WHERE email LIKE '%@yahoo.fr';

-- 7.
SELECT COUNT(*) FROM users
INNER JOIN roles ON users.roles_id = roles.id
WHERE roles.title = 'MODERATOR';

-- 8.
SELECT * FROM users ORDER BY created_at DESC LIMIT 1;

-- 9.
SELECT a.title, t.title 
FROM articles a
INNER JOIN articles_has_tags aht ON a.id = aht.articles_id
INNER JOIN tags t ON aht.tags_id = t.id
WHERE a.title = 'Alpine JS';

-- 10.
SELECT * FROM users WHERE email_verified_at IS NULL;

-- 11.
SELECT users.username, COUNT(articles.id) AS nb_likes 
FROM users
INNER JOIN users_has_articles ON users.id = users_has_articles.users_id
INNER JOIN articles ON users_has_articles.articles_id = articles.id
GROUP BY users.username
ORDER BY nb_likes DESC LIMIT 1;

-- 12.
SELECT categories.title, COUNT(categories.id) 
FROM categories
INNER JOIN articles ON articles.categories_id = categories.id
GROUP BY categories.title
ORDER BY COUNT(categories.id) DESC LIMIT 1;

-- 13.
SELECT users.username, comments.content
FROM users
INNER JOIN comments ON users.id = comments.users_id
WHERE users.username = 'marise.cpz';

-- 14.
SELECT CONCAT(articles.title, ' - ', categories.title) 
FROM articles 
INNER JOIN categories ON articles.categories_id = categories.id;

-- 15.
SELECT AVG(dt.nb_likes) FROM
(
	SELECT articles.title, COUNT(users_has_articles.articles_id) AS nb_likes 
	FROM users
	INNER JOIN users_has_articles ON users.id = users_has_articles.users_id
	INNER JOIN articles ON users_has_articles.articles_id = articles.id
	GROUP BY articles.title
) AS dt;

-- 16.
SELECT articles.title, COUNT(users_has_articles.articles_id) AS nb_likes 
FROM users
INNER JOIN users_has_articles ON users.id = users_has_articles.users_id
INNER JOIN articles ON users_has_articles.articles_id = articles.id
GROUP BY articles.title
ORDER BY nb_likes DESC;


