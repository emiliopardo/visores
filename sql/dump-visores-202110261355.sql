--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

-- Started on 2021-10-26 13:55:13 CEST

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 373478)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 373497)
-- Name: mapea_core; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_core (
    id integer NOT NULL,
    javascript character varying(255) NOT NULL,
    styles character varying(255) NOT NULL,
    configuration character varying(255) NOT NULL
);


ALTER TABLE public.mapea_core OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 373495)
-- Name: mapea_core_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_core_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_core_id_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 373486)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    username character varying(25) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 373484)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3018 (class 0 OID 373478)
-- Dependencies: 202
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211026070059	2021-10-26 09:01:12	122
DoctrineMigrations\\Version20211026072152	2021-10-26 09:22:05	15
DoctrineMigrations\\Version20211026092025	2021-10-26 11:20:38	140
\.


--
-- TOC entry 3022 (class 0 OID 373497)
-- Dependencies: 206
-- Data for Name: mapea_core; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_core (id, javascript, styles, configuration) FROM stdin;
1	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.js	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.css	https://mapea4-sigc.juntadeandalucia.es/js/configuration-6.0.0.js
\.


--
-- TOC entry 3020 (class 0 OID 373486)
-- Dependencies: 204
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, username) FROM stdin;
0	emilioj.pardo@juntadeandalucia.es	["ROLE_ADMIN"]	$2y$13$UqW5.3/v6suXtJcWQMoH9OXcHOq5nhxMEMdI4YOpgcq1MWSH5RLue	admin
\.


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 205
-- Name: mapea_core_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_core_id_seq', 1, true);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 2886 (class 2606 OID 373483)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2891 (class 2606 OID 373504)
-- Name: mapea_core mapea_core_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_core
    ADD CONSTRAINT mapea_core_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 373493)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 1259 OID 373494)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


-- Completed on 2021-10-26 13:55:13 CEST

--
-- PostgreSQL database dump complete
--

