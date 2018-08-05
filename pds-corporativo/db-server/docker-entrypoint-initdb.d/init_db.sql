--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2017-11-20 19:41:24 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2256 (class 1262 OID 16384)
-- Name: db_maisamo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_maisamo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE db_maisamo OWNER TO postgres;

\connect db_maisamo

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12431)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16385)
-- Name: acesso_pagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE acesso_pagina (
    id bigint NOT NULL,
    data_acesso date,
    hora_acesso time without time zone,
    pagina_id bigint
);


ALTER TABLE acesso_pagina OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16388)
-- Name: acesso_pagina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acesso_pagina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acesso_pagina_id_seq OWNER TO postgres;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 186
-- Name: acesso_pagina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE acesso_pagina_id_seq OWNED BY acesso_pagina.id;


--
-- TOC entry 187 (class 1259 OID 16390)
-- Name: alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alerta (
    id bigint NOT NULL,
    titulo character varying,
    mensagem character varying,
    categoria character varying,
    usuario_id bigint NOT NULL
);


ALTER TABLE alerta OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16396)
-- Name: alerta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alerta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alerta_id_seq OWNER TO postgres;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 188
-- Name: alerta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alerta_id_seq OWNED BY alerta.id;


--
-- TOC entry 193 (class 1259 OID 16443)
-- Name: contato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contato_id_seq OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16445)
-- Name: contato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contato (
    id bigint DEFAULT nextval('contato_id_seq'::regclass) NOT NULL,
    nome character varying NOT NULL,
    email character varying NOT NULL,
    fone character varying,
    usuario_id bigint NOT NULL
);


ALTER TABLE contato OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16511)
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16516)
-- Name: email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE email (
    id bigint DEFAULT nextval('email_id_seq'::regclass) NOT NULL,
    email character varying NOT NULL,
    contato_id bigint NOT NULL
);


ALTER TABLE email OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16474)
-- Name: envio_alerta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE envio_alerta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE envio_alerta_id_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16476)
-- Name: envio_alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE envio_alerta (
    id bigint DEFAULT nextval('envio_alerta_id_seq'::regclass) NOT NULL,
    data_envio date NOT NULL,
    hora_envio time without time zone NOT NULL,
    alerta_id bigint NOT NULL
);


ALTER TABLE envio_alerta OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16487)
-- Name: envio_alerta_contato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE envio_alerta_contato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE envio_alerta_contato_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16489)
-- Name: envio_alerta_contato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE envio_alerta_contato (
    id bigint DEFAULT nextval('envio_alerta_contato_id_seq'::regclass) NOT NULL,
    envio_alerta_id bigint NOT NULL,
    contato_id bigint NOT NULL
);


ALTER TABLE envio_alerta_contato OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16513)
-- Name: fone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fone_id_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16530)
-- Name: fone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fone (
    id bigint DEFAULT nextval('fone_id_seq'::regclass) NOT NULL,
    fone character varying NOT NULL,
    contato_id bigint NOT NULL
);


ALTER TABLE fone OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16398)
-- Name: pagina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pagina (
    id bigint NOT NULL,
    url character varying,
    data_expira date,
    hora_expira time without time zone,
    alerta_id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    contato_id bigint NOT NULL
);


ALTER TABLE pagina OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16404)
-- Name: pagina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pagina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pagina_id_seq OWNER TO postgres;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 190
-- Name: pagina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pagina_id_seq OWNED BY pagina.id;


--
-- TOC entry 192 (class 1259 OID 16434)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16426)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id bigint DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    nome character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    email character varying
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2097 (class 2604 OID 16407)
-- Name: acesso_pagina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acesso_pagina ALTER COLUMN id SET DEFAULT nextval('acesso_pagina_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 16406)
-- Name: alerta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta ALTER COLUMN id SET DEFAULT nextval('alerta_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 16408)
-- Name: pagina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina ALTER COLUMN id SET DEFAULT nextval('pagina_id_seq'::regclass);


--
-- TOC entry 2107 (class 2606 OID 16411)
-- Name: acesso_pagina acesso_pagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acesso_pagina
    ADD CONSTRAINT acesso_pagina_pkey PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 16413)
-- Name: alerta alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT alerta_pkey PRIMARY KEY (id);


--
-- TOC entry 2115 (class 2606 OID 16453)
-- Name: contato contato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 16523)
-- Name: email email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 16494)
-- Name: envio_alerta_contato envio_alerta_contato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio_alerta_contato
    ADD CONSTRAINT envio_alerta_contato_pkey PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 16481)
-- Name: envio_alerta envio_alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio_alerta
    ADD CONSTRAINT envio_alerta_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 16538)
-- Name: fone fone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fone
    ADD CONSTRAINT fone_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 2606 OID 16415)
-- Name: pagina pagina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina
    ADD CONSTRAINT pagina_pkey PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 16433)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 16416)
-- Name: acesso_pagina acesso_pagina_pagina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acesso_pagina
    ADD CONSTRAINT acesso_pagina_pagina_id_fkey FOREIGN KEY (pagina_id) REFERENCES pagina(id);


--
-- TOC entry 2125 (class 2606 OID 16459)
-- Name: alerta alerta_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT alerta_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2129 (class 2606 OID 16559)
-- Name: contato contato_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2133 (class 2606 OID 16549)
-- Name: email email_contato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_contato_id_fkey FOREIGN KEY (contato_id) REFERENCES contato(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2130 (class 2606 OID 16482)
-- Name: envio_alerta envio_alerta_alerta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio_alerta
    ADD CONSTRAINT envio_alerta_alerta_id_fkey FOREIGN KEY (alerta_id) REFERENCES alerta(id);


--
-- TOC entry 2132 (class 2606 OID 16500)
-- Name: envio_alerta_contato envio_alerta_contato_contato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio_alerta_contato
    ADD CONSTRAINT envio_alerta_contato_contato_id_fkey FOREIGN KEY (contato_id) REFERENCES contato(id) MATCH FULL;


--
-- TOC entry 2131 (class 2606 OID 16495)
-- Name: envio_alerta_contato envio_alerta_contato_envio_alerta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio_alerta_contato
    ADD CONSTRAINT envio_alerta_contato_envio_alerta_id_fkey FOREIGN KEY (envio_alerta_id) REFERENCES envio_alerta(id) MATCH FULL;


--
-- TOC entry 2134 (class 2606 OID 16554)
-- Name: fone fone_contato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fone
    ADD CONSTRAINT fone_contato_id_fkey FOREIGN KEY (contato_id) REFERENCES contato(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2126 (class 2606 OID 16421)
-- Name: pagina pagina_alerta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina
    ADD CONSTRAINT pagina_alerta_id_fkey FOREIGN KEY (alerta_id) REFERENCES alerta(id);


--
-- TOC entry 2127 (class 2606 OID 16469)
-- Name: pagina pagina_contato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina
    ADD CONSTRAINT pagina_contato_id_fkey FOREIGN KEY (contato_id) REFERENCES contato(id);


--
-- TOC entry 2128 (class 2606 OID 16464)
-- Name: pagina pagina_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pagina
    ADD CONSTRAINT pagina_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) MATCH FULL;


-- Completed on 2017-11-20 19:41:25 -03

--
-- PostgreSQL database dump complete
--

