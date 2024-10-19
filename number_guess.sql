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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    games_played integer,
    best_guess integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('Kyle', 7, 1);
INSERT INTO public.players VALUES ('user_1729362293343', 2, 296);
INSERT INTO public.players VALUES ('user_1729362293344', 5, 467);
INSERT INTO public.players VALUES ('user_1729362818698', 2, 50);
INSERT INTO public.players VALUES ('user_1729362302562', 2, 680);
INSERT INTO public.players VALUES ('user_1729362818699', 5, 176);
INSERT INTO public.players VALUES ('user_1729362302563', 5, 210);
INSERT INTO public.players VALUES ('user_1729362305130', 2, 532);
INSERT INTO public.players VALUES ('user_1729362305131', 5, 164);
INSERT INTO public.players VALUES ('user_1729362839605', 2, 250);
INSERT INTO public.players VALUES ('user_1729362307777', 2, 134);
INSERT INTO public.players VALUES ('user_1729362839606', 5, 265);
INSERT INTO public.players VALUES ('user_1729362307778', 5, 176);
INSERT INTO public.players VALUES ('user_1729362311244', 2, 68);
INSERT INTO public.players VALUES ('user_1729362311245', 5, 109);
INSERT INTO public.players VALUES ('user_1729362315468', 2, 481);
INSERT INTO public.players VALUES ('user_1729362315469', 5, 648);
INSERT INTO public.players VALUES ('Lyle', 4, 1);
INSERT INTO public.players VALUES ('user_1729362718317', 2, 383);
INSERT INTO public.players VALUES ('user_1729362718318', 5, 409);
INSERT INTO public.players VALUES ('user_1729362735259', 2, 824);
INSERT INTO public.players VALUES ('user_1729362735260', 5, 111);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

