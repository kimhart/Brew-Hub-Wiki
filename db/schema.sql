DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles_users;
DROP TABLE IF EXISTS articles_categories;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(25),
  password_digest VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
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
  editor_id INTEGER REFERENCES users(id),
  category_id INTEGER REFERENCES categories(id)
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  img_url TEXT
);

CREATE TABLE articles_categories (
  category_id INTEGER REFERENCES categories(id),
  article_id INTEGER REFERENCES articles(id)
);






