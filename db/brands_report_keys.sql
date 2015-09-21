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


ALTER TABLE public.airlines_hosts OWNER TO postgres;

--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE airlines_hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airlines_hosts_id_seq OWNER TO postgres;

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


ALTER TABLE public.brand_report_keys OWNER TO postgres;

--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE brand_report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brand_report_keys_id_seq OWNER TO postgres;

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


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

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


ALTER TABLE public.hosts OWNER TO postgres;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO postgres;

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


ALTER TABLE public.report_keys OWNER TO postgres;

--
-- Name: report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_keys_id_seq OWNER TO postgres;

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
8	3011	7
9	4445	9
11	4212	10
13	3011	11
14	4445	12
15	4212	13
16	3629	1
17	4083	1
18	3437	14
19	4212	15
\.


--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airlines_hosts_id_seq', 19, true);


--
-- Data for Name: brand_report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brand_report_keys (id, brand_id, report_key_id) FROM stdin;
13	1	51
14	1	52
18	1	50
19	7	52
20	7	51
21	8	52
22	8	50
23	8	51
24	1	53
25	1	13
26	1	11
27	7	50
28	1	12
29	9	54
30	9	50
\.


--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brand_report_keys_id_seq', 30, true);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brands (id, brand_key, name, report_keys, description, default_currency, active, slug, created_at, updated_at, data_states, max_segments) FROM stdin;
9	JWBRAND	Vanilla Air	{}		JPY	t	jw	2015-09-17 14:49:33.891291	2015-09-21 00:29:00.358648	{"route_maps_export":{"state":"idle","location":"https://s3.amazonaws.com/ashr.airblackbox-routes/jwbrand_route_map.json.zip","updated_at":"2015-09-21T00:09:34.485+00:00"},"branded_connections":{"state":"idle","count":3758,"updated_at":"2015-09-21T00:24:08.403+00:00"},"smart_routes":{"state":"idle","count":[{"segs":1,"count":44},{"segs":2,"count":168},{"segs":3,"count":118}],"updated_at":"2015-09-21T00:26:47.406+00:00"},"route_maps":{"state":"idle","updated_at":"2015-09-21T00:29:00.357+00:00","markets":312}}	3
7	DD	NokAir	{}	Nok Air Brand	THB	f	dd	2015-09-13 07:46:49.318517	2015-09-14 12:24:03.208322	{"smart_routes":{"state":"idle","count":[{"segs":1,"count":92},{"segs":2,"count":966},{"segs":3,"count":788}],"updated_at":"2015-09-14T12:17:16.137+00:00"},"route_maps":{"state":"idle","updated_at":"2015-09-14T12:21:48.310+00:00","markets":1540},"route_maps_export":{"state":"idle","location":"https://s3.amazonaws.com/ashr.airblackbox-routes/dd_route_map.json.zip","updated_at":"2015-09-14T12:24:03.207+00:00"},"branded_connections":{"state":"idle","count":12183,"updated_at":"2015-09-14T12:12:24.973+00:00"}}	3
8	XW	NokScoot Brand	{}	NokScoot Brand	THB	t	xw	2015-09-13 19:05:04.889656	2015-09-21 00:33:02.252833	{"smart_routes":{"state":"idle","count":[{"segs":2,"count":966},{"segs":1,"count":92},{"segs":3,"count":788}],"updated_at":"2015-09-21T00:33:02.252+00:00"},"route_maps_export":{"state":"processing"},"branded_connections":{"state":"idle","count":11974,"updated_at":"2015-09-21T00:07:50.373+00:00"},"route_maps":{"state":"processing"}}	3
1	TZ	Scoot	{}	Scoot Interline Network	AUD	t	tz	2015-07-27 23:10:16.232478	2015-09-21 00:26:24.147113	{"branded_connections":{"state":"idle","count":218951,"updated_at":"2015-09-20T23:50:55.015+00:00"},"smart_routes":{"state":"idle","count":[{"segs":2,"count":1608},{"segs":1,"count":165},{"segs":3,"count":2701}],"updated_at":"2015-09-21T00:26:24.146+00:00"},"route_maps":{"state":"idle","updated_at":"2015-09-15T12:30:28.134+00:00","markets":3647},"route_maps_export":{"state":"processing"}}	3
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brands_id_seq', 9, true);


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hosts (id, brand_id, name, code, created_at, updated_at) FROM stdin;
2	1	NokScoot Navitaire	XW	2015-08-24 15:45:01.123549	2015-08-24 15:45:01.123549
5	1	Nok Navitaire	DD	2015-08-24 16:02:25.758282	2015-08-24 16:02:25.758282
9	7	NokScoot Navitaire	XW	2015-08-31 09:11:15.761392	2015-09-13 07:46:49.331967
10	7	Scoot Navitaire	TZ	2015-08-31 09:11:58.301918	2015-09-13 07:46:49.333385
11	8	Nok Navitaire	DD	2015-09-13 19:05:27.579007	2015-09-13 19:05:27.579007
1	1	Scoot OwnHost Navitaire	TZ	2015-08-24 04:39:35.051448	2015-09-13 19:06:12.089581
7	7	Nok OwnHost Navitaire	DD	2015-08-31 09:07:40.218443	2015-09-13 19:06:25.653178
12	8	NokScoot OwnHost Navitaire	XW	2015-09-13 19:05:48.054701	2015-09-13 19:06:42.593856
13	8	Scoot Navitaire	TZ	2015-09-13 19:07:33.5542	2015-09-13 19:08:08.760699
14	9	Vanilla Air	JW	2015-09-17 14:49:06.487982	2015-09-17 14:49:43.359702
15	9	Scoot Navitaire	TZ	2015-09-18 09:40:26.52999	2015-09-18 09:40:26.52999
\.


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hosts_id_seq', 15, true);


--
-- Data for Name: report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY report_keys (id, report_key, name, file_pattern, comment, active, slug, created_at, updated_at, state) FROM stdin;
2	SIN	Changi Airport	(HUBSIN)_\\d+	Sinagpore, SG	t	sin	2014-08-21 04:18:19	2015-06-05 05:15:27.553249	idle
1	MXP	Milan Airport	HUB(MXP)_\\d+	Milan, IT	t	mxp	2014-08-21 04:18:04	2015-06-09 18:10:49.073466	idle
16	SINCXX5JTZ	Singapore Cebu And Scoot	HUB(SIN_CXX5JTZ)_\\d+	Singapore	t	sin-cxx5jtz	2015-06-04 19:55:40.431811	2015-06-05 05:13:39.380934	idle
3	MAN	Manchester Airport	HUB(MAN)_\\d+	Manchester, UK	t	man	2014-08-21 04:19:04	2015-06-05 05:15:46.961036	idle
50	TZ	Scoot OAG Schedules	(TZBRAND_TZ).*		t	tz	2015-09-08 18:08:53.135762	2015-09-21 02:22:25.984364	processing
12	TZBRANDSG	Singapore Airlines	(TZBRAND_SQ).*	LCC Alliance	t	tzbrandsg	2015-08-04 02:39:15.01327	2015-09-21 02:25:56.873902	processing
10	TZTRDDXW	LCC Alliance	CXX(TZTRDDXW)_\\d+	Asia Pacific	t	tztgddxw	2015-07-18 02:19:41.755081	2015-09-21 11:52:49.919545	idle
52	DD	NokAir Oag Schedules	(DDBRAND_DD).*	LCC Alliance	t	dd	2015-09-08 18:10:26.877011	2015-09-21 11:56:05.007828	idle
53	TR	Tiger Singapore OAG Schedule	(TZBRAND_TR).*	LCC Alliance	t	tr	2015-09-08 18:22:24.379082	2015-09-21 11:58:50.147883	idle
13	TZBRANDMI	Silk Air	(TZBRAND_MI).*	LCC Alliance	t	tzbrandmi	2015-08-04 02:37:28.328034	2015-09-21 12:00:48.435706	processing
6	SNN	Shannon Airport	HUB(SNN)_\\d+	Shannon, Ireland	t	snn	2014-08-21 20:56:20	2015-09-20 02:30:16.40537	idle
54	JW	Vanilla Air	(JWBRAND).*		t	jw-brand	2015-09-17 15:08:17.762238	2015-09-18 09:15:14.850879	idle
11	TZBRANDVA	Virgina Australia	(TZBRAND_VA).*	LCC Alliance	t	tzbrandva	2015-08-04 02:40:23.300228	2015-09-21 02:12:26.188934	idle
51	XW	NokScoot Oag Schedules	(XWBRAND_XW).*	LCC Alliance	t	xw	2015-09-08 18:09:48.969443	2015-09-21 02:15:11.345517	idle
4	FR	Ryan Air	CXX(FR)_\\d+	All Cities	t	fr	2014-08-21 04:29:52	2015-09-21 02:16:24.632744	processing
\.


--
-- Name: report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_keys_id_seq', 54, true);


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

