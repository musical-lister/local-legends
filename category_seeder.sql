use adlister_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE categories;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO categories (category)
VALUES ('venue'),
       ('music'),
       ('general'),
       ('merchandise');