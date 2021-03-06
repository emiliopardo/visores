--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

-- Started on 2021-10-28 12:48:30 CEST

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
-- TOC entry 3086 (class 0 OID 0)
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
-- TOC entry 216 (class 1259 OID 300094)
-- Name: legend; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legend (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255) NOT NULL,
    image_size integer NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.legend OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 300092)
-- Name: legend_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legend_id_seq OWNER TO postgres;

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
    mapea_control_id integer NOT NULL,
    name character varying(100)
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
-- TOC entry 212 (class 1259 OID 300051)
-- Name: mapea_plugin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_plugin (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    javascript character varying(255) NOT NULL,
    styles character varying(255) NOT NULL,
    constructor character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.mapea_plugin OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 300077)
-- Name: mapea_plugin_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_plugin_config (
    id integer NOT NULL,
    mapea_plugin_id integer NOT NULL,
    description character varying(255) NOT NULL,
    config text NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.mapea_plugin_config OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN mapea_plugin_config.config; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.mapea_plugin_config.config IS '(DC2Type:object)';


--
-- TOC entry 213 (class 1259 OID 300075)
-- Name: mapea_plugin_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_plugin_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_plugin_config_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 300049)
-- Name: mapea_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_plugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_plugin_id_seq OWNER TO postgres;

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
-- TOC entry 3066 (class 0 OID 299995)
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
DoctrineMigrations\\Version20211027120120	2021-10-27 14:01:28	25
DoctrineMigrations\\Version20211028065243	2021-10-28 08:52:58	29
DoctrineMigrations\\Version20211028072131	2021-10-28 09:21:40	15
DoctrineMigrations\\Version20211028081522	2021-10-28 10:15:32	14
DoctrineMigrations\\Version20211028081817	2021-10-28 10:18:27	28
DoctrineMigrations\\Version20211028082012	2021-10-28 10:20:17	16
DoctrineMigrations\\Version20211028082315	2021-10-28 10:25:18	19
DoctrineMigrations\\Version20211028082658	2021-10-28 10:27:03	29
DoctrineMigrations\\Version20211028083835	2021-10-28 10:38:44	16
DoctrineMigrations\\Version20211028092515	2021-10-28 11:25:19	29
DoctrineMigrations\\Version20211028100743	2021-10-28 12:07:52	28
DoctrineMigrations\\Version20211028101346	2021-10-28 12:13:51	18
\.


--
-- TOC entry 3080 (class 0 OID 300094)
-- Dependencies: 216
-- Data for Name: legend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legend (id, name, description, image_name, image_size, updated_at) FROM stdin;
1	CDAU	Leyenda para CDAU	cdau_base.png	30621	2021-10-28 12:33:35
2	orto_color	Leyenda ortofotograf??a a color	ortofoto2016_color.png	54949	2021-10-28 12:42:57
3	ortofoto_pancromatico	leyenda ortofotograf??a en escala de grises	ortofoto2016_pancromatico.png	34761	2021-10-28 12:45:13
\.


--
-- TOC entry 3072 (class 0 OID 300031)
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
-- TOC entry 3074 (class 0 OID 300038)
-- Dependencies: 210
-- Data for Name: mapea_control_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_control_config (id, description, config, mapea_control_id, name) FROM stdin;
2	Coordenadas en EPSG:4326	{srs: 'EPSG:4326', label: 'EPSG:4326',precision: 2}	6	epsg_4326
3	Coordenadas en EPSG:25830	{srs: 'EPSG:25830', label: 'EPSG:25830',precision: 2}	6	epsg_25830
1	Formato html con buffer de 32 pixeles	'html', {buffer: 32}	8	html_buffer_32px
\.


--
-- TOC entry 3067 (class 0 OID 299999)
-- Dependencies: 203
-- Data for Name: mapea_core; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_core (id, javascript, styles, configuration) FROM stdin;
1	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.js	https://mapea4-sigc.juntadeandalucia.es/assets/css/mapea-6.0.0.ol.min.css	https://mapea4-sigc.juntadeandalucia.es/js/configuration-6.0.0.js
\.


--
-- TOC entry 3076 (class 0 OID 300051)
-- Dependencies: 212
-- Data for Name: mapea_plugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_plugin (id, name, javascript, styles, constructor) FROM stdin;
1	InputSelectAddLayer	https://emiliopardo.github.io/inputselectaddlayer/inputselectaddlayer.ol.min.js	https://emiliopardo.github.io/inputselectaddlayer/inputselectaddlayer.ol.min.css	new M.plugin.Inputselectaddlayer();
5	mapheader	https://emiliopardo.github.io/mapheader/mapheader.ol.min.js	https://emiliopardo.github.io/mapheader/mapheader.ol.min.css	M.plugin.Mapheader();
4	mapfooter	https://emiliopardo.github.io/mapfooter/mapfooter.ol.min.js	https://emiliopardo.github.io/mapfooter/mapfooter.ol.min.css	M.plugin.Mapfooter();
3	simplelegend	https://emiliopardo.github.io/simplelegend/simplelegend.ol.min.js	https://emiliopardo.github.io/simplelegend/simplelegend.ol.min.css	new M.plugin.Simplelegend()
2	simplebaselayerselector	https://emiliopardo.github.io/simplebaselayerselector/simplebaselayerselector.ol.min.js	https://emiliopardo.github.io/simplebaselayerselector/simplebaselayerselector.ol.min.css	new M.plugin.Simplebaselayerselector();
\.


--
-- TOC entry 3078 (class 0 OID 300077)
-- Dependencies: 214
-- Data for Name: mapea_plugin_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_plugin_config (id, mapea_plugin_id, description, config, name) FROM stdin;
1	5	Configuraci??n dise??o ieca	s:3135:"{\r\n            open: true,\r\n            htmlCode: '<div id="cabecera"> <div id="cabecera_1"> <div id="logos"> <a href="https://www.juntadeandalucia.es"><img alt="Junta de Andaluc??a" title="Junta de Andaluc??a" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/cabecera/LogoJuntaA.png"></a> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/" accesskey="h"><img alt="Web del Instituto de Estad??stica y Cartograf??a de Andaluc??a" title="Web del Instituto de Estad??stica y Cartograf??a de Andaluc??a" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/cabecera/LogoIECAA.png"></a> </div></div><div id="cabecera_2"> <div id="cabecera_2a"> <div id="redessociales"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/blog/"><img alt="S??guenos en nuestro blog" title="S??guenos en nuestro blog" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_blogger.png"></a> <a href="https://www.twitter.com/IECA_Andalucia"><img alt="S??guenos en Twitter" title="S??guenos en Twitter" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_twitter.png"></a> <a href="https://www.facebook.com/institutodeestadisticadeandalucia"><img alt="S??guenos en Facebook" title="S??guenos en Facebook" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_facebook.png"></a> </div></div><div id="cabecera_2b"> <div id="cabecera_2b_menu" class="lateral10 bordecolor2"> <ul> <li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/contacto.html" accesskey="c">Contacto</a></li><li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/suscripcion/index.htm" accesskey="s">Suscripci??n</a></li><li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/calendario/index.htm" accesskey="d">Calendario</a></li><li>&nbsp;</li></ul> </div></div></div></div><div id="navigation"> <div class="lineacolor fondocolor1">&nbsp;</div><div id="menu_horizontal"> <div id="menu_horizontal_1"> <div id="caminomigas"> <img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/acciones/ico_aqui.png" alt="Ruta">Est?? en: <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/">Inicio</a> - <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/temas/index-geo.htm">Georreferenciaci??n</a> - <a href="../index.htm">P??gina del producto</a> </div></div><div id="menu_horizontal_2"> <div id="botoneramenu"> </div></div></div></div></div>',\r\n            cssList: [\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloCabecera2015.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloGenerico.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloVisor.css',\r\n            ]\r\n        }";	MapHeader IECA
3	2	BaseLayers no se muestran en layerSwitcher	s:43:"{ displayBaseLayersInLayerSwitcher: false }";	LayerSwitcher_off
2	5	Configuraci??n dise??o ieca	s:4039:"{\r\n            open: true,\r\n            htmlCode: '<div id="social"  title="Compartir"> <ul> <li class="no_imprimir"><a id="btnCompartir" href="#"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/compartir24g.png" border="0" alt="Compartir">&nbsp;<span>Compartir</span></a> <ul id="soc_compartir"> <li><a href="https://www.facebook.com/sharer.php?u=' + window.location.href + '&amp;t=+Visualizador+IECA&amp;d=" title="Compartir en Facebook" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_facebook.png" border="0" alt="Compartir en Facebook">&nbsp;<span>Facebook</span></a></li><li><a href="https://twitter.com/home?status=Visualizador-' + window.location.href + '%20v%C3%ADa%20@IECA_Andalucia" title="Compartir en Twitter" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_twitter.png" border="0" alt="Compartir en Twitter">&nbsp;<span>Twitter</span></a></li><li><a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=' + window.location.href + '&amp;title=+Visualizador+IECA" title="Compartir en LinkedIn" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_linkedin.png" border="0" alt="Compartir en LinkedIn">&nbsp;<span>LinkedIn</span></a></li><li><a href="mailto:?subject=Compartiendo%20por%20correo%20electr%C3%B3nico&amp;body=%20Visualizador:%0D%0A' + window.location.href + '" title="Compartir por correo electr&oacute;nico" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_mail.png" border="0" alt="Compartir por correo electr&oacute;nico">&nbsp;<span>e-mail</span></a></li></ul> </li></ul> </div><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/Logo_UE_FEDER.gif" class="feder" alt="Fondos"><div id="footer"> <div id="piea"> <div class="lineacolor fondocolor1">&nbsp;</div><div>&nbsp;</div><div> <div id="piea1"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/mapaWeb/index.htm" class="enlaces" accesskey="m">Mapa web</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/avisoLegal/index.htm" class="enlaces" accesskey="l">Aviso legal</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/protecciondedatos/index.html" class="enlaces" accesskey="p">Protecci&oacute;n de datos</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/buzon_web/index.jsp" class="enlaces" accesskey="o">Tu opini&oacute;n</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/accesibilidad/index.htm" class="enlaces" accesskey="a">Accesibilidad</a> <img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/images/w3caa.jpg" alt="Logo de w3c" id="logow3caa"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/avisoLegal/index.htm#cc" class="enlaceimg"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/images/cc-by.png" title="Publicado bajo Licencia Creative Commons - Reconocimiento 4.0" alt="CC-BY 4.0" id="logoccby"></a> </div><div id="piea2"> Pabell&oacute;n de Nueva Zelanda. <br>C/ Leonardo Da Vinci, n&deg; 21. Isla de La Cartuja. 41071-SEVILLA.<br>Tlf.: <strong>900 101 407/955 033 800</strong> | Fax: <strong>955 033 816</strong><br></div></div></div></div>',\r\n            cssList: [\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloCabecera2015.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloGenerico.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloVisor.css',\r\n            ]\r\n        }";	MapFooter IECA
\.


--
-- TOC entry 3069 (class 0 OID 300007)
-- Dependencies: 205
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, username) FROM stdin;
14	user@user.a	["ROLE_USER","ROLE_EDITOR"]	$2y$13$KvR39KDsAYI0jtXg7rKUluAoUnk2VP.EH2Yx0Qxr7XAdoC2KdqTX.	user
0	emilioj.pardo@juntadeandalucia.es	{"1":"ROLE_USER","2":"ROLE_SUPER_ADMIN"}	$2y$13$zEDeb1vNPTHlt4bc1wSt.usRs3vtwCliUTezUzAGqHgGhw/3.gsEm	admin
\.


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 215
-- Name: legend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legend_id_seq', 3, true);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 209
-- Name: mapea_control_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_config_id_seq', 3, true);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 207
-- Name: mapea_control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_id_seq', 9, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 204
-- Name: mapea_core_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_core_id_seq', 1, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 213
-- Name: mapea_plugin_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_plugin_config_id_seq', 3, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 211
-- Name: mapea_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_plugin_id_seq', 5, true);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 14, true);


--
-- TOC entry 2920 (class 2606 OID 300016)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2937 (class 2606 OID 300101)
-- Name: legend legend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend
    ADD CONSTRAINT legend_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 300042)
-- Name: mapea_control_config mapea_control_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT mapea_control_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 300035)
-- Name: mapea_control mapea_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control
    ADD CONSTRAINT mapea_control_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 300018)
-- Name: mapea_core mapea_core_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_core
    ADD CONSTRAINT mapea_core_pkey PRIMARY KEY (id);


--
-- TOC entry 2935 (class 2606 OID 300084)
-- Name: mapea_plugin_config mapea_plugin_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin_config
    ADD CONSTRAINT mapea_plugin_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 300058)
-- Name: mapea_plugin mapea_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin
    ADD CONSTRAINT mapea_plugin_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 300020)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 1259 OID 300048)
-- Name: idx_39a5e17157436675; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_39a5e17157436675 ON public.mapea_control_config USING btree (mapea_control_id);


--
-- TOC entry 2933 (class 1259 OID 300085)
-- Name: idx_8d56ec1da1ec9697; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8d56ec1da1ec9697 ON public.mapea_plugin_config USING btree (mapea_plugin_id);


--
-- TOC entry 2923 (class 1259 OID 300021)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 2938 (class 2606 OID 300043)
-- Name: mapea_control_config fk_39a5e17157436675; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT fk_39a5e17157436675 FOREIGN KEY (mapea_control_id) REFERENCES public.mapea_control(id);


--
-- TOC entry 2939 (class 2606 OID 300086)
-- Name: mapea_plugin_config fk_8d56ec1da1ec9697; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin_config
    ADD CONSTRAINT fk_8d56ec1da1ec9697 FOREIGN KEY (mapea_plugin_id) REFERENCES public.mapea_plugin(id);


-- Completed on 2021-10-28 12:48:30 CEST

--
-- PostgreSQL database dump complete
--

