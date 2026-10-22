--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS tenis_tp1;
--
-- Name: tenis_tp1; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE tenis_tp1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-PT';


\connect tenis_tp1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: dim_jogador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_jogador (
    jogador_id integer NOT NULL,
    nome character varying(80) NOT NULL,
    pais character(3) NOT NULL,
    mao character(1)
);


--
-- Name: dim_torneio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_torneio (
    torneio_id character varying(20) NOT NULL,
    nome character varying(80) NOT NULL,
    superficie character varying(20),
    nivel character varying(20),
    cidade character varying(40),
    pais character varying(40),
    data_inicio date
);


--
-- Name: fact_alerta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fact_alerta (
    partida_id integer NOT NULL,
    torneio_nome character varying(80),
    ronda character varying(8),
    vencedor_nome character varying(80),
    pais_vencedor character(3),
    vencido_nome character varying(80),
    resultado character varying(40),
    motivo character varying(40)
);


--
-- Name: fact_partida; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fact_partida (
    partida_id integer NOT NULL,
    torneio_id character varying(20),
    torneio_nome character varying(80),
    data_partida date,
    ronda character varying(8),
    vencedor_id integer,
    vencedor_nome character varying(80),
    pais_vencedor character(3),
    vencido_id integer,
    vencido_nome character varying(80),
    pais_vencido character(3),
    resultado character varying(40),
    ranking_vencedor integer,
    ranking_vencido integer,
    upset integer,
    titulo integer
);


--
-- Name: resumo_jogador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resumo_jogador (
    jogador_id integer NOT NULL,
    nome character varying(80),
    pais character(3),
    vitorias integer,
    titulos integer
);


--
-- Data for Name: dim_jogador; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dim_jogador (jogador_id, nome, pais, mao) FROM stdin;
1	Jannik Sinner	ITA	R
2	Carlos Alcaraz	ESP	R
3	Novak Djokovic	SRB	R
4	Daniil Medvedev	RUS	R
5	Alexander Zverev	GER	R
6	Taylor Fritz	USA	R
7	Nuno   Borges	POR	R
8	Joao Sousa	POR	R
9	Andrey Rublev	RUS	R
10	Casper Ruud	NOR	R
11	Grigor Dimitrov	BUL	R
12	Tommy Paul	USA	R
\.


--
-- Data for Name: dim_torneio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dim_torneio (torneio_id, nome, superficie, nivel, cidade, pais, data_inicio) FROM stdin;
AO2024	Australian Open	Hard	Grand Slam	Melbourne	Australia	2024-01-14
ES2024	Millennium Estoril Open	Clay	ATP 250	Cascais	Portugal	2024-04-01
RG2024	Roland Garros	Clay	Grand Slam	Paris	France	2024-05-26
WI2024	Wimbledon	Grass	Grand Slam	London	United Kingdom	2024-07-01
UO2024	US Open	Hard	Grand Slam	New York	USA	2024-08-26
\.


--
-- Data for Name: fact_alerta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fact_alerta (partida_id, torneio_nome, ronda, vencedor_nome, pais_vencedor, vencido_nome, resultado, motivo) FROM stdin;
4	Australian Open	F	Jannik Sinner	ITA	Daniil Medvedev	3-6 3-6 6-4 6-4 6-3	final
5	Millennium Estoril Open	R32	Nuno   Borges	POR	Joao Sousa	6-4 6-4	jogador_por
6	Millennium Estoril Open	QF	Nuno   Borges	POR	Casper Ruud	7-6(5) 6-3	jogador_por
7	Millennium Estoril Open	SF	Nuno   Borges	POR	Grigor Dimitrov	6-3 3-6 6-4	jogador_por
8	Millennium Estoril Open	F	Andrey Rublev	RUS	Nuno   Borges	6-4 7-5	final
11	Roland Garros	F	Carlos Alcaraz	ESP	Alexander Zverev	6-3 2-6 5-7 6-1 6-2	final
14	Wimbledon	F	Carlos Alcaraz	ESP	Novak Djokovic	6-2 6-2 7-6(4)	final
15	US Open	R16	Nuno   Borges	POR	Grigor Dimitrov	6-4 6-7(3) 6-3 6-2	jogador_por
18	US Open	F	Jannik Sinner	ITA	Taylor Fritz	6-3 6-4 7-5	final
\.


--
-- Data for Name: fact_partida; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fact_partida (partida_id, torneio_id, torneio_nome, data_partida, ronda, vencedor_id, vencedor_nome, pais_vencedor, vencido_id, vencido_nome, pais_vencido, resultado, ranking_vencedor, ranking_vencido, upset, titulo) FROM stdin;
1	AO2024	Australian Open	2024-01-22	R16	1	Jannik Sinner	ITA	12	Tommy Paul	USA	6-4 6-2 6-3	4	14	0	0
2	AO2024	Australian Open	2024-01-24	QF	1	Jannik Sinner	ITA	9	Andrey Rublev	RUS	6-4 7-6(4) 6-3	4	5	0	0
3	AO2024	Australian Open	2024-01-26	SF	1	Jannik Sinner	ITA	3	Novak Djokovic	SRB	6-1 6-2 6-7(6) 6-3	4	1	0	0
4	AO2024	Australian Open	2024-01-28	F	1	Jannik Sinner	ITA	4	Daniil Medvedev	RUS	3-6 3-6 6-4 6-4 6-3	4	3	0	1
5	ES2024	Millennium Estoril Open	2024-04-02	R32	7	Nuno   Borges	POR	8	Joao Sousa	POR	6-4 6-4	45	160	0	0
6	ES2024	Millennium Estoril Open	2024-04-04	QF	7	Nuno   Borges	POR	10	Casper Ruud	NOR	7-6(5) 6-3	45	8	1	0
7	ES2024	Millennium Estoril Open	2024-04-06	SF	7	Nuno   Borges	POR	11	Grigor Dimitrov	BUL	6-3 3-6 6-4	45	10	1	0
8	ES2024	Millennium Estoril Open	2024-04-07	F	9	Andrey Rublev	RUS	7	Nuno   Borges	POR	6-4 7-5	6	45	0	1
9	RG2024	Roland Garros	2024-06-04	QF	2	Carlos Alcaraz	ESP	6	Taylor Fritz	USA	6-3 6-4 6-2	2	12	0	0
10	RG2024	Roland Garros	2024-06-07	SF	2	Carlos Alcaraz	ESP	1	Jannik Sinner	ITA	2-6 6-3 3-6 6-4 6-3	2	1	0	0
11	RG2024	Roland Garros	2024-06-09	F	2	Carlos Alcaraz	ESP	5	Alexander Zverev	GER	6-3 2-6 5-7 6-1 6-2	2	4	0	1
12	WI2024	Wimbledon	2024-07-10	QF	2	Carlos Alcaraz	ESP	12	Tommy Paul	USA	6-2 6-4 6-4	3	13	0	0
13	WI2024	Wimbledon	2024-07-12	SF	2	Carlos Alcaraz	ESP	4	Daniil Medvedev	RUS	7-6(1) 6-3 6-4	3	5	0	0
14	WI2024	Wimbledon	2024-07-14	F	2	Carlos Alcaraz	ESP	3	Novak Djokovic	SRB	6-2 6-2 7-6(4)	3	2	0	1
15	UO2024	US Open	2024-09-02	R16	7	Nuno   Borges	POR	11	Grigor Dimitrov	BUL	6-4 6-7(3) 6-3 6-2	40	9	1	0
16	UO2024	US Open	2024-09-04	QF	6	Taylor Fritz	USA	7	Nuno   Borges	POR	6-3 6-4 6-4	12	40	0	0
17	UO2024	US Open	2024-09-06	SF	1	Jannik Sinner	ITA	6	Taylor Fritz	USA	6-4 6-4 6-2	1	12	0	0
18	UO2024	US Open	2024-09-08	F	1	Jannik Sinner	ITA	6	Taylor Fritz	USA	6-3 6-4 7-5	1	12	0	1
\.


--
-- Data for Name: resumo_jogador; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resumo_jogador (jogador_id, nome, pais, vitorias, titulos) FROM stdin;
9	Andrey Rublev	RUS	1	1
7	Nuno   Borges	POR	4	0
6	Taylor Fritz	USA	1	0
1	Jannik Sinner	ITA	6	2
2	Carlos Alcaraz	ESP	6	2
\.


--
-- Name: dim_jogador dim_jogador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_jogador
    ADD CONSTRAINT dim_jogador_pkey PRIMARY KEY (jogador_id);


--
-- Name: dim_torneio dim_torneio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_torneio
    ADD CONSTRAINT dim_torneio_pkey PRIMARY KEY (torneio_id);


--
-- Name: fact_alerta fact_alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_alerta
    ADD CONSTRAINT fact_alerta_pkey PRIMARY KEY (partida_id);


--
-- Name: fact_partida fact_partida_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_partida
    ADD CONSTRAINT fact_partida_pkey PRIMARY KEY (partida_id);


--
-- Name: resumo_jogador resumo_jogador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resumo_jogador
    ADD CONSTRAINT resumo_jogador_pkey PRIMARY KEY (jogador_id);


--
-- PostgreSQL database dump complete
--

