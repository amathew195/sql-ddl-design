CREATE TABLE stars (
    star_name VARCHAR(20) PRIMARY KEY,
    temp_k INT NOT NULL);

CREATE TABLE planets (
    planet_name VARCHAR(20) PRIMARY KEY,
    orbit_years FLOAT NOT NULL,
    star_name VARCHAR(20) NOT NULL REFERENCES stars);

CREATE TABLE moons (
    moon_name VARCHAR(20) PRIMARY KEY,
    planet_name VARCHAR(20) NOT NULL REFERENCES planets);

INSERT INTO planets(planet_name, orbit_years, star_name)
    VALUES ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO stars(star_name, temp_k)
    VALUES ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO moons(moon_name, planet_name)
    VALUES('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');

SELECT p.planet_name AS planet, p.star_name AS star, COUNT(m.moon_name)
    FROM planets AS p
        LEFT OUTER JOIN moons AS m
        ON p.planet_name = m.planet_name
    GROUP BY p.planet_name
    ORDER BY p.planet_name;

