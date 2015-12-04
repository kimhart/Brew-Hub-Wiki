DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_users;
DROP TABLE IF EXISTS articles_categories;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(25),
  password_digest VARCHAR,
  age INTEGER,
  location VARCHAR
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY,
  title VARCHAR,
  date_created VARCHAR,
  content TEXT,
  last_edited VARCHAR,
  img_url TEXT,
  author_id INTEGER REFERENCES users(id),
  category_id REFERENCES categories(id),
  user_id REFERENCES users(id)
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  img_url TEXT
);

CREATE TABLE articles_users (
  article_id INTEGER REFERENCES articles(id),
  user_id INTEGER REFERENCES users(id)
);

CREATE TABLE articles_categories (
  category_id INTEGER REFERENCES categories(id),
  article_id INTEGER REFERENCES articles(id)
);






