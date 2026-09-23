--
-- PostgreSQL database dump
--

\restrict FTpcaiFMuqbwIMjbztTlhj4MjaA2Tl0wbyOQrjI916w22gPZ5eMT0Xo2KmhMx3N

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leads (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    company character varying(255),
    employees integer,
    budget numeric(12,2),
    interest text,
    score integer,
    priority character varying(20),
    status character varying(50) NOT NULL,
    action character varying(100),
    retry_required boolean DEFAULT false NOT NULL,
    error_message text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    business_need text,
    business_objective text,
    recommended_action character varying(100),
    questions jsonb,
    followup_subject text,
    followup_email text,
    followup_call_to_action text,
    followup_status character varying(30) DEFAULT 'not_generated'::character varying,
    followup_sent_at timestamp with time zone,
    followup_error text,
    idempotency_key character varying(255),
    followup_retry_count integer DEFAULT 0 NOT NULL,
    followup_last_attempt_at timestamp with time zone
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: leads leads_idempotency_key_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_idempotency_key_unique UNIQUE (idempotency_key);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict FTpcaiFMuqbwIMjbztTlhj4MjaA2Tl0wbyOQrjI916w22gPZ5eMT0Xo2KmhMx3N

