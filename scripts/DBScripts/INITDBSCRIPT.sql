--
-- PostgreSQL database dump CREATE_SAAS_DB
--
-- DROP DATABASE IF EXISTS "SAAS";

CREATE DATABASE "VAAS"
  WITH ENCODING='UTF8'
       CONNECTION LIMIT=-1;

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

\c "VAAS";

--
-- Name: common; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA common;


ALTER SCHEMA common OWNER TO postgres;

--
-- Name: kony; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA comPany;


ALTER SCHEMA comPany OWNER TO postgres;

--
-- PostgreSQL database dump CREATE_TENANT_LOCAL_DB
--
-- DROP DATABASE IF EXISTS "TENANT";

CREATE DATABASE "TUNA"
  WITH ENCODING='UTF8'
       CONNECTION LIMIT=-1;

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

\c "TUNA";