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

-- The following was commented out by rake db:structure:fix_plpgsql
-- CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

-- The following was commented out by rake db:structure:fix_plpgsql
-- COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_id integer,
    author_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
    id integer NOT NULL,
    code character varying,
    name character varying,
    country_name character varying,
    slug character varying
);


--
-- Name: airlines_hosts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airlines_hosts (
    id integer NOT NULL,
    airline_id integer,
    host_id integer
);


--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airlines_hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airlines_hosts_id_seq OWNED BY airlines_hosts.id;


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
-- Name: airport_currencies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airport_currencies (
    id integer NOT NULL,
    name character varying,
    city character varying,
    iata character varying,
    icao character varying,
    country character varying,
    country_code character varying,
    latitude numeric(64,12),
    longitude numeric(64,12),
    currency_code character varying
);


--
-- Name: airport_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airport_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airport_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airport_currencies_id_seq OWNED BY airport_currencies.id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airports (
    id integer NOT NULL,
    code character varying,
    name character varying,
    city character varying,
    lat numeric(10,6),
    long numeric(10,6),
    slug character varying
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
-- Name: app_controls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE app_controls (
    id integer NOT NULL,
    report_key_id integer,
    brand_id integer
);


--
-- Name: app_controls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE app_controls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_controls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE app_controls_id_seq OWNED BY app_controls.id;


--
-- Name: app_switches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE app_switches (
    id integer NOT NULL,
    name character varying,
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
-- Name: brand_connections; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE brand_connections (
    id integer NOT NULL,
    brand_id integer NOT NULL,
    origin character varying,
    via character varying,
    dest character varying,
    sched1_id integer,
    sched2_id integer,
    sched1_cxr character varying,
    sched2_cxr character varying,
    sched1_eff_dates json DEFAULT '{}'::json,
    sched1_operating json DEFAULT '[]'::json,
    sched2_eff_dates json DEFAULT '{}'::json,
    sched2_operating json DEFAULT '[]'::json,
    ct_minutes json DEFAULT '[]'::json,
    eff date,
    disc date,
    operating_window integer[] DEFAULT '{}'::integer[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: brand_connections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brand_connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brand_connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brand_connections_id_seq OWNED BY brand_connections.id;


--
-- Name: brand_report_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE brand_report_keys (
    id integer NOT NULL,
    brand_id integer,
    report_key_id integer
);


--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brand_report_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brand_report_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brand_report_keys_id_seq OWNED BY brand_report_keys.id;


--
-- Name: branded_market_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branded_market_requests (
    id integer NOT NULL,
    brand_id integer,
    origin character varying,
    dest character varying
);


--
-- Name: branded_market_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branded_market_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branded_market_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branded_market_requests_id_seq OWNED BY branded_market_requests.id;


--
-- Name: branded_market_route_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branded_market_route_requests (
    id integer NOT NULL,
    "order" integer,
    branded_route_request_id integer,
    branded_market_request_id integer
);


--
-- Name: branded_market_route_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branded_market_route_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branded_market_route_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branded_market_route_requests_id_seq OWNED BY branded_market_route_requests.id;


--
-- Name: branded_market_segments_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branded_market_segments_requests (
    id integer NOT NULL,
    brand_id integer,
    origin character varying,
    dest character varying,
    segment_count integer,
    branded_market_request_ids integer[] DEFAULT '{}'::integer[]
);


--
-- Name: branded_market_segments_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branded_market_segments_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branded_market_segments_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branded_market_segments_requests_id_seq OWNED BY branded_market_segments_requests.id;


--
-- Name: branded_route_maps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branded_route_maps (
    id integer NOT NULL,
    brand_id integer,
    route_map json DEFAULT '{}'::json
);


--
-- Name: branded_route_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branded_route_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branded_route_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branded_route_maps_id_seq OWNED BY branded_route_maps.id;


--
-- Name: branded_route_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE branded_route_requests (
    id integer NOT NULL,
    brand_id integer,
    key character varying,
    origin character varying,
    dest character varying,
    cxrs character varying[] DEFAULT '{}'::character varying[],
    host character varying
);


--
-- Name: branded_route_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE branded_route_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branded_route_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE branded_route_requests_id_seq OWNED BY branded_route_requests.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: carriers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE carriers (
    id integer NOT NULL,
    code character varying,
    name character varying,
    country character varying,
    active boolean,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
-- Name: city_pairs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE city_pairs (
    id integer NOT NULL,
    hub character varying,
    orig character varying,
    dest character varying,
    outbound text,
    inbound text
);


--
-- Name: city_pairs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE city_pairs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: city_pairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE city_pairs_id_seq OWNED BY city_pairs.id;


--
-- Name: cnx_pairs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cnx_pairs (
    id integer NOT NULL,
    report_key_id integer,
    origin character varying(4),
    origin_name character varying,
    dest character varying(4),
    dest_name character varying
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
    report_key_id integer,
    origin character varying,
    origin_code character varying,
    cxrs1 character varying[] DEFAULT '{}'::character varying[],
    hub_name character varying,
    hub_code character varying,
    cxrs2 character varying[] DEFAULT '{}'::character varying[],
    dest character varying,
    dest_code character varying,
    eff_days json DEFAULT '[]'::json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
    report_key_id integer,
    origin character varying,
    dest character varying,
    carriers character varying[] DEFAULT '{}'::character varying[]
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
-- Name: export_market_data_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE export_market_data_reports (
    id integer NOT NULL,
    status character varying,
    location character varying,
    workflow_state character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: export_market_data_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE export_market_data_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: export_market_data_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE export_market_data_reports_id_seq OWNED BY export_market_data_reports.id;


--
-- Name: export_smart_route_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE export_smart_route_reports (
    id integer NOT NULL,
    brand_id integer,
    status character varying,
    workflow_state character varying,
    location character varying,
    details json DEFAULT '{}'::json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: export_smart_route_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE export_smart_route_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: export_smart_route_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE export_smart_route_reports_id_seq OWNED BY export_smart_route_reports.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
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
-- Name: hosts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hosts (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hosts_id_seq OWNED BY hosts.id;


--
-- Name: hubs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hubs (
    id integer NOT NULL,
    code character varying,
    name character varying,
    city character varying,
    active boolean,
    slug character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
    patterns text[] DEFAULT '{(?!)}'::text[],
    match_on character varying DEFAULT 'id'::character varying,
    rule_kind character varying DEFAULT 'allow'::character varying NOT NULL,
    active boolean DEFAULT true,
    sequence integer DEFAULT 0,
    description text,
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
-- Name: oag_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oag_reports (
    id integer NOT NULL,
    report_key_id integer,
    msg_id character varying,
    workflow_state character varying,
    load_status json DEFAULT '{}'::json,
    log_data json DEFAULT '[]'::json,
    attachment_status character varying DEFAULT 'unstored'::character varying,
    received timestamp without time zone,
    attachment_lines integer DEFAULT 0,
    attachment_path character varying,
    attachment_size integer,
    carriers character varying[] DEFAULT '{}'::character varying[],
    complete boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
    id integer NOT NULL,
    report_key_id integer,
    eff_date timestamp without time zone,
    disc_date timestamp without time zone,
    airline_code character varying,
    airline_name character varying,
    flight_num character varying,
    op boolean DEFAULT false,
    op_cxr_code character varying,
    op_cxr_name character varying,
    op_flight_num character varying,
    shared_airline_code character varying,
    shared_airline_name character varying,
    mkt_cxrs character varying,
    origin_apt character varying,
    origin_apt_name character varying,
    origin_apt_city character varying,
    dest_apt character varying,
    dest_apt_name character varying,
    dest_apt_city character varying,
    dep_op_days integer[] DEFAULT '{}'::integer[],
    arr_op_days integer[] DEFAULT '{}'::integer[],
    dep_time_local character varying,
    arr_time_local character varying,
    next_day_arrival boolean DEFAULT false,
    duration character varying,
    stops integer,
    restrictions character varying,
    via_apts character varying,
    mkt character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
-- Name: possible_flights; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE possible_flights (
    id integer NOT NULL,
    hub character varying,
    orig character varying,
    dest character varying,
    outbound text,
    inbound text
);


--
-- Name: possible_flights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE possible_flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: possible_flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE possible_flights_id_seq OWNED BY possible_flights.id;


--
-- Name: report_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    var character varying NOT NULL,
    value text,
    thing_id integer,
    thing_type character varying(30),
    tip text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines ALTER COLUMN id SET DEFAULT nextval('airlines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines_hosts ALTER COLUMN id SET DEFAULT nextval('airlines_hosts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airport_currencies ALTER COLUMN id SET DEFAULT nextval('airport_currencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airports ALTER COLUMN id SET DEFAULT nextval('airports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_controls ALTER COLUMN id SET DEFAULT nextval('app_controls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_switches ALTER COLUMN id SET DEFAULT nextval('app_switches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brand_connections ALTER COLUMN id SET DEFAULT nextval('brand_connections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brand_report_keys ALTER COLUMN id SET DEFAULT nextval('brand_report_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branded_market_requests ALTER COLUMN id SET DEFAULT nextval('branded_market_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branded_market_route_requests ALTER COLUMN id SET DEFAULT nextval('branded_market_route_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branded_market_segments_requests ALTER COLUMN id SET DEFAULT nextval('branded_market_segments_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branded_route_maps ALTER COLUMN id SET DEFAULT nextval('branded_route_maps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY branded_route_requests ALTER COLUMN id SET DEFAULT nextval('branded_route_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY carriers ALTER COLUMN id SET DEFAULT nextval('carriers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY city_pairs ALTER COLUMN id SET DEFAULT nextval('city_pairs_id_seq'::regclass);


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

ALTER TABLE ONLY export_market_data_reports ALTER COLUMN id SET DEFAULT nextval('export_market_data_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY export_smart_route_reports ALTER COLUMN id SET DEFAULT nextval('export_smart_route_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hosts ALTER COLUMN id SET DEFAULT nextval('hosts_id_seq'::regclass);


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

ALTER TABLE ONLY oag_reports ALTER COLUMN id SET DEFAULT nextval('oag_reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oag_schedules ALTER COLUMN id SET DEFAULT nextval('oag_schedules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY possible_flights ALTER COLUMN id SET DEFAULT nextval('possible_flights_id_seq'::regclass);


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
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: airlines_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT airlines_hosts_pkey PRIMARY KEY (id);


--
-- Name: airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airport_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airport_currencies
    ADD CONSTRAINT airport_currencies_pkey PRIMARY KEY (id);


--
-- Name: airports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: app_controls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY app_controls
    ADD CONSTRAINT app_controls_pkey PRIMARY KEY (id);


--
-- Name: app_switches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY app_switches
    ADD CONSTRAINT app_switches_pkey PRIMARY KEY (id);


--
-- Name: brand_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY brand_connections
    ADD CONSTRAINT brand_connections_pkey PRIMARY KEY (id);


--
-- Name: brand_report_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT brand_report_keys_pkey PRIMARY KEY (id);


--
-- Name: branded_market_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branded_market_requests
    ADD CONSTRAINT branded_market_requests_pkey PRIMARY KEY (id);


--
-- Name: branded_market_route_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branded_market_route_requests
    ADD CONSTRAINT branded_market_route_requests_pkey PRIMARY KEY (id);


--
-- Name: branded_market_segments_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branded_market_segments_requests
    ADD CONSTRAINT branded_market_segments_requests_pkey PRIMARY KEY (id);


--
-- Name: branded_route_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branded_route_maps
    ADD CONSTRAINT branded_route_maps_pkey PRIMARY KEY (id);


--
-- Name: branded_route_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY branded_route_requests
    ADD CONSTRAINT branded_route_requests_pkey PRIMARY KEY (id);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: carriers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY carriers
    ADD CONSTRAINT carriers_pkey PRIMARY KEY (id);


--
-- Name: city_pairs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY city_pairs
    ADD CONSTRAINT city_pairs_pkey PRIMARY KEY (id);


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
-- Name: export_market_data_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY export_market_data_reports
    ADD CONSTRAINT export_market_data_reports_pkey PRIMARY KEY (id);


--
-- Name: export_smart_route_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY export_smart_route_reports
    ADD CONSTRAINT export_smart_route_reports_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


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
-- Name: possible_flights_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY possible_flights
    ADD CONSTRAINT possible_flights_pkey PRIMARY KEY (id);


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
-- Name: cnx_pairs_o_and_d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cnx_pairs_o_and_d ON cnx_pairs USING btree (report_key_id, origin, dest, origin_name, dest_name);


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
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_airlines_hosts_on_airline_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_airlines_hosts_on_airline_id ON airlines_hosts USING btree (airline_id);


--
-- Name: index_airlines_hosts_on_host_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_airlines_hosts_on_host_id ON airlines_hosts USING btree (host_id);


--
-- Name: index_airlines_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_airlines_on_code ON airlines USING btree (code);


--
-- Name: index_airlines_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_airlines_on_slug ON airlines USING btree (slug);


--
-- Name: index_airports_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_airports_on_code ON airports USING btree (code);


--
-- Name: index_airports_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_airports_on_slug ON airports USING btree (slug);


--
-- Name: index_app_controls_on_brand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_app_controls_on_brand_id ON app_controls USING btree (brand_id);


--
-- Name: index_app_controls_on_report_key_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_app_controls_on_report_key_id ON app_controls USING btree (report_key_id);


--
-- Name: index_brand_report_keys_on_brand_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_brand_report_keys_on_brand_id ON brand_report_keys USING btree (brand_id);


--
-- Name: index_brand_report_keys_on_report_key_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_brand_report_keys_on_report_key_id ON brand_report_keys USING btree (report_key_id);


--
-- Name: index_branded_route_requests_on_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_branded_route_requests_on_key ON branded_route_requests USING btree (key);


--
-- Name: index_brands_on_brand_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_brands_on_brand_key ON brands USING btree (brand_key);


--
-- Name: index_brands_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_brands_on_slug ON brands USING btree (slug);


--
-- Name: index_carriers_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_carriers_on_code ON carriers USING btree (code);


--
-- Name: index_carriers_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_carriers_on_slug ON carriers USING btree (slug);


--
-- Name: index_city_pairs_on_hub_and_orig_and_dest; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_city_pairs_on_hub_and_orig_and_dest ON city_pairs USING btree (hub, orig, dest);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_hubs_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_hubs_on_code ON hubs USING btree (code);


--
-- Name: index_hubs_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_hubs_on_slug ON hubs USING btree (slug);


--
-- Name: index_interline_cxr_rules_on_report_key_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_interline_cxr_rules_on_report_key_id ON interline_cxr_rules USING btree (report_key_id);


--
-- Name: index_oag_schedules_on_dest_apt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oag_schedules_on_dest_apt ON oag_schedules USING btree (dest_apt);


--
-- Name: index_oag_schedules_on_mkt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oag_schedules_on_mkt ON oag_schedules USING btree (mkt);


--
-- Name: index_oag_schedules_on_origin_apt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oag_schedules_on_origin_apt ON oag_schedules USING btree (origin_apt);


--
-- Name: index_possible_flights_on_hub_and_orig_and_dest; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_possible_flights_on_hub_and_orig_and_dest ON possible_flights USING btree (hub, orig, dest);


--
-- Name: index_report_keys_on_report_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_report_keys_on_report_key ON report_keys USING btree (report_key);


--
-- Name: index_report_keys_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_report_keys_on_slug ON report_keys USING btree (slug);


--
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON settings USING btree (thing_type, thing_id, var);


--
-- Name: oag_comp_mkt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_comp_mkt ON oag_schedules USING btree (origin_apt, dest_apt);


--
-- Name: oag_disc_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_disc_date ON oag_schedules USING btree (report_key_id, disc_date);


--
-- Name: oag_eff_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_eff_date ON oag_schedules USING btree (report_key_id, eff_date);


--
-- Name: oag_eff_disc_dates; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_eff_disc_dates ON oag_schedules USING btree (report_key_id, eff_date, disc_date);


--
-- Name: oag_flight_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_flight_id ON oag_schedules USING btree (airline_code, flight_num);


--
-- Name: oag_flight_id_time; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_flight_id_time ON oag_schedules USING btree (dep_time_local, flight_num);


--
-- Name: oag_origins; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX oag_origins ON oag_schedules USING btree (report_key_id, eff_date, disc_date, origin_apt, dep_time_local);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_3be8df1480; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT fk_rails_3be8df1480 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: fk_rails_538425cf32; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brand_report_keys
    ADD CONSTRAINT fk_rails_538425cf32 FOREIGN KEY (report_key_id) REFERENCES report_keys(id);


--
-- Name: fk_rails_a68c11e0aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT fk_rails_a68c11e0aa FOREIGN KEY (airline_id) REFERENCES airlines(id);


--
-- Name: fk_rails_a8b0cd38f8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines_hosts
    ADD CONSTRAINT fk_rails_a8b0cd38f8 FOREIGN KEY (host_id) REFERENCES hosts(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140101000000');

INSERT INTO schema_migrations (version) VALUES ('20140102002000');

INSERT INTO schema_migrations (version) VALUES ('20140102002100');

INSERT INTO schema_migrations (version) VALUES ('20140102002200');

INSERT INTO schema_migrations (version) VALUES ('20140103000010');

INSERT INTO schema_migrations (version) VALUES ('20140103000012');

INSERT INTO schema_migrations (version) VALUES ('20140103000015');

INSERT INTO schema_migrations (version) VALUES ('20140103000020');

INSERT INTO schema_migrations (version) VALUES ('20140103000025');

INSERT INTO schema_migrations (version) VALUES ('20140103000030');

INSERT INTO schema_migrations (version) VALUES ('20140103000035');

INSERT INTO schema_migrations (version) VALUES ('20140103000050');

INSERT INTO schema_migrations (version) VALUES ('20140103000150');

INSERT INTO schema_migrations (version) VALUES ('20140103000175');

INSERT INTO schema_migrations (version) VALUES ('20140103000200');

INSERT INTO schema_migrations (version) VALUES ('20140103000220');

INSERT INTO schema_migrations (version) VALUES ('20140103000230');

INSERT INTO schema_migrations (version) VALUES ('20140103000300');

INSERT INTO schema_migrations (version) VALUES ('20140103000500');

INSERT INTO schema_migrations (version) VALUES ('20140103000520');

INSERT INTO schema_migrations (version) VALUES ('20140103000530');

INSERT INTO schema_migrations (version) VALUES ('20140103000550');

INSERT INTO schema_migrations (version) VALUES ('20140103000580');

INSERT INTO schema_migrations (version) VALUES ('20140103001000');

INSERT INTO schema_migrations (version) VALUES ('20140940100000');

INSERT INTO schema_migrations (version) VALUES ('20150727000000');

INSERT INTO schema_migrations (version) VALUES ('20150727000030');

INSERT INTO schema_migrations (version) VALUES ('20150727000120');

INSERT INTO schema_migrations (version) VALUES ('20150727000160');

INSERT INTO schema_migrations (version) VALUES ('20150727000180');

INSERT INTO schema_migrations (version) VALUES ('20150727000200');

INSERT INTO schema_migrations (version) VALUES ('20150727000500');

