CREATE DATABASE reviews;

USE reviews;

CREATE TABLE user_review (
  id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  reviewer_name CHAR(100),
  star_rating TINYINT,
  details VARCHAR(4000)
  );
  
INSERT INTO user_review (reviewer_name, star_rating, details) VALUES ('Ben', '5', 'Love the calzone!');
INSERT INTO user_review (reviewer_name, star_rating, details) VALUES ('Leslie', '1', 'Calzones are the worst.');

GRANT ALL ON reviews.* to review_site@localhost IDENTIFIED BY 'JxSLRkdutW';