BEGIN;

CREATE TYPE SEX as ENUM ('Male', 'Female');
CREATE TYPE MODEL as ENUM ('Dreadnought', 'Battleship', 'Cruiser', 'Destroyer', 'Escort vessel', 'Frigate', 'Attack fighter', 'Raider');
CREATE TYPE GENRE as ENUM ('News', 'Report', 'Review', 'Science', 'Advertisement', 'Cooking recipe', 'History');
CREATE TYPE RANK as ENUM ('Cadet', 'Lieutenant', 'Captain', 'Major', 'Colonel', 'General');

CREATE TABLE spaceman (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  sex SEX NOT NULL,
  rank RANK NOT NULL
);

CREATE TABLE planet (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  coordinates POINT,
  gravitation INT NOT NULL
);

CREATE TABLE spaceship (
  id SERIAL PRIMARY KEY,
  model MODEL NOT NULL,
  max_speed INT NOT NULL
);

CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  spaceship_id INT NOT NULL REFERENCES spaceship(id) ON DELETE CASCADE,
  destination_id INT NOT NULL REFERENCES planet(id) ON DELETE CASCADE,
  launch_time TIMESTAMP DEFAULT NOW()
);

CREATE TABLE flight_spaceman (
  id SERIAL PRIMARY KEY,
  spaceman_id INT NOT NULL REFERENCES spaceman(id) ON DELETE CASCADE,
  flight_id INT NOT NULL REFERENCES flight(id) ON DELETE CASCADE,
  is_on_board BOOLEAN DEFAULT TRUE
);

CREATE TABLE newspaper (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  genre GENRE NOT NULL
);

CREATE TABLE topic (
  id SERIAL PRIMARY KEY,
  newspaper_id INT NOT NULL REFERENCES newspaper(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE newspaper_spaceman (
  id SERIAL PRIMARY KEY,
  spaceman_id INT NOT NULL REFERENCES spaceman(id) ON DELETE CASCADE,
  newspaper_id INT NOT NULL REFERENCES newspaper(id) ON DELETE CASCADE,
  thought VARCHAR(255) NOT NULL,
  time TIMESTAMP DEFAULT NOW()
);


COMMIT;