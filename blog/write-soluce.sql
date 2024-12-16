-- 1. Créer le modérateur suivant :
---- username: 'jane.doe'
---- email: 'jane.doe@wanadoo.fr'
---- avatar: 'avatars/009.png'
---- password: hash md5 pour 'pLkHjrf0a'
INSERT INTO users (username, email, avatar, `password`, roles_id) 
VALUES ('jane.doe', 'jane.doe@wanadoo.fr', 'avatars/009.png', MD5('pLkHjrf0a'), 2);

-- 2. La vérification du compte de Nicole Menel est en erreur..., remettre la valeur null dans la colonne 'email_verified_at'
SET SQL_SAFE_UPDATES = 0;
UPDATE users SET email_verified_at = NULL WHERE username = 'nicole.mnl';

-- 3. Ajouter l'article de la catégorie 'Travel' écrit par Denise Rosental :
---- title: 'Les devants de la scène'
---- slug: 'les-devants-de-la-scene'
---- content: 'Lorem ipsum dolor sit amet...'
---- cover: 'covers/009.png'
INSERT INTO articles (title, slug, content, cover, categories_id, users_id) 
VALUES (
    'Les devants de la scène',
    'les-devants-de-la-scene',
    'Lorem ipsum dolor sit amet...',
    'covers/009.png',
    (SELECT categories.id FROM categories WHERE categories.title = 'Travel'),
    (SELECT users.id FROM users WHERE users.username = 'denise.rstl')
);

-- 4. Supprimer de manière douce tous les commentaires de Charles Leroy
UPDATE comments 
INNER JOIN users ON users.id = comments.users_id
SET comments.deleted_at = NOW() 
WHERE users.username = 'charles.lry';

-- 5. Changer la fin de l'adresse email des modérateurs par @myblog.fr - [2 solutions proposées]
UPDATE users SET email = CONCAT(SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', 1), '@', -1), '@myblog.fr') WHERE role_id = 2;
UPDATE users SET email = CONCAT(LEFT(email, INSTR(email, '@')), 'myblog.fr') WHERE role_id = 2;

-- 6. Ajouter le tag 'landscape' et l'associer à tous les articles de la catégorie 'Art'
INSERT INTO tags (title) VALUES ('landscape');

INSERT INTO articles_has_tags (articles_id, tags_id)
VALUES (
    (
        SELECT articles.id FROM articles 
        INNER JOIN categories ON categories.id = articles.categories_id
        WHERE categories.title = 'Art'
    ),
    (
        SELECT tags.id FROM tags WHERE tags.title = 'landscape'
    )
)

-- 7. Mettre à jour la catégorie de l'article Digital painting en 'Travel'
UPDATE articles
SET articles.categories_id = (SELECT categories.id FROM categories WHERE categories.title = 'Travel')  
WHERE articles.title = 'Digital Painting';

-- 8. Ajouter à la fin des commentaires de John Doe, une signature qui sera la chaîne de caractères 'John Doe'
UPDATE comments
INNER JOIN users ON users.id = comments.users_id
SET comments.content = CONCAT(comments.content, ' ', 'John Doe')
WHERE users.username = 'john.doe';

-- 9. Supprimer définitivement l'article dont l'id est égale à 2 et ses commentaires associés.

START TRANSACTION;
    DELETE FROM comments WHERE articles_id = 2;
    DELETE FROM articles_has_tags WHERE articles_id = 2;
    DELETE FROM users_has_articles WHERE articles_id = 2;
    DELETE FROM articles WHERE id = 2;
COMMIT;

 