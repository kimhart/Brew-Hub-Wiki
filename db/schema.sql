DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_users;
DROP TABLE IF EXISTS categories_articles;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(25),
  password VARCHAR(15)
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY,
  title VARCHAR,
  date_posted VARCHAR,
  time_posted VARCHAR,
  author VARCHAR,
  content TEXT,
  last_edited VARCHAR,
  img_url TEXT,
  category_id REFERENCES categories(id),
  user_id REFERENCES users(id)
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  article_id REFERENCES articles(id)
)

CREATE TABLE articles_users (
  article_id INTEGER REFERENCES articles(id),
  user_id INTEGER REFERENCES users(id)
);

CREATE TABLE categories_articles (
  category_id INTEGER REFERENCES categories(id),
  article_id INTEGER REFERENCES articles(id)
)






