-- QUESTIONS: COUNT 3
INSERT INTO questions (`title`) VALUES ('Combien mesure la Tour Eiffel en mètres ?');
INSERT INTO questions (`title`) VALUES ('Quelle est la capitale de la Hongrie ?');
INSERT INTO questions (`title`) VALUES ('Qui a animé le Bigdil ?');


-- CHOICES: COUNT 9 (3 PER QUESTION)
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('200', 0, 1);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('300', 1, 1);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('400', 0, 1);

INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Helsinki', 0, 2);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Ljubljana', 0, 2);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Budapest', 1, 2);

INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Vincent Lagaf', 1, 3);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Cyril Hanouna', 0, 3);
INSERT INTO choices (`title`, `is_correct`, `questions_id`) VALUES ('Thierry Ardisson', 0, 3);


