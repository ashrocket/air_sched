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

ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT fk_rails_538425cf32;
ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT fk_rails_3be8df1480;
DROP INDEX public.index_report_keys_on_slug;
DROP INDEX public.index_report_keys_on_report_key;
DROP INDEX public.index_brands_on_slug;
DROP INDEX public.index_brands_on_brand_key;
DROP INDEX public.index_brand_report_keys_on_report_key_id;
DROP INDEX public.index_brand_report_keys_on_brand_id;
ALTER TABLE ONLY public.report_keys DROP CONSTRAINT report_keys_pkey;
ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
ALTER TABLE ONLY public.brand_report_keys DROP CONSTRAINT brand_report_keys_pkey;
ALTER TABLE public.report_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.brand_report_keys ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.report_keys_id_seq;
DROP TABLE public.report_keys;
DROP SEQUENCE public.brands_id_seq;
DROP TABLE public.brands;
DROP SEQUENCE public.brand_report_keys_id_seq;
DROP TABLE public.brand_report_keys;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
    updated_at timestamp without time zone
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
-- Name: report_keys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE report_keys (
    id integer NOT NULL,
    report_key character varying NOT NULL,
    name character varying NOT NULL,
    file_pattern character varying DEFAULT '(?!)'::character varying NOT NULL,
    city character varying,
    active boolean,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    current boolean DEFAULT false
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

ALTER TABLE ONLY brand_report_keys ALTER COLUMN id SET DEFAULT nextval('brand_report_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report_keys ALTER COLUMN id SET DEFAULT nextval('report_keys_id_seq'::regclass);


--
-- Data for Name: brand_report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brand_report_keys (id, brand_id, report_key_id) FROM stdin;
8	1	10
9	2	10
10	1	11
\.


--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brand_report_keys_id_seq', 10, true);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brands (id, brand_key, name, report_keys, description, default_currency, active, slug, created_at, updated_at) FROM stdin;
1	TZ	Scoot	{}	Scoot Interline Network	AUD	t	tz	2015-07-27 23:10:16.232478	2015-08-05 14:06:12.867247
2	XW	Nok Scoot	{}	Brand for Nok Scoot Website	SGD	t	xw	2015-08-31 08:13:30.945498	2015-09-02 03:18:56.098189
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brands_id_seq', 6, true);


--
-- Data for Name: report_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY report_keys (id, report_key, name, file_pattern, city, active, slug, created_at, updated_at, current) FROM stdin;
24	LGWU2EK	Gatwick Easy Jet - Emirates Connections	(?!)	London, UK	f	lgwu2ek	2014-10-27 04:38:14.700334	2014-12-11 22:00:00.603855	f
22	ATHMKTS	Athens Airport	(?!)	Athens, GR	f	ath	2014-08-21 04:30:10	2014-09-07 00:10:07	f
25	BLR	Bengalaru	(?!)	Bengalaru, India	f	blr	2014-10-27 04:38:14.700334	2014-10-27 04:42:02.806931	f
23	ATH1STOP	Athens Airport (limited carriers)	(?!)	Athens, GR	f	ath1stop	2014-08-21 04:30:10	2014-12-11 21:59:45.277245	f
21	LGWDYVS	London Gatwick Airport (Norwegian and Virgin)	(?!)	London, UK	f	lgwdyvs	2014-08-21 04:18:49	2014-12-11 22:00:14.219882	f
2	SIN	Changi Airport	(HUBSIN)_\\d+	Sinagpore, SG	t	sin	2014-08-21 04:18:19	2015-06-05 05:15:27.553249	f
12	TZBRANDSG	Singapore Airlines	(TZBRAND_SQ)_\\d+	LCC Alliance	t	tzbrandsg	2015-08-04 02:39:15.01327	2015-08-04 07:29:43.723399	f
1	MXP	Milan Airport	HUB(MXP)_\\d+	Milan, IT	t	mxp	2014-08-21 04:18:04	2015-06-09 18:10:49.073466	f
10	TZTRDDXW	LCC Alliance	CXX(TZTRDDXW)_\\d+	Asia Pacific	t	tztgddxw	2015-07-18 02:19:41.755081	2015-07-18 02:19:41.755081	f
11	TZBRANDVA	Virgina Australia	(TZBRAND_VA)_\\d+	LCC Alliance	t	tzbrandva	2015-08-04 02:40:23.300228	2015-08-04 07:30:02.909675	f
20	DY	Norwegian Air	(?!)	All Cities	\N	dy	2014-08-21 04:29:52	2014-09-07 00:10:44	f
19	DDTZ	Nok and Scoot 	CXX(_TZDD)_\\d+	All Cities	t	ddtz	2014-08-21 04:29:52	2015-07-25 02:05:24.025831	f
13	TZBRANDMI	Silk Air	TZBRAND_MI_\\d+	LCC Alliance	t	tzbrandmi	2015-08-04 02:37:28.328034	2015-08-04 02:40:01.532276	f
16	SINCXX5JTZ	Singapore Cebu And Scoot	HUB(SIN_CXX5JTZ)_\\d+	Singapore	t	sin-cxx5jtz	2015-06-04 19:55:40.431811	2015-06-05 05:13:39.380934	f
26	SIN_VA	Singapore Virgin Australia	(CXX_Virgin_australia)_\\d+	Singapore	t	sin_va	2015-06-05 05:18:03.120174	2015-06-10 02:23:49.082566	f
49	NONE	Null Report	(?!)	\N	\N	none	2015-09-02 03:25:35.545824	2015-09-02 03:25:35.545824	f
5	BCN	Barcelona Airport	(?!)	Barcelona, Spain	f	bcn	2014-08-21 04:34:18	2014-09-01 17:29:23	f
3	MAN	Manchester Airport	HUB(MAN)_\\d+	Manchester, UK	t	man	2014-08-21 04:19:04	2015-06-05 05:15:46.961036	f
6	SNN	Shannon Airport	HUB(SNN)_\\d+	Shannon, Ireland	t	snn	2014-08-21 20:56:20	2015-06-05 05:15:16.688462	f
4	FR	Ryan Air	CXX(FR)_\\d+	All Cities	t	fr	2014-08-21 04:29:52	2015-06-05 05:16:41.494787	f
\.


--
-- Name: report_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_keys_id_seq', 49, true);


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
-- Name: report_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY report_keys
    ADD CONSTRAINT report_keys_pkey PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

