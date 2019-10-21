DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS feed;
DROP TABLE IF EXISTS user_feed;
DROP TABLE IF EXISTS item;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE feed (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  description TEXT,
  link NVARCHAR,
  href NVARCHAR NOT NULL,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE user_feed (
  user_id INTEGER NOT NULL,
  feed_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (feed_id) REFERENCES feed (id)
);

CREATE TABLE item (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  feed_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  link NVARCHAR,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guid TEXT,
  FOREIGN KEY (feed_id) REFERENCES feed (id)
);
