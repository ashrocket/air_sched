--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id bigint NOT NULL,
    namespace text,
    body text,
    resource_id text NOT NULL,
    resource_type text NOT NULL,
    author_id bigint,
    author_type text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: activeadmin_settings_pictures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activeadmin_settings_pictures (
    id bigint NOT NULL,
    data text,
    data_file_size text,
    data_content_type text,
    width bigint,
    height bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: activeadmin_settings_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activeadmin_settings_pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activeadmin_settings_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activeadmin_settings_pictures_id_seq OWNED BY activeadmin_settings_pictures.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_users (
    id bigint NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    encrypted_password text DEFAULT ''::text NOT NULL,
    reset_password_token text,
    reset_password_sent_at timestamp with time zone,
    remember_created_at timestamp with time zone,
    sign_in_count bigint DEFAULT 0::bigint NOT NULL,
    current_sign_in_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    current_sign_in_ip text,
    last_sign_in_ip text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: airlines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airlines (
    id bigint NOT NULL,
    code text,
    name text,
    country text,
    slug text
);


--
-- Name: airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airlines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airlines_id_seq OWNED BY airlines.id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airports (
    id bigint NOT NULL,
    code text,
    name text,
    city text,
    slug text
);


--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airports_id_seq OWNED BY airports.id;


--
-- Name: app_switches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE app_switches (
    id bigint NOT NULL,
    name text,
    enabled boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: app_switches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE app_switches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_switches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE app_switches_id_seq OWNED BY app_switches.id;


--
-- Name: carriers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE carriers (
    id bigint NOT NULL,
    code text,
    name text,
    country text,
    active boolean,
    slug text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: carriers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE carriers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE carriers_id_seq OWNED BY carriers.id;


--
-- Name: cnx_pairs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cnx_pairs (
    id bigint NOT NULL,
    report_key text,
    origin text,
    origin_name text,
    dest text,
    dest_name text
);


--
-- Name: cnx_pairs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cnx_pairs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cnx_pairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cnx_pairs_id_seq OWNED BY cnx_pairs.id;


--
-- Name: destinations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE destinations (
    id integer NOT NULL,
    report_key character varying(255),
    origin character varying(255),
    origin_code character varying(255),
    cxrs1 character varying(255)[] DEFAULT '{}'::character varying[],
    hub_name character varying(255),
    hub_code character varying(255),
    cxrs2 character varying(255)[] DEFAULT '{}'::character varying[],
    dest character varying(255),
    dest_code character varying(255)
);


--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE destinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE destinations_id_seq OWNED BY destinations.id;


--
-- Name: direct_flights; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE direct_flights (
    id integer NOT NULL,
    report_key character varying(255),
    origin character varying(255),
    dest character varying(255),
    carriers character varying(255)[] DEFAULT '{}'::character varying[]
);


--
-- Name: direct_flights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE direct_flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: direct_flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE direct_flights_id_seq OWNED BY direct_flights.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id bigint NOT NULL,
    slug text NOT NULL,
    sluggable_id bigint NOT NULL,
    sluggable_type text,
    scope text,
    created_at timestamp with time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: hubs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hubs (
    id bigint NOT NULL,
    code text,
    name text,
    city text,
    active boolean,
    slug text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: hubs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hubs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hubs_id_seq OWNED BY hubs.id;


--
-- Name: interline_cxr_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interline_cxr_rules (
    id integer NOT NULL,
    report_key_id integer,
    markets text[] DEFAULT '{}'::text[],
    combinations text[] DEFAULT '{}'::text[],
    rule_kind character varying(255) DEFAULT 'allow'::character varying NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: interline_cxr_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE interline_cxr_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interline_cxr_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE interline_cxr_rules_id_seq OWNED BY interline_cxr_rules.id;


--
-- Name: market_data_exports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE market_data_exports (
    id integer NOT NULL,
    status character varying(255),
    location character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: market_data_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE market_data_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: market_data_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE market_data_exports_id_seq OWNED BY market_data_exports.id;


--
-- Name: oag_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oag_reports (
    id bigint NOT NULL,
    msg_id text,
    report_key text,
    load_status text,
    report_status text DEFAULT 'uninitialized'::text,
    attachment_status text DEFAULT 'unstored'::text,
    received timestamp with time zone,
    attachment_path text,
    attachment_size bigint,
    complete boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: oag_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oag_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oag_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oag_reports_id_seq OWNED BY oag_reports.id;


--
-- Name: oag_schedules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oag_schedules (
    id bigint NOT NULL,
    report_key text,
    eff_date timestamp with time zone,
    disc_date timestamp with time zone,
    airline_code text,
    airline_name text,
    flight_num text,
    op boolean DEFAULT false NOT NULL,
    op_cxr_code text,
    op_cxr_name text,
    op_flight_num text,
    shared_airline_code text,
    shared_airline_name text,
    mkt_cxrs text,
    origin_apt text,
    origin_apt_name text,
    origin_apt_city text,
    dest_apt text,
    dest_apt_name text,
    dest_apt_city text,
    dep_op_days text,
    arr_op_days text,
    dep_time_local text,
    arr_time_local text,
    next_day_arrival boolean DEFAULT false NOT NULL,
    duration text,
    stops bigint,
    restrictions text,
    via_apts text,
    mkt text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: oag_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oag_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oag_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oag_schedules_id_seq OWNED BY oag_schedules.id;


--
-- Name: report_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE report_keys (
    id bigint NOT NULL,
    report_key text,
    name text,
    city text,
    active boolean,
    slug text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE report_keys_id_seq OWNED BY report_keys.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version text NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id bigint NOT NULL,
    var text NOT NULL,
    value text,
    thing_id bigint,
    thing_type text,
    tip text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activeadmin_settings_pictures ALTER COLUMN id SET DEFAULT nextval('activeadmin_settings_pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines ALTER COLUMN id SET DEFAULT nextval('airlines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airports ALTER COLUMN id SET DEFAULT nextval('airports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_switches ALTER COLUMN id SET DEFAULT nextval('app_switches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY carriers ALTER COLUMN id SET DEFAULT nextval('carriers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cnx_pairs ALTER COLUMN id SET DEFAULT nextval('cnx_pairs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY destinations ALTER COLUMN id SET DEFAULT nextval('destinations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY direct_flights ALTER COLUMN id SET DEFAULT nextval('direct_flights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hubs ALTER COLUMN id SET DEFAULT nextval('hubs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY interline_cxr_rules ALTER COLUMN id SET DEFAULT nextval('interline_cxr_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY market_data_exports ALTER COLUMN id SET DEFAULT nextval('market_data_exports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oag_reports ALTER COLUMN id SET DEFAULT nextval('oag_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oag_schedules ALTER COLUMN id SET DEFAULT nextval('oag_schedules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY report_keys ALTER COLUMN id SET DEFAULT nextval('report_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activeadmin_settings_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activeadmin_settings_pictures
    ADD CONSTRAINT activeadmin_settings_pictures_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: app_switches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY app_switches
    ADD CONSTRAINT app_switches_pkey PRIMARY KEY (id);


--
-- Name: carriers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY carriers
    ADD CONSTRAINT carriers_pkey PRIMARY KEY (id);


--
-- Name: cnx_pairs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cnx_pairs
    ADD CONSTRAINT cnx_pairs_pkey PRIMARY KEY (id);


--
-- Name: destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: direct_flights_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY direct_flights
    ADD CONSTRAINT direct_flights_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: hubs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hubs
    ADD CONSTRAINT hubs_pkey PRIMARY KEY (id);


--
-- Name: interline_cxr_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interline_cxr_rules
    ADD CONSTRAINT interline_cxr_rules_pkey PRIMARY KEY (id);


--
-- Name: market_data_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY market_data_exports
    ADD CONSTRAINT market_data_exports_pkey PRIMARY KEY (id);


--
-- Name: oag_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oag_reports
    ADD CONSTRAINT oag_reports_pkey PRIMARY KEY (id);


--
-- Name: oag_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oag_schedules
    ADD CONSTRAINT oag_schedules_pkey PRIMARY KEY (id);


--
-- Name: report_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY report_keys
    ADD CONSTRAINT report_keys_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: direct_flights_d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX direct_flights_d ON direct_flights USING btree (dest);


--
-- Name: direct_flights_o; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX direct_flights_o ON direct_flights USING btree (origin);


--
-- Name: direct_flights_o_and_d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX direct_flights_o_and_d ON direct_flights USING btree (origin, dest);


--
-- Name: idx_23396_index_active_admin_comments_on_author_type_and_author; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23396_index_active_admin_comments_on_author_type_and_author ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: idx_23396_index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23396_index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: idx_23396_index_active_admin_comments_on_resource_type_and_reso; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23396_index_active_admin_comments_on_resource_type_and_reso ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: idx_23405_index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23405_index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: idx_23405_index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23405_index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: idx_23417_index_airlines_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23417_index_airlines_on_code ON airlines USING btree (code);


--
-- Name: idx_23417_index_airlines_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23417_index_airlines_on_slug ON airlines USING btree (slug);


--
-- Name: idx_23426_index_airports_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23426_index_airports_on_code ON airports USING btree (code);


--
-- Name: idx_23426_index_airports_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23426_index_airports_on_slug ON airports USING btree (slug);


--
-- Name: idx_23444_index_carriers_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23444_index_carriers_on_code ON carriers USING btree (code);


--
-- Name: idx_23444_index_carriers_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23444_index_carriers_on_slug ON carriers USING btree (slug);


--
-- Name: idx_23453_cnx_pairs_o_and_d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23453_cnx_pairs_o_and_d ON cnx_pairs USING btree (report_key, origin, dest, origin_name, dest_name);


--
-- Name: idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type_an; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type_an ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: idx_23489_index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23489_index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: idx_23489_index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23489_index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: idx_23498_index_hubs_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23498_index_hubs_on_code ON hubs USING btree (code);


--
-- Name: idx_23498_index_hubs_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23498_index_hubs_on_slug ON hubs USING btree (slug);


--
-- Name: idx_23519_index_oag_schedules_on_dest_apt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_index_oag_schedules_on_dest_apt ON oag_schedules USING btree (dest_apt);


--
-- Name: idx_23519_index_oag_schedules_on_mkt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_index_oag_schedules_on_mkt ON oag_schedules USING btree (mkt);


--
-- Name: idx_23519_oag_comp_mkt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_oag_comp_mkt ON oag_schedules USING btree (origin_apt, dest_apt);


--
-- Name: idx_23519_oag_eff_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_oag_eff_date ON oag_schedules USING btree (report_key, eff_date);


--
-- Name: idx_23519_oag_eff_disc_dates; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_oag_eff_disc_dates ON oag_schedules USING btree (report_key, eff_date, disc_date);


--
-- Name: idx_23519_oag_flight_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_23519_oag_flight_id ON oag_schedules USING btree (airline_code, flight_num);


--
-- Name: idx_23530_index_report_keys_on_report_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23530_index_report_keys_on_report_key ON report_keys USING btree (report_key);


--
-- Name: idx_23530_index_report_keys_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23530_index_report_keys_on_slug ON report_keys USING btree (slug);


--
-- Name: idx_23537_unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23537_unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: idx_23545_index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_23545_index_settings_on_thing_type_and_thing_id_and_var ON settings USING btree (thing_type, thing_id, var);


--
-- Name: index_interline_cxr_rules_on_combinations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_interline_cxr_rules_on_combinations ON interline_cxr_rules USING gin (combinations);


--
-- Name: index_interline_cxr_rules_on_markets; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_interline_cxr_rules_on_markets ON interline_cxr_rules USING gin (markets);


--
-- Name: index_interline_cxr_rules_on_report_key_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_interline_cxr_rules_on_report_key_id ON interline_cxr_rules USING btree (report_key_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140101000000');

INSERT INTO schema_migrations (version) VALUES ('20140102002000');

INSERT INTO schema_migrations (version) VALUES ('20140103000010');

INSERT INTO schema_migrations (version) VALUES ('20140103000015');

INSERT INTO schema_migrations (version) VALUES ('20140103000020');

INSERT INTO schema_migrations (version) VALUES ('20140103000025');

INSERT INTO schema_migrations (version) VALUES ('20140103000030');

INSERT INTO schema_migrations (version) VALUES ('20140103000050');

INSERT INTO schema_migrations (version) VALUES ('20140103000060');

INSERT INTO schema_migrations (version) VALUES ('20140103000070');

INSERT INTO schema_migrations (version) VALUES ('20140103000080');

INSERT INTO schema_migrations (version) VALUES ('20140103000090');

INSERT INTO schema_migrations (version) VALUES ('20140821200616');

INSERT INTO schema_migrations (version) VALUES ('20140821200706');

INSERT INTO schema_migrations (version) VALUES ('20140821204002');

INSERT INTO schema_migrations (version) VALUES ('20140825091056');

INSERT INTO schema_migrations (version) VALUES ('20140929190724');

INSERT INTO schema_migrations (version) VALUES ('20141003133309');

