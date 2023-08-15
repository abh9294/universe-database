--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth_in_mly numeric(8,4),
    description text,
    galaxytype_id integer NOT NULL
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
-- Name: galaxytype; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxytype (
    galaxytype_id integer NOT NULL,
    name character varying(20) NOT NULL,
    no_of_subtypes integer NOT NULL
);


ALTER TABLE public.galaxytype OWNER TO freecodecamp;

--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxytype_galaxytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxytype_galaxytype_id_seq OWNER TO freecodecamp;

--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxytype_galaxytype_id_seq OWNED BY public.galaxytype.galaxytype_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    radius_in_km numeric(10,4),
    rotation_period_in_days numeric(10,4),
    planet_id integer NOT NULL
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
    no_of_moons integer,
    has_life boolean,
    radius_in_km numeric(10,4),
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    no_of_planets integer,
    is_binary_system boolean,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxytype galaxytype_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype ALTER COLUMN galaxytype_id SET DEFAULT nextval('public.galaxytype_galaxytype_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 0.0000, 'It is the galaxy which contains the solar system and it is hard to recognize from a naked eye', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.5370, 'It is the nearest galaxy to earth, cataloged as NGC 224', 1);
INSERT INTO public.galaxy VALUES (3, 'MESSIAR 87', 53.4900, 'It is supergiant elliptical galaxy in the constillation Virgo', 2);
INSERT INTO public.galaxy VALUES (4, 'NGC 3115', 31.6400, 'It was discovered by William Herchel in 1787.It is several times bigger than Milkyway', 3);
INSERT INTO public.galaxy VALUES (5, 'LMC', 0.1580, 'The Large Magnetic Cloud is a satellite galaxy of the Milkyway', 4);
INSERT INTO public.galaxy VALUES (6, 'Cygnus A', 600.0000, 'It is a radio galaxy, which is one of the strongest radio source in the sky, it was discovered by Grote Reber in 1939', 2);


--
-- Data for Name: galaxytype; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxytype VALUES (1, 'spiral', 2);
INSERT INTO public.galaxytype VALUES (2, 'ellptical', 2);
INSERT INTO public.galaxytype VALUES (3, 'lenticular', 1);
INSERT INTO public.galaxytype VALUES (4, 'irregular', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.4000, 27.0000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.2667, 0.3180, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2000, 1.2630, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.6000, 1.7690, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8000, 3.5500, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1000, 7.1540, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3000, 16.6890, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2574.7300, 15.9450, 6);
INSERT INTO public.moon VALUES (9, 'Tethys', 531.1000, 1.8870, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252.1000, 1.3700, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 763.5000, 4.5180, 6);
INSERT INTO public.moon VALUES (12, 'Lapetus', 734.4000, 79.3215, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 561.4000, 2.7360, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 198.2000, 0.9420, 6);
INSERT INTO public.moon VALUES (15, 'Cordelia', 20.1000, 0.3350, 7);
INSERT INTO public.moon VALUES (16, 'Bianca', 25.7000, 0.4340, 7);
INSERT INTO public.moon VALUES (17, 'Ophelia', 21.4000, 0.3760, 7);
INSERT INTO public.moon VALUES (18, 'Cressida', 39.8000, 0.4630, 7);
INSERT INTO public.moon VALUES (19, 'Naiad', 30.2000, 0.2940, 8);
INSERT INTO public.moon VALUES (20, 'Larissa', 97.0000, 0.5540, 8);
INSERT INTO public.moon VALUES (21, 'Cheron', 606.0000, 6.3870, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 2439.7000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 6051.8000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 6371.0000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 3389.5000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, false, 69911.0000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 63, false, 58232.0000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, false, 25362.0000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 24622.0000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, false, 1188.3000, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centuary d', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centuary b', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Proxima Centuary c', NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, NULL, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centuary', 2, NULL, 1);
INSERT INTO public.star VALUES (3, 'Alpha And', NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Beta And', NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'HD 33579', NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Melick 34', NULL, NULL, 5);
INSERT INTO public.star VALUES (7, 'Deneb', NULL, NULL, 6);
INSERT INTO public.star VALUES (8, 'Albero', NULL, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxytype_galaxytype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxytype_galaxytype_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxytype galaxytype_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype
    ADD CONSTRAINT galaxytype_name_key UNIQUE (name);


--
-- Name: galaxytype galaxytype_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxytype
    ADD CONSTRAINT galaxytype_pkey PRIMARY KEY (galaxytype_id);


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
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


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
-- Name: galaxy galaxy_galaxytype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxytype_id_fkey FOREIGN KEY (galaxytype_id) REFERENCES public.galaxytype(galaxytype_id);


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

