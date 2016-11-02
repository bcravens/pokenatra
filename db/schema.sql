DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name TEXT,
  cp INT,
  poke_type TEXT,
  img_url TEXT
);

CREATE TABLE trainers(
  id SERIAL PRIMARY KEY,
  name TEXT,
  level INT,
  team_id INT,
  owned_pokemon TEXT,
  img_url TEXT
);
