BEGIN;

INSERT INTO spaceman(name, surname, sex, rank)
VALUES ('Floyd', 'Shutnik', 'Male', 'General'),
    ('Alice', 'Martin', 'Female', 'Cadet'),
    ('Barbara', 'Jones', 'Female', 'Lieutenant'),
    ('Charles', 'Brown', 'Male', 'Major'),
    ('Diana', 'Smith', 'Female', 'Cadet'),
    ('Edward', 'White', 'Male', 'Lieutenant');

INSERT INTO newspaper(name, genre)
VALUES ('TIMES', 'News'),
    ('AFISHA', 'News'),
    ('KINO', 'Advertisement'),
    ('METRO', 'Report'),
    ('SPIR', 'History'),
    ('HOUSEWIFE', 'Review');

 INSERT INTO topic(newspaper_id, name)
VALUES (1, 'Stonks'),
    (2, 'Space Tourism and Future Trends'),
    (3, 'Best cookies in the world'),
    (4, 'Sunny Day'),
    (5, 'The History of Space Travel'),
    (6, 'Iphone 2077 review');

INSERT INTO newspaper_spaceman(spaceman_id, newspaper_id, thought, time)
VALUES (1, 1, 'Charles Brown will be the first human on Saturn', NOW() - INTERVAL '25 minutes'),
    (2, 2, 'Barbara Jones will be the first woman on Uranus', NOW() - INTERVAL '66 minutes'),
    (3, 3, 'Edward White will explore Neptune and its rings', NOW() - INTERVAL '73 minutes'),
    (4, 4, 'Floyd Shutnik will travel to Pluto to study its atmosphere', NOW() - INTERVAL '10 minutes'),
    (5, 5, 'Stephen Hawking will develop a new way of traveling in space', NOW() - INTERVAL '15 minutes'),
    (6, 6, 'Diana Smith will be the first woman astronaut on Mars', NOW() - INTERVAL '300 minutes');

INSERT INTO planet(name, coordinates, gravitation)
VALUES ('Saturn', POINT(214124, 98782178), 2),
    ('Uranus', POINT(123456, 78901234), 3),
    ('Neptune', POINT(567890, 12345678), 4),
    ('Pluto', POINT(901234, 56789012), 5),
    ('Venus', POINT(345678, 90123456), 6),
    ('Mars', POINT(789012, 34567890), 7),
    ('Jupiter', POINT(123456, 78901234), 8);

INSERT INTO spaceship(model, max_speed)
VALUES ('Dreadnought', 5000),
    ('Battleship', 2300),
    ('Cruiser', 7200),
    ('Destroyer', 1200),
    ('Escort vessel', 1000),
    ('Frigate', 500);

INSERT INTO flight(spaceship_id, destination_id, launch_time)
VALUES (1, 6, NOW() - INTERVAL '5 minutes'),
    (2, 5, NOW() - INTERVAL '2 minutes'),
    (3, 4, NOW() - INTERVAL '3 minutes'),
    (4, 3, NOW() - INTERVAL '4 minutes'),
    (5, 2, NOW() - INTERVAL '6 minutes'),
    (6, 1, NOW() - INTERVAL '7 minutes');

INSERT INTO flight_spaceman(spaceman_id, flight_id, is_on_board)
VALUES (1, 1, TRUE),
    (2, 1, FALSE),
    (3, 1, TRUE),
    (4, 1, TRUE),
    (5, 1, TRUE),
    (6, 1, TRUE);

COMMIT;