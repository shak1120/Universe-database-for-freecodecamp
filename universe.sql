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
    name character varying(30),
    galaxy_type character varying(30),
    distance_from_earth numeric(4,1),
    age_in_millions_of_years integer,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(30),
    age_in_millions_of_years integer,
    description text,
    has_life boolean NOT NULL,
    spherical boolean NOT NULL,
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
    name character varying(30),
    age_in_millions_of_years integer,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 349.0, 36, 'This galaxy is very beautiful', false, true);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Elliptical', 743.2, 21, 'I have no idea what this galaxy is', true, false);
INSERT INTO public.galaxy VALUES (4, 'Backward', 'Peculiar', 987.3, 33, 'when will I die', true, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Irregular', 832.6, 12, 'how did i forget this', true, true);
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 'Magical', 432.3, 21, 'Freecodecamp is the best', true, false);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Shak', 891.3, 45, 'this is the last insertion', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganemedy', 12, 'beautiful moon', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Callisto', 342, 'Moon is moon', true, false, 6);
INSERT INTO public.moon VALUES (3, 'Io', 13, 'what a short name for moon', true, true, 7);
INSERT INTO public.moon VALUES (4, 'Europa', 15, 'Moon is lovely', true, true, 8);
INSERT INTO public.moon VALUES (5, 'Himalia', 31, 'Moon should be moon', true, true, 9);
INSERT INTO public.moon VALUES (6, 'Thebe', 54, 'Moon is not bad', true, false, 10);
INSERT INTO public.moon VALUES (7, 'Elara', 78, 'moon is huhh', true, false, 11);
INSERT INTO public.moon VALUES (8, 'Pasiphe', 111, 'Moon is in my mac', true, false, 12);
INSERT INTO public.moon VALUES (9, 'Metis', 989, 'I m out of words for real', true, false, 13);
INSERT INTO public.moon VALUES (10, 'Carme', 453, 'Am I suppose to write', false, false, 14);
INSERT INTO public.moon VALUES (11, 'Sinope', 900, 'Huh i m hungry', true, true, 15);
INSERT INTO public.moon VALUES (12, 'Ananke', 897, 'Fried chicken taste well', true, false, 16);
INSERT INTO public.moon VALUES (13, 'Anan', 837, 'Fried chicken taste well', true, false, 16);
INSERT INTO public.moon VALUES (14, 'Anus', 437, ' chicken taste well', true, false, 15);
INSERT INTO public.moon VALUES (15, 'Kalyke', 432, '  taste well', true, false, 14);
INSERT INTO public.moon VALUES (16, 'Locaste', 652, ' well', true, false, 13);
INSERT INTO public.moon VALUES (17, 'Callirbone', 65, ' well said mr moon', true, false, 12);
INSERT INTO public.moon VALUES (18, 'Calli', 653, ' mr moon', true, false, 11);
INSERT INTO public.moon VALUES (19, 'Taygete', 873, ' mr moonis great', true, false, 10);
INSERT INTO public.moon VALUES (20, 'Aoede', 980, ' Moon is great and  great', true, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Leo', 322, 'This is a star', true, false, 2);
INSERT INTO public.planet VALUES (6, 'Persesus', 231, 'Star is beutiful', true, true, 2);
INSERT INTO public.planet VALUES (7, 'Crater', 435, 'what is a star huh', false, false, 3);
INSERT INTO public.planet VALUES (8, 'Auriga', 564, 'I own 3 stars', true, false, 3);
INSERT INTO public.planet VALUES (9, 'Hydra', 782, 'This star belongs to alerza', true, false, 4);
INSERT INTO public.planet VALUES (10, 'Orion', 231, 'this star belongs to alenraz al asad', true, false, 4);
INSERT INTO public.planet VALUES (11, 'Draco', 54, 'My pc is cute', true, false, 5);
INSERT INTO public.planet VALUES (12, 'Bootes', 89, 'what an ugly name for star', true, false, 5);
INSERT INTO public.planet VALUES (13, 'Zahal', 56, 'I m just in love with this star', false, false, 6);
INSERT INTO public.planet VALUES (14, 'Toyota', 465, 'Is this even a star name', true, false, 6);
INSERT INTO public.planet VALUES (15, 'Shak', 42, 'For sure this is  a star', true, true, 7);
INSERT INTO public.planet VALUES (16, 'Zakus', 76, 'What is the name of star', true, false, 7);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Carpo', true);
INSERT INTO public.planet_type VALUES (2, 'Erinome', false);
INSERT INTO public.planet_type VALUES (3, 'Hegomone', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Lynx', 199, 'Very unfimilliar star', true, true, 2);
INSERT INTO public.star VALUES (3, 'Eridanus', 299, 'I love stars', false, true, 3);
INSERT INTO public.star VALUES (4, 'Crux', 399, 'Crux is a lovely star', true, false, 4);
INSERT INTO public.star VALUES (5, 'Cancer', 499, 'Very dangerious name', true, false, 5);
INSERT INTO public.star VALUES (6, 'Leo', 566, 'I wanna touch a star', true, false, 6);
INSERT INTO public.star VALUES (7, 'Lyra', 878, 'This is the last star', false, true, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

