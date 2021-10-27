--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

-- Started on 2021-10-27 13:58:53 CEST

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
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 299995)
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 300031)
-- Name: mapea_control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_control (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    constructor character varying(100) NOT NULL
);


ALTER TABLE public.mapea_control OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 300038)
-- Name: mapea_control_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_control_config (
    id integer NOT NULL,
    description character varying(100) NOT NULL,
    config character varying(255) NOT NULL,
    mapea_control_id integer NOT NULL
);


ALTER TABLE public.mapea_control_config OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 300036)
-- Name: mapea_control_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_control_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_control_config_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 300029)
-- Name: mapea_control_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_control_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_control_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 299999)
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
-- TOC entry 204 (class 1259 OID 300005)
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
-- TOC entry 205 (class 1259 OID 300007)
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
-- TOC entry 206 (class 1259 OID 300013)
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
-- TOC entry 3036 (class 0 OID 299995)
-- Dependencies: 202
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211026070059	2021-10-26 09:01:12	122
DoctrineMigrations\\Version20211026072152	2021-10-26 09:22:05	15
DoctrineMigrations\\Version20211026092025	2021-10-26 11:20:38	140
DoctrineMigrations\\Version20211027093120	2021-10-27 11:31:29	26
DoctrineMigrations\\Version20211027100201	2021-10-27 12:02:14	20
DoctrineMigrations\\Version20211027100832	2021-10-27 12:08:40	19
DoctrineMigrations\\Version20211027102011	2021-10-27 12:20:22	25
DoctrineMigrations\\Version20211027102612	2021-10-27 12:26:21	19
\.


--
-- TOC entry 3042 (class 0 OID 300031)
-- Dependencies: 208
-- Data for Name: mapea_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_control (id, name, constructor) FROM stdin;
1	Panzoombar	new M.control.Panzoombar()
2	LayerSwitcher	new M.control.LayerSwitcher()
3	OverviewMap	new M.control.OverviewMap()
4	Scale	new M.control.Scale()
5	ScaleLine	new M.control.ScaleLine()
6	Mouse	new M.control.Mouse()
7	Location	new M.control.Location()
8	GetFeatureInfo	new M.control.GetFeatureInfo()
9	rotate	new M.control.rotate()
\.


--
-- TOC entry 3044 (class 0 OID 300038)
-- Dependencies: 210
-- Data for Name: mapea_control_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_control_config (id, description, config, mapea_control_id) FROM stdin;
2	EPSG 4326	{srs: 'EPSG:4326', label: 'EPSG:4326',precision: 2}	6
1	html buffer 32px	'html', {buffer: 32}	8
3	EPSG 25830	{srs: 'EPSG:25830', label: 'EPSG:25830',precision: 2}	6
\.


--
-- TOC entry 3037 (class 0 OID 299999)
-- Dependencies: 203
-- Data for Name: mapea_core; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_core (id, javascript, styles, configuration) FROM stdin;
1	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.js	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.css	https://mapea4-sigc.juntadeandalucia.es/js/configuration-6.0.0.js
\.


--
-- TOC entry 3039 (class 0 OID 300007)
-- Dependencies: 205
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, username) FROM stdin;
14	user@user.a	["ROLE_USER","ROLE_EDITOR"]	$2y$13$KvR39KDsAYI0jtXg7rKUluAoUnk2VP.EH2Yx0Qxr7XAdoC2KdqTX.	user
0	emilioj.pardo@juntadeandalucia.es	{"1":"ROLE_USER","2":"ROLE_SUPER_ADMIN"}	$2y$13$zEDeb1vNPTHlt4bc1wSt.usRs3vtwCliUTezUzAGqHgGhw/3.gsEm	admin
\.


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 209
-- Name: mapea_control_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_config_id_seq', 3, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 207
-- Name: mapea_control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_id_seq', 9, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 204
-- Name: mapea_core_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_core_id_seq', 1, true);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 14, true);


--
-- TOC entry 2898 (class 2606 OID 300016)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2908 (class 2606 OID 300042)
-- Name: mapea_control_config mapea_control_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT mapea_control_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 300035)
-- Name: mapea_control mapea_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control
    ADD CONSTRAINT mapea_control_pkey PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 300018)
-- Name: mapea_core mapea_core_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_core
    ADD CONSTRAINT mapea_core_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 300020)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 1259 OID 300048)
-- Name: idx_39a5e17157436675; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_39a5e17157436675 ON public.mapea_control_config USING btree (mapea_control_id);


--
-- TOC entry 2901 (class 1259 OID 300021)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 2909 (class 2606 OID 300043)
-- Name: mapea_control_config fk_39a5e17157436675; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT fk_39a5e17157436675 FOREIGN KEY (mapea_control_id) REFERENCES public.mapea_control(id);


-- Completed on 2021-10-27 13:58:53 CEST

--
-- PostgreSQL database dump complete
--

