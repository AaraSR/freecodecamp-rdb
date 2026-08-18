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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size_km integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type text NOT NULL,
    description text,
    distance_from_earth numeric
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
    name character varying(50),
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
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
    name character varying(20),
    number_of_moons integer,
    radius numeric NOT NULL,
    description text NOT NULL,
    planet_type text,
    is_spherical boolean NOT NULL,
    has_life boolean,
    star_id integer
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
    name character varying(20),
    age_in_millions_of_year integer,
    distance_from_earth integer NOT NULL,
    description text NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 530);
INSERT INTO public.asteroid VALUES (2, 'Eros', 21);
INSERT INTO public.asteroid VALUES (3, 'Lutetia', 130);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Barred Spiral', 'Our home galaxy and the galaxy containing the Solar System.', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest major galaxy to the Milky Way.', 2.5);
INSERT INTO public.galaxy VALUES (3, 'LMC', 'Irregular', 'A satellite galaxy of the Milky Way with active star formation.', 0.2);
INSERT INTO public.galaxy VALUES (4, 'SMC', 'Irregular', 'A small satellite galaxy near the Milky Way.', 0.2);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'A prominent spiral galaxy known for its sweeping spiral arms.', 23.0);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Lenticular', 'An edge-on galaxy with a bright central bulge and dusty disk.', 30.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths natural satellite and the only natural moon of Earth.', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer moon of Mars.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant moon of Mars.', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A volcanic moon of Jupiter.', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter with a subsurface ocean.', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System.', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter.', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'A Saturnian moon with a thick atmosphere.', true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'A large icy moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A Saturnian moon known for its striking two-tone surface.', true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'An icy Saturnian moon with active water-rich plumes.', true, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 'A small Saturnian moon with a large impact crater.', true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'An icy moon of Saturn.', true, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 'An icy Saturnian moon with bright wispy terrain.', true, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 'The largest moon of Uranus.', true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 'The second-largest moon of Uranus.', true, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'A major moon of Uranus with a heavily fractured surface.', true, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'A dark major moon of Uranus.', true, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'The largest moon of Neptune and a geologically active icy world.', true, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'The largest moon of Pluto and a large companion relative to Pluto.', true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 2440, 'The smallest and innermost planet of the Solar System.', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 6052, 'A rocky planet with a thick carbon-dioxide atmosphere.', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 'Our home planet and the only world currently known to support life.', 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 3390, 'A cold desert world with a carbon-dioxide atmosphere.', 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 69911, 'The largest planet in the Solar System and a gas giant.', 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 274, 58232, 'A gas giant famous for its extensive ring system.', 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 25362, 'An ice giant that rotates at a dramatic tilt.', 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 24622, 'A distant blue ice giant with powerful winds.', 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 1189, 'A dwarf planet in the Kuiper Belt.', 'Dwarf Planet', true, false, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 476, 'The largest object in the asteroid belt and a dwarf planet.', 'Dwarf Planet', true, false, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 1200, 'A distant dwarf planet that helped lead to Pluto reclassification.', 'Dwarf Planet', true, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, 870, 'A rapidly rotating oval-shaped dwarf planet in the Kuiper Belt.', 'Dwarf Planet', false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500, 0, 'The nearest star to Earth and the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 9, 'The brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (3, 'Vega', NULL, 25, 'A bright blue-white star in the constellation Lyra.', 1);
INSERT INTO public.star VALUES (4, 'Altair', NULL, 17, 'A rapidly rotating star in the constellation Aquila.', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10, 642, 'A red supergiant star in the constellation Orion.', 1);
INSERT INTO public.star VALUES (6, 'Polaris', NULL, 433, 'The North Star located in the constellation Ursa Minor.', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

