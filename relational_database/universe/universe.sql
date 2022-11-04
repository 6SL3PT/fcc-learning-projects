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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    num_of_moons integer NOT NULL,
    surface_temp_in_celsius numeric(7,2),
    water_resource boolean
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(10),
    age_in_billion numeric(4,2),
    diameter_in_light_year integer,
    distance_in_light_year integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    avg_surface_temp_in_celsius numeric(7,2),
    avg_radius_in_km numeric(7,2)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    num_of_moons integer NOT NULL,
    surface_temp_in_celsius numeric(7,2),
    detail text,
    trace_of_water boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    star_stage character varying(20) NOT NULL,
    surface_temp_in_celsius numeric(7,2) NOT NULL,
    num_of_planets integer
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 1, 5, -232.78, true);
INSERT INTO public.dwarf_planet VALUES (2, 'Ceres', 1, 0, -38.00, true);
INSERT INTO public.dwarf_planet VALUES (3, 'Europa', 1, 0, -190.00, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.61, 100000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.01, 220000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'LMC', 'Spiral', 1.10, 14000, 158200);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Irregular', 13.30, 37000, 11420000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13.25, 50000, 29350000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 0.40, 60000, 23160000);
INSERT INTO public.galaxy VALUES (7, 'Tadpole', 'Spiral', 0.10, 390000, 420000000);
INSERT INTO public.galaxy VALUES (8, 'Hoag', 'Irregular', 0.13, 121000, 612800000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 4, -40.15, 11.27);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, -40.15, 6.20);
INSERT INTO public.moon VALUES (1, 'Moon', 3, -38.50, 1737.40);
INSERT INTO public.moon VALUES (4, 'Io', 5, -130.00, 1821.60);
INSERT INTO public.moon VALUES (5, 'Europa', 5, -143.15, 1560.80);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, -148.15, 2634.10);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, -139.20, 2410.30);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 142.50, 83.50);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, -149.15, 69.80);
INSERT INTO public.moon VALUES (10, 'Elara', 5, -149.15, 39.95);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, -188.65, 198.20);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, -201.00, 252.10);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, -187.00, 531.10);
INSERT INTO public.moon VALUES (14, 'Dione', 6, -186.00, 561.40);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, -197.00, 763.80);
INSERT INTO public.moon VALUES (16, 'Titan', 6, -148.06, 2574.73);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, -201.15, 578.90);
INSERT INTO public.moon VALUES (18, 'Titania', 7, -203.00, 788.40);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, -198.15, 761.40);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, -187.15, 235.80);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, 178.89, 'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun''s planets. It is named after the Roman god Mercurius (Mercury), god of commerce, messenger of the gods, and mediator between gods and mortals, corresponding to the Greek god Hermes', true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, 452.78, 'Venus is the second planet from the Sun. It is sometimes called Earth''s twin planet as it is almost as large and has a similar composition. As an interior planet to Earth, Venus (like Mercury) appears in Earth''s sky never far from the Sun, either as morning star or evening star.', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 13.90, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water. About 71% of Earth''s surface is made up of the ocean, dwarfing Earth''s polar ice, lakes, and rivers. The remaining 29% of Earth''s surface is land, consisting of continents and islands.', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, -62.78, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In the English language, Mars is named for the Roman god of war. Mars is a terrestrial planet with a thin atmosphere (less than 1% that of Earth''s), and has a crust primarily composed of elements similar to Earth''s crust, as well as a core made of iron and nickel.', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 80, -150.00, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, but slightly less than one-thousandth the mass of the Sun. Jupiter is the third brightest natural object in the Earth''s night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after the Roman god Jupiter, the king of the gods.', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 83, -176.11, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth. It has only one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, -213.89, 'Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus (Caelus), who, according to Greek mythology, was the great-grandfather of Ares (Mars), grandfather of Zeus (Jupiter) and father of Cronus (Saturn). It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 14, -225.00, 'Neptune is the eighth planet from the Sun and the farthest known solar planet. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere.', true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 2, 0, -57.15, 'Proxima Centauri b, or Alpha Centauri Cb, orbits the star at a distance of roughly 0.05 AU (7.5 million km) with an orbital period of approximately 11.2 Earth days. Its estimated mass is at least 1.17 times that of the Earth.', true);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 2, 0, -234.20, 'Proxima Centauri c is a controversial exoplanet candidate claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system. It is located approximately 4.2 light-years (1.3 parsecs; 40 trillion kilometres; 25 trillion miles) from Earth in the constellation of Centaurus, making it, Proxima b, and Proxima d the closest known exoplanets to the Solar System.', false);
INSERT INTO public.planet VALUES (13, 'Luyten b', 3, 0, 19.00, 'Luyten b (more commonly known as Gliese 273b) is a confirmed exoplanet, likely rocky, orbiting within the habitable zone of the nearby red dwarf Luyten''s Star. It is one of the most Earth-like planets ever found and is the fourth-closest potentially habitable exoplanet known, at a distance of 12 light-years. Only Proxima Centauri b, Ross 128 b, and Gliese 1061 d are closer.', true);
INSERT INTO public.planet VALUES (14, 'Tau Ceti b (Penthus)', 6, 0, 516.00, 'Penthus (Tau Ceti b, P846) is the innermost exoplanet in orbit around Tau Ceti, a star just 12 light-years away. It is the innermost of the five planets discovered on December 19, 2012. It is a rocky planet twice the mass of Earth orbiting 10 times closer to its star than where Earth orbits the star.', false);
INSERT INTO public.planet VALUES (15, 'Tau Ceti c (Zeus)', 6, 0, 382.00, 'Zeus (Tau Ceti c, P847) is the second exoplanet in orbit around Tau Ceti, a star just 12 light-years away. It is one of the five planets discovered on December 19, 2012. It is a rocky planet 1.5 times the size of Earth orbiting five times closer to its star than where Earth orbits the star.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 5504.85, 8);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red Dwarf', 2768.85, 3);
INSERT INTO public.star VALUES (3, 'Luyten''s Star', 1, 'Red Dwarf', 2876.85, 2);
INSERT INTO public.star VALUES (4, 'YZ Ceti', 1, 'Red Dwarf', 2782.85, 3);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 1, 'Red Dwarf', 3554.85, 2);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 1, 'Yellow Dwarf', 5070.85, 4);


--
-- Name: dwarf_planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_planet_id_seq', 34, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

