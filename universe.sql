--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    inner_radius_au numeric NOT NULL,
    outer_radius_au numeric NOT NULL,
    estimated_number integer,
    description text
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_ly numeric NOT NULL,
    galaxy_type text,
    has_life boolean NOT NULL,
    age_billions_of_years integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbital_period_days numeric NOT NULL,
    diameter_km integer,
    has_atmosphere boolean,
    is_tidally_loocked boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbital_period_days numeric NOT NULL,
    planet_type character varying(20),
    diameter_km integer,
    has_atmosphere boolean NOT NULL,
    habitable_zone boolean,
    number_of_moons integer DEFAULT 0,
    discovery_year integer,
    discovered_by text,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_type character varying(10) NOT NULL,
    mass_solar_masses numeric NOT NULL,
    radius_solar_radii numeric,
    temperature_kelvin integer,
    is_main_sequence boolean NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (4, 13, 'Main Asteroid Belt', 2.2, 3.2, 1100000, 'Between Mars and Jupiter');
INSERT INTO public.asteroid_belt VALUES (5, 13, 'Kuiper Belt', 30.0, 55.0, NULL, 'Beyond Neptune');
INSERT INTO public.asteroid_belt VALUES (6, 13, 'Scattered Disc', 30.0, 1000.0, NULL, 'Overlapping with the Kuiper Belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (10, 'Milky Way', 100000, 'Spiral', true, 14, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (11, 'Andromeda', 220000, 'Spiral', false, 10, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (12, 'Triangulum', 50000, 'Spiral', false, 10, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (13, 'Sombrero', 50000, 'Lenticular', false, 9, 'Known for its prominent dust lane');
INSERT INTO public.galaxy VALUES (14, 'Whirlpool', 60000, 'Spiral', false, 1, 'Interacting grand design spiral');
INSERT INTO public.galaxy VALUES (15, 'Pinwheel', 170000, 'Spiral', false, 12, 'Face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 27, 'Moon', 27.3, 3474, false, true, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (2, 28, 'Phobos', 0.3, 22, false, true, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 28, 'Deimos', 1.3, 12, false, true, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 29, 'Io', 1.8, 3643, true, true, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 29, 'Europa', 3.6, 3122, true, true, 'Possible subsurface ocean');
INSERT INTO public.moon VALUES (6, 29, 'Ganymede', 7.2, 5268, true, true, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 29, 'Callisto', 16.7, 4821, false, true, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 30, 'Mimas', 0.9, 396, false, true, 'Has a large impact crater');
INSERT INTO public.moon VALUES (9, 30, 'Enceladus', 1.4, 504, true, true, 'Geysers erupting from south pole');
INSERT INTO public.moon VALUES (10, 30, 'Tethys', 1.9, 1060, false, true, 'Has a large canyon system');
INSERT INTO public.moon VALUES (11, 30, 'Dione', 2.7, 1123, false, true, 'Trailing hemisphere heavily cratered');
INSERT INTO public.moon VALUES (12, 30, 'Rhea', 4.5, 1527, false, true, 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 30, 'Titan', 15.9, 5150, true, true, 'Dense atmosphere, liquid methane lakes');
INSERT INTO public.moon VALUES (14, 30, 'Iapetus', 79.3, 1470, false, true, 'Two-toned appearance');
INSERT INTO public.moon VALUES (15, 31, 'Miranda', 1.4, 471, false, true, 'Geologically diverse surface');
INSERT INTO public.moon VALUES (16, 31, 'Ariel', 2.5, 1158, false, true, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (17, 31, 'Umbriel', 4.1, 1170, false, true, 'Darkest large moon of Uranus');
INSERT INTO public.moon VALUES (18, 31, 'Titania', 8.7, 1578, false, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 31, 'Oberon', 13.5, 1523, false, true, 'Heavily cratered moon of Uranus');
INSERT INTO public.moon VALUES (20, 32, 'Triton', 5.9, 2706, true, false, 'Retrograde orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 13, 'Mercury', 88.0, 'Terrestrial', 4879, false, false, 0, NULL, NULL, 'Innermost planet');
INSERT INTO public.planet VALUES (26, 13, 'Venus', 225.0, 'Terrestrial', 12104, true, false, 0, NULL, NULL, 'Hot, dense atmosphere');
INSERT INTO public.planet VALUES (27, 13, 'Earth', 365.25, 'Terrestrial', 12756, true, true, 1, NULL, NULL, 'Our home planet');
INSERT INTO public.planet VALUES (28, 13, 'Mars', 687.0, 'Terrestrial', 6792, true, false, 2, NULL, NULL, 'Red planet');
INSERT INTO public.planet VALUES (29, 13, 'Jupiter', 4331.0, 'Gas Giant', 142984, true, false, 95, NULL, NULL, 'Largest planet');
INSERT INTO public.planet VALUES (30, 13, 'Saturn', 10747.0, 'Gas Giant', 120536, true, false, 146, NULL, NULL, 'Ringed planet');
INSERT INTO public.planet VALUES (31, 13, 'Uranus', 30584.0, 'Ice Giant', 51118, true, false, 27, NULL, NULL, 'Tilted axis');
INSERT INTO public.planet VALUES (32, 13, 'Neptune', 59800.0, 'Ice Giant', 49528, true, false, 14, NULL, NULL, 'Farthest planet');
INSERT INTO public.planet VALUES (33, 18, 'Proxima Centauri b', 11.2, 'Exoplanet', NULL, true, true, 0, 2016, 'ESO', 'Potentially habitable exoplanet');
INSERT INTO public.planet VALUES (34, 18, 'Proxima Centauri c', 1900.0, 'Exoplanet', NULL, false, false, 0, 2019, 'ESO', 'Cold exoplanet');
INSERT INTO public.planet VALUES (35, 14, 'Sirius b', 50.1, 'White Dwarf', 12000, false, false, 0, 1862, 'Alvan Graham Clark', 'Companion to Sirius A');
INSERT INTO public.planet VALUES (36, 17, 'Mirach b', 25.0, 'Exoplanet', NULL, true, false, 0, NULL, NULL, 'Planet orbiting Mirach');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 10, 'Sun', 'G2V', 1.0, 1.0, 5778, true, 'Our star');
INSERT INTO public.star VALUES (14, 10, 'Sirius', 'A1V', 2.063, 1.71, 9940, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (15, 10, 'Betelgeuse', 'M2Iab', 15.0, 887.0, 3590, false, 'Red supergiant');
INSERT INTO public.star VALUES (16, 11, 'Alpheratz', 'B8V', 3.6, 2.7, 13000, true, 'Brightest star in Andromeda');
INSERT INTO public.star VALUES (17, 11, 'Mirach', 'M0III', 3.9, 100.0, 3800, false, 'Red giant in Andromeda');
INSERT INTO public.star VALUES (18, 10, 'Proxima Centauri', 'M5.5Ve', 0.12, 0.14, 3050, true, 'Nearest star to the Sun');


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

