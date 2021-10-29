--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

-- Started on 2021-10-29 09:29:57 CEST

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
-- TOC entry 3125 (class 0 OID 0)
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
-- TOC entry 218 (class 1259 OID 300104)
-- Name: icon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icon (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255) NOT NULL,
    image_size integer NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.icon OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 300102)
-- Name: icon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icon_id_seq OWNER TO postgres;

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
-- TOC entry 222 (class 1259 OID 300134)
-- Name: mapea_layer_geojson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_layer_geojson (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    layer_name character varying(100) NOT NULL,
    layer_url character varying(255) NOT NULL,
    "extract" boolean NOT NULL,
    layer_style text DEFAULT '0'::text NOT NULL
);


ALTER TABLE public.mapea_layer_geojson OWNER TO postgres;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN mapea_layer_geojson.layer_style; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.mapea_layer_geojson.layer_style IS '(DC2Type:object)';


--
-- TOC entry 221 (class 1259 OID 300132)
-- Name: mapea_layer_geojson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_layer_geojson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_layer_geojson_id_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 300115)
-- Name: mapea_layer_wms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapea_layer_wms (
    id integer NOT NULL,
    layer_legend_image_id integer,
    name character varying(100) NOT NULL,
    description character varying(255) NOT NULL,
    layer_name character varying(100) NOT NULL,
    layer_legend character varying(255) NOT NULL,
    layer_url character varying(255) NOT NULL,
    layer_transparent boolean DEFAULT false NOT NULL,
    layer_tiled boolean DEFAULT false NOT NULL,
    layer_style character varying(255) DEFAULT 'default'::character varying NOT NULL
);


ALTER TABLE public.mapea_layer_wms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 300113)
-- Name: mapea_layer_wms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapea_layer_wms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapea_layer_wms_id_seq OWNER TO postgres;

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
-- TOC entry 3127 (class 0 OID 0)
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
-- TOC entry 3099 (class 0 OID 299995)
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
DoctrineMigrations\\Version20211028110733	2021-10-28 13:07:44	20
DoctrineMigrations\\Version20211028114822	2021-10-28 13:48:31	31
DoctrineMigrations\\Version20211028115953	2021-10-28 13:59:58	18
DoctrineMigrations\\Version20211029071120	2021-10-29 09:11:33	43
\.


--
-- TOC entry 3115 (class 0 OID 300104)
-- Dependencies: 218
-- Data for Name: icon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.icon (id, name, description, image_name, image_size, updated_at) FROM stdin;
1	Buzones	Icono de buzones Junta Andalucía	buzones.svg	7526	2021-10-28 13:12:46
2	registros	Icono de registros Junta Andalucía	registros.svg	36414	2021-10-28 13:14:55
\.


--
-- TOC entry 3113 (class 0 OID 300094)
-- Dependencies: 216
-- Data for Name: legend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legend (id, name, description, image_name, image_size, updated_at) FROM stdin;
1	CDAU	Leyenda para CDAU	cdau_base.png	30621	2021-10-28 12:33:35
2	orto_color	Leyenda ortofotografía a color	ortofoto2016_color.png	54949	2021-10-28 12:42:57
3	ortofoto_pancromatico	leyenda ortofotografía en escala de grises	ortofoto2016_pancromatico.png	34761	2021-10-28 12:45:13
4	mdt	Leyenda modelo digital del terreno a color	mdt_2016_tintas_hipsometricas.png	41626	2021-10-28 12:49:42
5	siose	Leyenda SIOSE	siose_2013.png	54460	2021-10-28 12:50:51
6	ortofoto_infrarrojo	ortofoto infrarrojo	ortofoto2016_infrarrojo.png	57495	2021-10-29 08:49:11
\.


--
-- TOC entry 3105 (class 0 OID 300031)
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
-- TOC entry 3107 (class 0 OID 300038)
-- Dependencies: 210
-- Data for Name: mapea_control_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_control_config (id, description, config, mapea_control_id, name) FROM stdin;
2	Coordenadas en EPSG:4326	{srs: 'EPSG:4326', label: 'EPSG:4326',precision: 2}	6	epsg_4326
3	Coordenadas en EPSG:25830	{srs: 'EPSG:25830', label: 'EPSG:25830',precision: 2}	6	epsg_25830
1	Formato html con buffer de 32 pixeles	'html', {buffer: 32}	8	html_buffer_32px
\.


--
-- TOC entry 3100 (class 0 OID 299999)
-- Dependencies: 203
-- Data for Name: mapea_core; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_core (id, javascript, styles, configuration) FROM stdin;
1	https://mapea4-sigc.juntadeandalucia.es/js/mapea-6.0.0.ol.min.js	https://mapea4-sigc.juntadeandalucia.es/assets/css/mapea-6.0.0.ol.min.css	https://mapea4-sigc.juntadeandalucia.es/js/configuration-6.0.0.js
\.


--
-- TOC entry 3119 (class 0 OID 300134)
-- Dependencies: 222
-- Data for Name: mapea_layer_geojson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_layer_geojson (id, name, description, layer_name, layer_url, "extract", layer_style) FROM stdin;
3	organizacionInstitucional	organización institutcional Junta de Andalucía	organizacionInstitucional	https://www.ideandalucia.es/services/ise/wfs?service=WFS&version=1.0.0&request=GetFeature&typename=ise:Organizacion_institucional&outputFormat=application/json&srsname=EPSG:25830&propertyName=Nombre,Direccion,Telefono,Fax,Correo_electronico,web,Foto,geom	f	s:3360:"//Asignación de Iconos\r\n\r\nconst camaraCuentas = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo9.svg'\r\n    }\r\n});\r\n\r\nconst consejoAudioVisual = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo10.svg'\r\n    }\r\n});\r\nconst consejoConsultivo = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo13.svg'\r\n    }\r\n});\r\n\r\nconst consejoTransparecia = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo14.svg'\r\n    }\r\n});\r\n\r\nconst consejoEconomico = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo11.svg'\r\n    }\r\n});\r\n\r\nconst defensorPueblo = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo12.svg'\r\n    }\r\n});\r\n\r\nconst parlamentoAndalucia = new M.style.Point({\r\n    icon: {\r\n        src: 'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/mapa_equipamientos/geolocalizacion/iconos/Sedes/svg/logo5.svg'\r\n    }\r\n});\r\n\r\n//Simbología categorizada\r\n\r\nconst categoriaOrganizacionInstitucional = new M.style.Category("Nombre", {\r\n    "Cámara de Cuentas de Andalucía": camaraCuentas,\r\n    "Consejo Audiovisual de Andalucía": consejoAudioVisual,\r\n    "Consejo Consultivo de Andalucía": consejoConsultivo,\r\n    "Consejo de Transparencia y Protección de Datos de Andalucía": consejoTransparecia,\r\n    "Consejo Ecnómico y Social de Andalucía": consejoEconomico,\r\n    "Defensor del Pueblo Andaluz": defensorPueblo,\r\n    "Parlamento de Andalucía": parlamentoAndalucia\r\n});\r\n\r\n\r\n//Parámetros Opcionales Cluster\r\n    const vendorParameters = {\r\n    distanceSelectFeatures: 25,\r\n    convexHullStyle: {\r\n        fill: {\r\n            color: '#0000FF',\r\n            opacity: 1\r\n        },\r\n        stroke: {\r\n            color: '#0000FF',\r\n            width: 1\r\n        }\r\n    }\r\n}\r\n\r\nconst clusterOptionsOrganizacionInstitucional = {\r\n    ranges: [{\r\n        min: 2,\r\n        max: 100,\r\n        style: new M.style.Point({\r\n            fill: {\r\n                color: '#3e4730',\r\n                opacity: 1\r\n            },\r\n            stroke: {\r\n                color: '#FFFFFF'\r\n            },\r\n            radius: 12\r\n        })\r\n    }\r\n    ],\r\n    animated: true,\r\n    hoverInteraction: false,\r\n    displayAmount: true,\r\n    selectedInteraction: true,\r\n    maxFeaturesToSelect: 2,\r\n    distance: 100,\r\n    label: {\r\n        font: 'bold 12px Comic Sans MS',\r\n        color: '#FFFFFF'\r\n    }\r\n};\r\n\r\nconst clusterStyleOrganizacionInstitucional = new M.style.Cluster(clusterOptionsOrganizacionInstitucional, vendorParameters);\r\n\r\nconst compositeOrganizacionInstitucional = categoriaOrganizacionInstitucional.add(clusterStyleOrganizacionInstitucional);\r\n\r\norganizacionInstitucional.setStyle(compositeOrganizacionInstitucional);";
\.


--
-- TOC entry 3117 (class 0 OID 300115)
-- Dependencies: 220
-- Data for Name: mapea_layer_wms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_layer_wms (id, layer_legend_image_id, name, description, layer_name, layer_legend, layer_url, layer_transparent, layer_tiled, layer_style) FROM stdin;
1	2	ortofoto2016_color	Ortofoto color	ortofotografia_2016_rgb	Ortofotografía Color 0,5 metros/pixel (Año 2016)	https://www.ideandalucia.es/wms/ortofoto2016?	f	t	default
2	3	ortofoto2016_pancromatica	otofoto blanco y negro	ortofotografia_2016_pancromatico	Ortofotografía Pancromática 0,5 metros/pixel (Año 2016)	https://www.ideandalucia.es/wms/ortofoto2016?	f	t	default
3	6	ortofoto2016_infrarrojo	Ortofoto Infrarrojo	ortofotografia_2016_infrarrojo	Ortofotografía Infrarrojo 0,5 metros/pixel (Año 2016)	https://www.ideandalucia.es/wms/ortofoto2016?	f	t	default
\.


--
-- TOC entry 3109 (class 0 OID 300051)
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
-- TOC entry 3111 (class 0 OID 300077)
-- Dependencies: 214
-- Data for Name: mapea_plugin_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapea_plugin_config (id, mapea_plugin_id, description, config, name) FROM stdin;
1	5	Configuración diseño ieca	s:3135:"{\r\n            open: true,\r\n            htmlCode: '<div id="cabecera"> <div id="cabecera_1"> <div id="logos"> <a href="https://www.juntadeandalucia.es"><img alt="Junta de Andalucía" title="Junta de Andalucía" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/cabecera/LogoJuntaA.png"></a> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/" accesskey="h"><img alt="Web del Instituto de Estadística y Cartografía de Andalucía" title="Web del Instituto de Estadística y Cartografía de Andalucía" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/cabecera/LogoIECAA.png"></a> </div></div><div id="cabecera_2"> <div id="cabecera_2a"> <div id="redessociales"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/blog/"><img alt="Síguenos en nuestro blog" title="Síguenos en nuestro blog" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_blogger.png"></a> <a href="https://www.twitter.com/IECA_Andalucia"><img alt="Síguenos en Twitter" title="Síguenos en Twitter" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_twitter.png"></a> <a href="https://www.facebook.com/institutodeestadisticadeandalucia"><img alt="Síguenos en Facebook" title="Síguenos en Facebook" src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_facebook.png"></a> </div></div><div id="cabecera_2b"> <div id="cabecera_2b_menu" class="lateral10 bordecolor2"> <ul> <li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/contacto.html" accesskey="c">Contacto</a></li><li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/suscripcion/index.htm" accesskey="s">Suscripción</a></li><li><a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/calendario/index.htm" accesskey="d">Calendario</a></li><li>&nbsp;</li></ul> </div></div></div></div><div id="navigation"> <div class="lineacolor fondocolor1">&nbsp;</div><div id="menu_horizontal"> <div id="menu_horizontal_1"> <div id="caminomigas"> <img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/acciones/ico_aqui.png" alt="Ruta">Está en: <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/">Inicio</a> - <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/temas/index-geo.htm">Georreferenciación</a> - <a href="../index.htm">Página del producto</a> </div></div><div id="menu_horizontal_2"> <div id="botoneramenu"> </div></div></div></div></div>',\r\n            cssList: [\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloCabecera2015.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloGenerico.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloVisor.css',\r\n            ]\r\n        }";	MapHeader IECA
3	2	BaseLayers no se muestran en layerSwitcher	s:43:"{ displayBaseLayersInLayerSwitcher: false }";	LayerSwitcher_off
2	5	Configuración diseño ieca	s:4039:"{\r\n            open: true,\r\n            htmlCode: '<div id="social"  title="Compartir"> <ul> <li class="no_imprimir"><a id="btnCompartir" href="#"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/compartir24g.png" border="0" alt="Compartir">&nbsp;<span>Compartir</span></a> <ul id="soc_compartir"> <li><a href="https://www.facebook.com/sharer.php?u=' + window.location.href + '&amp;t=+Visualizador+IECA&amp;d=" title="Compartir en Facebook" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_facebook.png" border="0" alt="Compartir en Facebook">&nbsp;<span>Facebook</span></a></li><li><a href="https://twitter.com/home?status=Visualizador-' + window.location.href + '%20v%C3%ADa%20@IECA_Andalucia" title="Compartir en Twitter" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_twitter.png" border="0" alt="Compartir en Twitter">&nbsp;<span>Twitter</span></a></li><li><a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=' + window.location.href + '&amp;title=+Visualizador+IECA" title="Compartir en LinkedIn" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_linkedin.png" border="0" alt="Compartir en LinkedIn">&nbsp;<span>LinkedIn</span></a></li><li><a href="mailto:?subject=Compartiendo%20por%20correo%20electr%C3%B3nico&amp;body=%20Visualizador:%0D%0A' + window.location.href + '" title="Compartir por correo electr&oacute;nico" target="_blank"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/social/ico_mail.png" border="0" alt="Compartir por correo electr&oacute;nico">&nbsp;<span>e-mail</span></a></li></ul> </li></ul> </div><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/icons/Logo_UE_FEDER.gif" class="feder" alt="Fondos"><div id="footer"> <div id="piea"> <div class="lineacolor fondocolor1">&nbsp;</div><div>&nbsp;</div><div> <div id="piea1"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/mapaWeb/index.htm" class="enlaces" accesskey="m">Mapa web</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/avisoLegal/index.htm" class="enlaces" accesskey="l">Aviso legal</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/protecciondedatos/index.html" class="enlaces" accesskey="p">Protecci&oacute;n de datos</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/buzon_web/index.jsp" class="enlaces" accesskey="o">Tu opini&oacute;n</a> | <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/accesibilidad/index.htm" class="enlaces" accesskey="a">Accesibilidad</a> <img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/images/w3caa.jpg" alt="Logo de w3c" id="logow3caa"> <a href="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/ieagen/avisoLegal/index.htm#cc" class="enlaceimg"><img src="https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/images/images/cc-by.png" title="Publicado bajo Licencia Creative Commons - Reconocimiento 4.0" alt="CC-BY 4.0" id="logoccby"></a> </div><div id="piea2"> Pabell&oacute;n de Nueva Zelanda. <br>C/ Leonardo Da Vinci, n&deg; 21. Isla de La Cartuja. 41071-SEVILLA.<br>Tlf.: <strong>900 101 407/955 033 800</strong> | Fax: <strong>955 033 816</strong><br></div></div></div></div>',\r\n            cssList: [\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloCabecera2015.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloGenerico.css',\r\n                'https://www.juntadeandalucia.es/institutodeestadisticaycartografia/portal/css/estiloVisor.css',\r\n            ]\r\n        }";	MapFooter IECA
\.


--
-- TOC entry 3102 (class 0 OID 300007)
-- Dependencies: 205
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, username) FROM stdin;
14	user@user.a	["ROLE_USER","ROLE_EDITOR"]	$2y$13$KvR39KDsAYI0jtXg7rKUluAoUnk2VP.EH2Yx0Qxr7XAdoC2KdqTX.	user
0	emilioj.pardo@juntadeandalucia.es	{"1":"ROLE_USER","2":"ROLE_SUPER_ADMIN"}	$2y$13$zEDeb1vNPTHlt4bc1wSt.usRs3vtwCliUTezUzAGqHgGhw/3.gsEm	admin
\.


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 217
-- Name: icon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.icon_id_seq', 2, true);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 215
-- Name: legend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legend_id_seq', 6, true);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 209
-- Name: mapea_control_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_config_id_seq', 3, true);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 207
-- Name: mapea_control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_control_id_seq', 9, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 204
-- Name: mapea_core_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_core_id_seq', 1, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 221
-- Name: mapea_layer_geojson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_layer_geojson_id_seq', 3, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 219
-- Name: mapea_layer_wms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_layer_wms_id_seq', 3, true);


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 213
-- Name: mapea_plugin_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_plugin_config_id_seq', 3, true);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 211
-- Name: mapea_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapea_plugin_id_seq', 5, true);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 14, true);


--
-- TOC entry 2945 (class 2606 OID 300016)
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2964 (class 2606 OID 300111)
-- Name: icon icon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icon
    ADD CONSTRAINT icon_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 300101)
-- Name: legend legend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend
    ADD CONSTRAINT legend_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 300042)
-- Name: mapea_control_config mapea_control_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT mapea_control_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 300035)
-- Name: mapea_control mapea_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control
    ADD CONSTRAINT mapea_control_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 300018)
-- Name: mapea_core mapea_core_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_core
    ADD CONSTRAINT mapea_core_pkey PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 300142)
-- Name: mapea_layer_geojson mapea_layer_geojson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_layer_geojson
    ADD CONSTRAINT mapea_layer_geojson_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 300125)
-- Name: mapea_layer_wms mapea_layer_wms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_layer_wms
    ADD CONSTRAINT mapea_layer_wms_pkey PRIMARY KEY (id);


--
-- TOC entry 2960 (class 2606 OID 300084)
-- Name: mapea_plugin_config mapea_plugin_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin_config
    ADD CONSTRAINT mapea_plugin_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 300058)
-- Name: mapea_plugin mapea_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin
    ADD CONSTRAINT mapea_plugin_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 300020)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 1259 OID 300048)
-- Name: idx_39a5e17157436675; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_39a5e17157436675 ON public.mapea_control_config USING btree (mapea_control_id);


--
-- TOC entry 2965 (class 1259 OID 300126)
-- Name: idx_74339790efc4a848; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_74339790efc4a848 ON public.mapea_layer_wms USING btree (layer_legend_image_id);


--
-- TOC entry 2958 (class 1259 OID 300085)
-- Name: idx_8d56ec1da1ec9697; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8d56ec1da1ec9697 ON public.mapea_plugin_config USING btree (mapea_plugin_id);


--
-- TOC entry 2948 (class 1259 OID 300021)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 2970 (class 2606 OID 300043)
-- Name: mapea_control_config fk_39a5e17157436675; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_control_config
    ADD CONSTRAINT fk_39a5e17157436675 FOREIGN KEY (mapea_control_id) REFERENCES public.mapea_control(id);


--
-- TOC entry 2972 (class 2606 OID 300127)
-- Name: mapea_layer_wms fk_74339790efc4a848; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_layer_wms
    ADD CONSTRAINT fk_74339790efc4a848 FOREIGN KEY (layer_legend_image_id) REFERENCES public.legend(id);


--
-- TOC entry 2971 (class 2606 OID 300086)
-- Name: mapea_plugin_config fk_8d56ec1da1ec9697; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapea_plugin_config
    ADD CONSTRAINT fk_8d56ec1da1ec9697 FOREIGN KEY (mapea_plugin_id) REFERENCES public.mapea_plugin(id);


-- Completed on 2021-10-29 09:29:57 CEST

--
-- PostgreSQL database dump complete
--

