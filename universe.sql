--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    period_years integer NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    distance_mly numeric(10,3) NOT NULL,
    diameter_kly integer NOT NULL,
    has_black_hole boolean NOT NULL,
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    mean_radius_km integer NOT NULL,
    orbital_period_days numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    notes text
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days integer NOT NULL,
    has_rings boolean NOT NULL,
    is_habitable boolean NOT NULL,
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(20) NOT NULL,
    age_billion_years numeric(5,2) NOT NULL,
    mass_solar numeric(6,3) NOT NULL,
    is_variable boolean NOT NULL,
    notes text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 75, true, 'Famous periodic comet visible from Earth.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533, true, 'Bright comet observed in 1997; very long period.');
INSERT INTO public.comet VALUES (3, 'Andromeda Drift', 2, 410, true, 'Fictional periodic comet for project data.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.000, 105, true, 'Our home galaxy; barred spiral with multiple arms.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 220, true, 'Nearest large galaxy; on a collision course with the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.730, 60, false, 'Smaller spiral in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 31.000, 50, true, 'Bright nucleus and prominent dust lane give a sombrero-like appearance.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23.000, 76, true, 'Classic interacting spiral galaxy (M51).');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53.500, 120, true, 'Giant elliptical galaxy with a famous central black hole image.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.30, true, false, 'Earth’s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.30, false, false, 'Small irregular moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.30, false, false, 'Smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.80, true, true, 'Volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 3.60, true, true, 'Icy crust; subsurface ocean suspected.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.20, true, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.70, true, true, 'Heavily cratered; ancient surface.');
INSERT INTO public.moon VALUES (8, 'Metis', 5, 21, 0.30, false, false, 'Inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Adrastea', 5, 8, 0.30, false, false, 'Tiny moon near Jupiter’s rings.');
INSERT INTO public.moon VALUES (10, 'Titan', 6, 2575, 15.90, true, true, 'Thick atmosphere; methane lakes.');
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 252, 1.40, true, true, 'Icy moon with geysers.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 763, 4.50, true, false, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 735, 79.30, true, false, 'Two-toned coloration; distant orbit.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 561, 2.70, true, false, 'Icy moon with fractures.');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 531, 1.90, true, false, 'Large impact crater Odysseus.');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 235, 1.40, true, false, 'Patchwork terrain; cliffs.');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 578, 2.50, true, false, 'Bright icy surface with canyons.');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1353, 5.90, true, true, 'Retrograde orbit; possible cryovolcanism.');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 170, 360.10, false, false, 'Highly eccentric orbit around Neptune.');
INSERT INTO public.moon VALUES (20, 'Proxima b-I', 9, 900, 7.00, true, false, 'Fictional moon for project data.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 2439, 88, false, false, 'Small rocky planet closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 6052, 225, false, false, 'Thick atmosphere; very hot surface.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 6371, 365, false, true, 'Liquid water on the surface; life known.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 3389, 687, false, false, 'Cold desert world; evidence of ancient water.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 69911, 4333, true, false, 'Largest planet; many moons.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 58232, 10759, true, false, 'Iconic ring system; low density.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 25362, 30687, true, false, 'Rotates on its side; faint rings.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 24622, 60190, true, false, 'Strong winds; deep blue color.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 7160, 11, false, true, 'Exoplanet in the habitable zone of Proxima Centauri (project data).');
INSERT INTO public.planet VALUES (10, 'Sirius b I', 2, 'Terrestrial', 4100, 42, false, false, 'Fictional project planet orbiting Sirius.');
INSERT INTO public.planet VALUES (11, 'Rigel Prime', 5, 'Gas Giant', 72000, 900, true, false, 'Fictional project gas giant around Rigel.');
INSERT INTO public.planet VALUES (12, 'Andromeda-1', 6, 'Ice Giant', 26000, 1200, true, false, 'Fictional project planet around S Doradus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4.60, 1.000, false, 'Reference star for our solar system.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 0.24, 2.060, false, 'Brightest star in Earth’s night sky (binary system).');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-2Ia', 0.01, 11.600, true, 'Red supergiant; semi-regular variable.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 4.85, 0.122, true, 'Closest known star to the Sun; flare star.');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'B8Ia', 0.01, 21.000, true, 'Blue supergiant in Orion; variable.');
INSERT INTO public.star VALUES (6, 'S Doradus', 2, 'LBV', 0.00, 50.000, true, 'Luminous blue variable in the Large Magellanic Cloud region (for project use).');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

