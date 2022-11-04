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

DROP DATABASE guessing_game;
--
-- Name: guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guessing_game OWNER TO freecodecamp;

\connect guessing_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    attempt integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 862, 1);
INSERT INTO public.games VALUES (2, 308, 1);
INSERT INTO public.games VALUES (3, 463, 2);
INSERT INTO public.games VALUES (4, 252, 2);
INSERT INTO public.games VALUES (5, 734, 1);
INSERT INTO public.games VALUES (6, 247, 1);
INSERT INTO public.games VALUES (7, 905, 1);
INSERT INTO public.games VALUES (8, 871, 19);
INSERT INTO public.games VALUES (9, 24, 19);
INSERT INTO public.games VALUES (10, 965, 20);
INSERT INTO public.games VALUES (11, 736, 20);
INSERT INTO public.games VALUES (12, 528, 19);
INSERT INTO public.games VALUES (13, 409, 19);
INSERT INTO public.games VALUES (14, 417, 19);
INSERT INTO public.games VALUES (15, 62, 21);
INSERT INTO public.games VALUES (16, 342, 21);
INSERT INTO public.games VALUES (17, 537, 22);
INSERT INTO public.games VALUES (18, 917, 22);
INSERT INTO public.games VALUES (19, 719, 21);
INSERT INTO public.games VALUES (20, 795, 21);
INSERT INTO public.games VALUES (21, 619, 21);
INSERT INTO public.games VALUES (22, 136, 23);
INSERT INTO public.games VALUES (23, 546, 23);
INSERT INTO public.games VALUES (24, 352, 24);
INSERT INTO public.games VALUES (25, 489, 24);
INSERT INTO public.games VALUES (26, 471, 23);
INSERT INTO public.games VALUES (27, 497, 23);
INSERT INTO public.games VALUES (28, 209, 23);
INSERT INTO public.games VALUES (29, 393, 25);
INSERT INTO public.games VALUES (30, 976, 25);
INSERT INTO public.games VALUES (31, 482, 26);
INSERT INTO public.games VALUES (32, 737, 26);
INSERT INTO public.games VALUES (33, 373, 25);
INSERT INTO public.games VALUES (34, 20, 25);
INSERT INTO public.games VALUES (35, 891, 25);
INSERT INTO public.games VALUES (36, 94, 27);
INSERT INTO public.games VALUES (37, 457, 27);
INSERT INTO public.games VALUES (38, 518, 28);
INSERT INTO public.games VALUES (39, 493, 28);
INSERT INTO public.games VALUES (40, 341, 27);
INSERT INTO public.games VALUES (41, 723, 27);
INSERT INTO public.games VALUES (42, 541, 27);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1667564768513');
INSERT INTO public.users VALUES (2, 'user_1667564768512');
INSERT INTO public.users VALUES (3, 'user_1667564787949');
INSERT INTO public.users VALUES (4, 'user_1667564787948');
INSERT INTO public.users VALUES (5, 'user_1667564797801');
INSERT INTO public.users VALUES (6, 'user_1667564797800');
INSERT INTO public.users VALUES (7, 'user_1667564913986');
INSERT INTO public.users VALUES (8, 'user_1667564913985');
INSERT INTO public.users VALUES (9, 'user_1667564977257');
INSERT INTO public.users VALUES (10, 'user_1667564977256');
INSERT INTO public.users VALUES (11, 'user_1667565059418');
INSERT INTO public.users VALUES (12, 'user_1667565059417');
INSERT INTO public.users VALUES (13, 'user_1667565219694');
INSERT INTO public.users VALUES (14, 'user_1667565219693');
INSERT INTO public.users VALUES (15, 'user_1667565303461');
INSERT INTO public.users VALUES (16, 'user_1667565303460');
INSERT INTO public.users VALUES (17, 'user_1667565322710');
INSERT INTO public.users VALUES (18, 'user_1667565322709');
INSERT INTO public.users VALUES (19, 'user_1667565376803');
INSERT INTO public.users VALUES (20, 'user_1667565376802');
INSERT INTO public.users VALUES (21, 'user_1667565404856');
INSERT INTO public.users VALUES (22, 'user_1667565404855');
INSERT INTO public.users VALUES (23, 'user_1667565509055');
INSERT INTO public.users VALUES (24, 'user_1667565509054');
INSERT INTO public.users VALUES (25, 'user_1667565516754');
INSERT INTO public.users VALUES (26, 'user_1667565516753');
INSERT INTO public.users VALUES (27, 'user_1667565524771');
INSERT INTO public.users VALUES (28, 'user_1667565524770');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

