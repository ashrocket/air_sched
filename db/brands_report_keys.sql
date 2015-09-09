--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.airlines_hosts DROP CONSTRAINT fk_rails_a8b0cd38f8;
ALTER TABLE ONLY public.airlines_hosts DROP CONSTRAINT fk_rails_a68c11e0aa;
ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT fk_rails_538425cf32;
ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT fk_rails_3be8df1480;
DROP INDEX public.index_report_keys_on_slug;
DROP INDEX public.index_report_keys_on_report_key;
DROP INDEX public.index_brands_on_slug;
DROP INDEX public.index_brands_on_brand_key;
DROP INDEX public.index_brand_report_keys_on_report_key_id;
DROP INDEX public.index_brand_report_keys_on_brand_id;
DROP INDEX public.index_airlines_hosts_on_host_id;
DROP INDEX public.index_airlines_hosts_on_airline_id;
ALTER TABLE ONLY public.report_keys DROP CONSTRAINT report_keys_pkey;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT hosts_pkey;
ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT brand_report_keys_pkey;
ALTER TABLE ONLY public.airlines_hosts DROP CONSTRAINT airlines_hosts_pkey;
ALTER TABLE public.report_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.hosts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.brand_report_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.airlines_hosts ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.report_keys_id_seq;
DROP TABLE public.report_keys;
DROP SEQUENCE public.hosts_id_seq;
DROP TABLE public.hosts;
DROP SEQUENCE public.brands_id_seq;
DROP TABLE public.brands;
DROP SEQUENCE public.brand_report_keys_id_seq;
DROP TABLE public.brand_report_keys;
DROP SEQUENCE public.airlines_hosts_id_seq;
DROP TABLE public.airlines_hosts;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airlines_hosts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE airlines_hosts (
    id integer NOT NULL,
    airline_id integer,
    host_id integer
);


ALTER TABLE airlines_hosts OWNER TO postgres;

--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE airlines_hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE airlines_hosts_id_seq OWNER TO postgres;

--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE airlines_hosts_id_seq OWNED BY airlines_hosts.id;


--
-- Name: brand_report_keys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE brand_report_keys (
    id integer NOT NULL,
    brand_id integer,
    report_key_id integer
);


ALTER TABLE brand_report_keys OWNER TO postgres;

--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE brand_report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_report_keys_id_seq OWNER TO postgres;

--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE brand_report_keys_id_seq OWNED BY brand_report_keys.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE brands (
    id integer NOT NULL,
    brand_key character varying NOT NULL,
    name character varying NOT NULL,
    report_keys character varying[] DEFAULT '{}'::character varying[],
    description character varying,
    default_currency character varying,
    active boolean,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    data_states json DEFAULT '{}'::json,
    max_segments integer DEFAULT 3
);


ALTER TABLE brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: hosts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hosts (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE hosts OWNER TO postgres;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hosts_id_seq OWNER TO postgres;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hosts_id_seq OWNED BY hosts.id;


--
-- Name: report_keys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE report_keys (
    id integer NOT NULL,
    report_key character varying NOT NULL,
    name character varying NOT NULL,
    file_pattern character varying DEFAULT '(?!)'::character varying NOT NULL,
    comment character varying,
    active boolean,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying DEFAULT 'idle'::character varying
);


ALTER TABLE report_keys OWNER TO postgres;

--
-- Name: report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_keys_id_seq OWNER TO postgres;

--
-- Name: report_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_keys_id_seq OWNED BY report_keys.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY airlines_hosts ALTER COLUMN id SET DEFAULT nextval('airlines_hosts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY brand_report_keys ALTER COLUMN id SET DEFAULT nextval('brand_report_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hosts ALTER COLUMN id SET DEFAULT nextval('hosts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report_keys ALTER COLUMN id SET DEFAULT nextval('report_keys_id_seq'::regclass);


--
-- Data for Name: airlines_hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airlines_hosts (id, airline_id, host_id) FROM stdin;
1	4183	1
2	4212	1
3	4445	2
5	3011	5
7	4290	1
13	4445	11
14	3011	12
15	4212	13
16	4445	14
17	3011	15
18	4212	16
\.


--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airlines_hosts_id_seq', 18, true);


--
-- Data for Name: brand_report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brand_report_keys (id, brand_id, report_key_id) FROM stdin;
13	1	51
14	1	52
\.


--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brand_report_keys_id_seq', 14, true);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brands (id, brand_key, name, report_keys, description, default_currency, active, slug, created_at, updated_at, data_states, max_segments) FROM stdin;
1	TZ	Scoot	{}	Scoot Interline Network	AUD	t	tz	2015-07-27 23:10:16.232478	2015-09-09 02:51:57.159447	{}	3
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brands_id_seq', 6, true);


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hosts (id, brand_id, name, code, created_at, updated_at) FROM stdin;
5	1	SCOOT NOKAIR HOST NOK	DD	2015-08-24 16:02:25.758282	2015-09-09 02:38:06.436689
2	1	SCOOT NOKSCOOT HOST	XW	2015-08-24 15:45:01.123549	2015-09-09 02:38:21.643041
1	1	SCOOT SCOOT OWN HOST	TZ	2015-08-24 04:39:35.051448	2015-09-09 02:38:39.69726
11	\N	NOKSCOOT OWN HOST	XW	2015-09-09 02:39:09.057972	2015-09-09 02:39:09.057972
12	\N	NOKAIR OWN HOST	DD	2015-09-09 02:39:52.10576	2015-09-09 02:39:52.10576
13	\N	NOKAIR SCOOT HOST	TZ	2015-09-09 02:40:49.02952	2015-09-09 02:40:49.02952
14	\N	NOAIR NOKSCOOT HOST	XW	2015-09-09 02:41:09.95503	2015-09-09 02:41:09.95503
15	\N	NOKSCOOT NOKAIR HOST	DD	2015-09-09 02:41:40.32594	2015-09-09 02:41:40.32594
16	\N	NOKSCOOT SCOOT HOST	TZ	2015-09-09 02:41:59.662666	2015-09-09 02:41:59.662666
\.


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hosts_id_seq', 16, true);


--
-- Data for Name: report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY report_keys (id, report_key, name, file_pattern, comment, active, slug, created_at, updated_at, state) FROM stdin;
2	SIN	Changi Airport	(HUBSIN)_\\d+	Sinagpore, SG	t	sin	2014-08-21 04:18:19	2015-06-05 05:15:27.553249	idle
1	MXP	Milan Airport	HUB(MXP)_\\d+	Milan, IT	t	mxp	2014-08-21 04:18:04	2015-06-09 18:10:49.073466	idle
16	SINCXX5JTZ	Singapore Cebu And Scoot	HUB(SIN_CXX5JTZ)_\\d+	Singapore	t	sin-cxx5jtz	2015-06-04 19:55:40.431811	2015-06-05 05:13:39.380934	idle
3	MAN	Manchester Airport	HUB(MAN)_\\d+	Manchester, UK	t	man	2014-08-21 04:19:04	2015-06-05 05:15:46.961036	idle
6	SNN	Shannon Airport	HUB(SNN)_\\d+	Shannon, Ireland	t	snn	2014-08-21 20:56:20	2015-06-05 05:15:16.688462	idle
4	FR	Ryan Air	CXX(FR)_\\d+	All Cities	t	fr	2014-08-21 04:29:52	2015-06-05 05:16:41.494787	idle
11	TZBRANDVA	Virgina Australia	(TZBRAND_VA)_\\d+	LCC Alliance	t	tzbrandva	2015-08-04 02:40:23.300228	2015-09-03 00:14:36.502521	idle
10	TZTRDDXW	LCC Alliance	CXX(TZTRDDXW)_\\d+	Asia Pacific	t	tztgddxw	2015-07-18 02:19:41.755081	2015-09-08 18:19:44.454567	idle
53	TR	Tiger Singapore OAG Schedule	(TZBRAND_TR).*	LCC Alliance	t	tr	2015-09-08 18:22:24.379082	2015-09-08 18:31:07.046253	idle
50	TZ	Scoot OAG Schedules	(TZBRAND_TZ).*		t	tz	2015-09-08 18:08:53.135762	2015-09-09 02:15:24.09684	processing
52	DD	NokAir Oag Schedules	(DD_BRAND).*	LCC Alliance	t	dd	2015-09-08 18:10:26.877011	2015-09-09 02:50:40.800111	idle
51	XW	NokScoot Oag Schedules	(XWBRAND_XW).*	LCC Alliance	t	xw	2015-09-08 18:09:48.969443	2015-09-09 02:50:55.774008	idle
\.


--
-- Name: report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_keys_id_seq', 53, true);


--
-- Name: airlines_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT airlines_hosts_pkey PRIMARY KEY (id);


--
-- Name: brand_report_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT brand_report_keys_pkey PRIMARY KEY (id);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: report_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_keys
    ADD CONSTRAINT report_keys_pkey PRIMARY KEY (id);


--
-- Name: index_airlines_hosts_on_airline_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_airlines_hosts_on_airline_id ON airlines_hosts USING btree (airline_id);


--
-- Name: index_airlines_hosts_on_host_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_airlines_hosts_on_host_id ON airlines_hosts USING btree (host_id);


--
-- Name: index_brand_report_keys_on_brand_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_brand_report_keys_on_brand_id ON brand_report_keys USING btree (brand_id);


--
-- Name: index_brand_report_keys_on_report_key_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_brand_report_keys_on_report_key_id ON brand_report_keys USING btree (report_key_id);


--
-- Name: index_brands_on_brand_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_brands_on_brand_key ON brands USING btree (brand_key);


--
-- Name: index_brands_on_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_brands_on_slug ON brands USING btree (slug);


--
-- Name: index_report_keys_on_report_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_report_keys_on_report_key ON report_keys USING btree (report_key);


--
-- Name: index_report_keys_on_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_report_keys_on_slug ON report_keys USING btree (slug);


--
-- Name: fk_rails_3be8df1480; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT fk_rails_3be8df1480 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_538425cf32; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT fk_rails_538425cf32 FOREIGN KEY (report_key_id) REFERENCES report_keys(id);


--
-- Name: fk_rails_a68c11e0aa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT fk_rails_a68c11e0aa FOREIGN KEY (airline_id) REFERENCES airlines(id);


--
-- Name: fk_rails_a8b0cd38f8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT fk_rails_a8b0cd38f8 FOREIGN KEY (host_id) REFERENCES hosts(id);


--
-- PostgreSQL database dump complete
--

