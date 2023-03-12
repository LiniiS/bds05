/* Usuários */
INSERT INTO tb_user (name, email, password) VALUES ('Bob Brown', 'bob@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Ana Brown', 'ana@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Maria Green', 'maria@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');

/* Roles */
INSERT INTO tb_role (authority) VALUES ('ROLE_VISITOR');
INSERT INTO tb_role (authority) VALUES ('ROLE_MEMBER');

-- Bob -> somente visitor
INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);
-- Ana -> member
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);

-- Maria -> visitor & member
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 2);

/* Genre */
INSERT INTO tb_genre (name) VALUES ('Fantasia');
INSERT INTO tb_genre (name) VALUES ('Ficção');
INSERT INTO tb_genre (name) VALUES ('Sci-Fi');

/* Movies */
INSERT INTO tb_movie (title, sub_Title, year, img_Url, synopsis, genre_id) VALUES ('Harry Potter', 'e a Pedra Filosofal', 2001, 'https://via.placeholder.com/300/008000', 'Harry é um garoto órfão...ingressar em Hogwarts', 1);
INSERT INTO tb_movie (title, sub_Title, year, img_Url, synopsis, genre_id) VALUES ('Animais Fantásticos', 'e Onde Habitam', 2016, 'https://via.placeholder.com/300/008000', 'Filme do Harry Potter sem Harry Potter', 1);

/* Reviews */
INSERT INTO tb_review (text, user_id, movie_id) VALUES ('Filme muito bom, pena que acaba!', 1, 1);
INSERT INTO tb_review (text, user_id, movie_id) VALUES ('Filme de Harry Potter sem Harry Potter', 2, 2);