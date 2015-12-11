--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE ruian;
CREATE USER ob WITH PASSWORD 'ob';
--
-- Name: ruian; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ruian WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE ruian OWNER TO ob;

\connect ruian

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rn_adresni_misto; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_adresni_misto (
    kod integer NOT NULL,
    nespravny boolean,
    adrp_psc integer,
    ulice_kod integer,
    vo_kod integer,
    stavobj_kod integer,
    cislo_domovni integer,
    cislo_orientacni_hodnota integer,
    cislo_orientacni_pismeno character varying,
    id_trans_ruian bigint,
    plati_od date,
    zmena_grafiky boolean,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_adresni_misto OWNER TO ob;

--
-- Name: rn_bonit_dily_parcel; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_bonit_dily_parcel (
    parcela_id bigint,
    bpej_kod integer,
    vymera integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_bonit_dily_parcel OWNER TO ob;

--
-- Name: rn_cast_obce; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_cast_obce (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    id_trans_ruian bigint,
    zmena_grafiky boolean,
    plati_od date,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_cast_obce OWNER TO ob;

--
-- Name: rn_detailni_tea; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_detailni_tea (
    kod integer,
    stavobj_kod integer,
    adresni_misto_kod integer,
    nespravny boolean,
    pocet_bytu integer,
    pocet_podlazi integer,
    druh_konstrukce_kod integer,
    pripoj_kanal_sit_kod integer,
    pripoj_plyn_kod integer,
    pripoj_vodovod_kod integer,
    pripoj_el_energie boolean,
    zpusob_vytapeni_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_detailni_tea OWNER TO ob;

--
-- Name: rn_katastralni_uzemi; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_katastralni_uzemi (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    ma_dkm boolean,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    rizeni_id bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_katastralni_uzemi OWNER TO ob;

--
-- Name: rn_kraj_1960; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_kraj_1960 (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    stat_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_kraj_1960 OWNER TO ob;

--
-- Name: rn_momc; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_momc (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    mop_kod integer,
    spravobv_kod integer,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    zmena_grafiky boolean,
    vlajka_text character varying,
    vlajka_obrazek bytea,
    znak_text character varying,
    znak_obrazek bytea,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_momc OWNER TO ob;

--
-- Name: rn_mop; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_mop (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_mop OWNER TO ob;

--
-- Name: rn_obec; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_obec (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    okres_kod integer,
    pou_kod integer,
    nuts_lau character varying,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    zmena_grafiky boolean,
    cleneni_sm_rozsah_kod integer,
    cleneni_sm_typ_kod integer,
    status_kod integer,
    vlajka_text character varying,
    vlajka_obrazek bytea,
    znak_text character varying,
    znak_obrazek bytea,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_obec OWNER TO ob;

--
-- Name: rn_okres; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_okres (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    vusc_kod integer,
    kraj_1960_kod integer,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_okres OWNER TO ob;

--
-- Name: rn_orp; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_orp (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    vusc_kod integer,
    spravni_obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_orp OWNER TO ob;

--
-- Name: rn_parcela; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_parcela (
    id bigint NOT NULL,
    nespravny boolean,
    katuz_kod integer,
    druh_pozemku_kod integer,
    druh_cislovani_kod integer,
    kmenove_cislo integer,
    poddeleni_cisla integer,
    vymera_parcely bigint,
    id_trans_ruian bigint,
    zpusob_vyu_poz_kod integer,
    rizeni_id bigint,
    plati_od date,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_parcela OWNER TO ob;

--
-- Name: rn_pou; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_pou (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    orp_kod integer,
    spravni_obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_pou OWNER TO ob;

--
-- Name: rn_region_soudrznosti; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_region_soudrznosti (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    stat_kod integer,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_region_soudrznosti OWNER TO ob;

--
-- Name: rn_spravni_obvod; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_spravni_obvod (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    spravni_momc_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_spravni_obvod OWNER TO ob;

--
-- Name: rn_stat; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_stat (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_stat OWNER TO ob;

--
-- Name: rn_stavebni_objekt; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_stavebni_objekt (
    kod integer NOT NULL,
    nespravny boolean,
    identifikacni_parcela_id bigint,
    momc_kod integer,
    cobce_kod integer,
    budova_id bigint,
    cisla_domovni integer[],
    dokonceni date,
    je_vytah_kod integer,
    zmena_grafiky boolean,
    druh_konstrukce_kod integer,
    zmena_detailu boolean,
    obestaveny_prostor integer,
    pocet_bytu integer,
    pocet_podlazi integer,
    podlahova_plocha integer,
    pripoj_el_energie boolean,
    pripoj_kanal_sit_kod integer,
    pripoj_plyn_kod integer,
    pripoj_vodovod_kod integer,
    typ_kod integer,
    zastavena_plocha integer,
    zpusob_vytapeni_kod integer,
    zpusob_vyuziti_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_stavebni_objekt OWNER TO ob;

--
-- Name: rn_ulice; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_ulice (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_ulice OWNER TO ob;

--
-- Name: rn_vo; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_vo (
    kod integer NOT NULL,
    cislo integer,
    nespravny boolean,
    obec_kod integer,
    momc_kod integer,
    poznamka character varying,
    plati_od date,
    plati_do date,
    id_trans_ruian bigint,
    nz_id_globalni bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_vo OWNER TO ob;

--
-- Name: rn_vusc; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_vusc (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    regsoudr_kod integer,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_vusc OWNER TO ob;

--
-- Name: rn_zpusob_ochrany_objektu; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_zpusob_ochrany_objektu (
    stavobj_kod integer,
    kod integer,
    zpusob_ochrany_kod integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_zpusob_ochrany_objektu OWNER TO ob;

--
-- Name: rn_zpusob_ochrany_pozemku; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_zpusob_ochrany_pozemku (
    kod integer,
    zpusob_ochrany_kod integer,
    parcela_id bigint,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_zpusob_ochrany_pozemku OWNER TO ob;

--
-- Name: rn_zsj; Type: TABLE; Schema: public; Owner: ob; Tablespace: 
--

CREATE TABLE rn_zsj (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    katuz_kod integer,
    charakter_zsj_kod integer,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    vymera bigint,
    plati_od date,
    zmena_grafiky boolean,
    nz_id_globalni bigint,
    id_trans_ruian bigint,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE public.rn_zsj OWNER TO ob;

--
-- Data for Name: rn_adresni_misto; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_adresni_misto (kod, nespravny, adrp_psc, ulice_kod, vo_kod, stavobj_kod, cislo_domovni, cislo_orientacni_hodnota, cislo_orientacni_pismeno, id_trans_ruian, plati_od, zmena_grafiky, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_bonit_dily_parcel; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_bonit_dily_parcel (parcela_id, bpej_kod, vymera, id_trans_ruian, rizeni_id, deleted) FROM stdin;
\.


--
-- Data for Name: rn_cast_obce; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_cast_obce (kod, nazev, nespravny, obec_kod, mluv_char_pad_2, mluv_char_pad_3, mluv_char_pad_4, mluv_char_pad_5, mluv_char_pad_6, mluv_char_pad_7, id_trans_ruian, zmena_grafiky, plati_od, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_detailni_tea; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_detailni_tea (kod, stavobj_kod, adresni_misto_kod, nespravny, pocet_bytu, pocet_podlazi, druh_konstrukce_kod, pripoj_kanal_sit_kod, pripoj_plyn_kod, pripoj_vodovod_kod, pripoj_el_energie, zpusob_vytapeni_kod, id_trans_ruian, plati_od, nz_id_globalni, deleted) FROM stdin;
\.


--
-- Data for Name: rn_katastralni_uzemi; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_katastralni_uzemi (kod, nazev, nespravny, obec_kod, ma_dkm, mluv_char_pad_2, mluv_char_pad_3, mluv_char_pad_4, mluv_char_pad_5, mluv_char_pad_6, mluv_char_pad_7, id_trans_ruian, plati_od, nz_id_globalni, rizeni_id, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_kraj_1960; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_kraj_1960 (kod, nazev, nespravny, stat_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_momc; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_momc (kod, nazev, nespravny, obec_kod, mop_kod, spravobv_kod, mluv_char_pad_2, mluv_char_pad_3, mluv_char_pad_4, mluv_char_pad_5, mluv_char_pad_6, mluv_char_pad_7, zmena_grafiky, vlajka_text, vlajka_obrazek, znak_text, znak_obrazek, id_trans_ruian, plati_od, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_mop; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_mop (kod, nazev, nespravny, obec_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_obec; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_obec (kod, nazev, nespravny, okres_kod, pou_kod, nuts_lau, mluv_char_pad_2, mluv_char_pad_3, mluv_char_pad_4, mluv_char_pad_5, mluv_char_pad_6, mluv_char_pad_7, zmena_grafiky, cleneni_sm_rozsah_kod, cleneni_sm_typ_kod, status_kod, vlajka_text, vlajka_obrazek, znak_text, znak_obrazek, id_trans_ruian, plati_od, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_okres; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_okres (kod, nazev, nespravny, vusc_kod, kraj_1960_kod, id_trans_ruian, nuts_lau, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_orp; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_orp (kod, nazev, nespravny, vusc_kod, spravni_obec_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_parcela; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_parcela (id, nespravny, katuz_kod, druh_pozemku_kod, druh_cislovani_kod, kmenove_cislo, poddeleni_cisla, vymera_parcely, id_trans_ruian, zpusob_vyu_poz_kod, rizeni_id, plati_od, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_pou; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_pou (kod, nazev, nespravny, orp_kod, spravni_obec_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_region_soudrznosti; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_region_soudrznosti (kod, nazev, nespravny, stat_kod, id_trans_ruian, nuts_lau, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_spravni_obvod; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_spravni_obvod (kod, nazev, nespravny, obec_kod, spravni_momc_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_stat; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_stat (kod, nazev, nespravny, id_trans_ruian, nuts_lau, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_stavebni_objekt; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_stavebni_objekt (kod, nespravny, identifikacni_parcela_id, momc_kod, cobce_kod, budova_id, cisla_domovni, dokonceni, je_vytah_kod, zmena_grafiky, druh_konstrukce_kod, zmena_detailu, obestaveny_prostor, pocet_bytu, pocet_podlazi, podlahova_plocha, pripoj_el_energie, pripoj_kanal_sit_kod, pripoj_plyn_kod, pripoj_vodovod_kod, typ_kod, zastavena_plocha, zpusob_vytapeni_kod, zpusob_vyuziti_kod, id_trans_ruian, plati_od, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_ulice; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_ulice (kod, nazev, nespravny, obec_kod, id_trans_ruian, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_vo; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_vo (kod, cislo, nespravny, obec_kod, momc_kod, poznamka, plati_od, plati_do, id_trans_ruian, nz_id_globalni, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_vusc; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_vusc (kod, nazev, nespravny, regsoudr_kod, id_trans_ruian, nuts_lau, plati_od, nz_id_globalni, zmena_grafiky, item_timestamp, deleted) FROM stdin;
\.


--
-- Data for Name: rn_zpusob_ochrany_objektu; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_zpusob_ochrany_objektu (stavobj_kod, kod, zpusob_ochrany_kod, id_trans_ruian, rizeni_id, deleted) FROM stdin;
\.


--
-- Data for Name: rn_zpusob_ochrany_pozemku; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_zpusob_ochrany_pozemku (kod, zpusob_ochrany_kod, parcela_id, id_trans_ruian, rizeni_id, deleted) FROM stdin;
\.


--
-- Data for Name: rn_zsj; Type: TABLE DATA; Schema: public; Owner: ob
--

COPY rn_zsj (kod, nazev, nespravny, katuz_kod, charakter_zsj_kod, mluv_char_pad_2, mluv_char_pad_3, mluv_char_pad_4, mluv_char_pad_5, mluv_char_pad_6, mluv_char_pad_7, vymera, plati_od, zmena_grafiky, nz_id_globalni, id_trans_ruian, item_timestamp, deleted) FROM stdin;
\.


--
-- Name: rn_adresni_misto_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_adresni_misto
    ADD CONSTRAINT rn_adresni_misto_pkey PRIMARY KEY (kod);


--
-- Name: rn_cast_obce_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_cast_obce
    ADD CONSTRAINT rn_cast_obce_pkey PRIMARY KEY (kod);


--
-- Name: rn_katastralni_uzemi_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_katastralni_uzemi
    ADD CONSTRAINT rn_katastralni_uzemi_pkey PRIMARY KEY (kod);


--
-- Name: rn_kraj_1960_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_kraj_1960
    ADD CONSTRAINT rn_kraj_1960_pkey PRIMARY KEY (kod);


--
-- Name: rn_momc_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_momc
    ADD CONSTRAINT rn_momc_pkey PRIMARY KEY (kod);


--
-- Name: rn_mop_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_mop
    ADD CONSTRAINT rn_mop_pkey PRIMARY KEY (kod);


--
-- Name: rn_obec_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_obec
    ADD CONSTRAINT rn_obec_pkey PRIMARY KEY (kod);


--
-- Name: rn_okres_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_okres
    ADD CONSTRAINT rn_okres_pkey PRIMARY KEY (kod);


--
-- Name: rn_orp_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_orp
    ADD CONSTRAINT rn_orp_pkey PRIMARY KEY (kod);


--
-- Name: rn_parcela_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_parcela
    ADD CONSTRAINT rn_parcela_pkey PRIMARY KEY (id);


--
-- Name: rn_pou_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_pou
    ADD CONSTRAINT rn_pou_pkey PRIMARY KEY (kod);


--
-- Name: rn_region_soudrznosti_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_region_soudrznosti
    ADD CONSTRAINT rn_region_soudrznosti_pkey PRIMARY KEY (kod);


--
-- Name: rn_spravni_obvod_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_spravni_obvod
    ADD CONSTRAINT rn_spravni_obvod_pkey PRIMARY KEY (kod);


--
-- Name: rn_stat_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_stat
    ADD CONSTRAINT rn_stat_pkey PRIMARY KEY (kod);


--
-- Name: rn_stavebni_objekt_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_stavebni_objekt
    ADD CONSTRAINT rn_stavebni_objekt_pkey PRIMARY KEY (kod);


--
-- Name: rn_ulice_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_ulice
    ADD CONSTRAINT rn_ulice_pkey PRIMARY KEY (kod);


--
-- Name: rn_vo_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_vo
    ADD CONSTRAINT rn_vo_pkey PRIMARY KEY (kod);


--
-- Name: rn_vusc_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_vusc
    ADD CONSTRAINT rn_vusc_pkey PRIMARY KEY (kod);


--
-- Name: rn_zsj_pkey; Type: CONSTRAINT; Schema: public; Owner: ob; Tablespace: 
--

ALTER TABLE ONLY rn_zsj
    ADD CONSTRAINT rn_zsj_pkey PRIMARY KEY (kod);


--
-- Name: rn_adresni_misto_adrp_psc_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_adresni_misto_adrp_psc_idx ON rn_adresni_misto USING btree (adrp_psc);


--
-- Name: rn_adresni_misto_stavobj_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_adresni_misto_stavobj_kod_idx ON rn_adresni_misto USING btree (stavobj_kod);


--
-- Name: rn_adresni_misto_ulice_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_adresni_misto_ulice_kod_idx ON rn_adresni_misto USING btree (ulice_kod);


--
-- Name: rn_adresni_misto_vo_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_adresni_misto_vo_kod_idx ON rn_adresni_misto USING btree (vo_kod);


--
-- Name: rn_bonit_dily_parcel_parcela_id_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_bonit_dily_parcel_parcela_id_idx ON rn_bonit_dily_parcel USING btree (parcela_id);


--
-- Name: rn_cast_obce_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_cast_obce_obec_kod_idx ON rn_cast_obce USING btree (obec_kod);


--
-- Name: rn_detailni_tea_adresni_misto_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_detailni_tea_adresni_misto_kod_idx ON rn_detailni_tea USING btree (adresni_misto_kod);


--
-- Name: rn_detailni_tea_stavobj_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_detailni_tea_stavobj_kod_idx ON rn_detailni_tea USING btree (stavobj_kod);


--
-- Name: rn_katastralni_uzemi_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_katastralni_uzemi_obec_kod_idx ON rn_katastralni_uzemi USING btree (obec_kod);


--
-- Name: rn_kraj_1960_stat_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_kraj_1960_stat_kod_idx ON rn_kraj_1960 USING btree (stat_kod);


--
-- Name: rn_momc_mop_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_momc_mop_kod_idx ON rn_momc USING btree (mop_kod);


--
-- Name: rn_momc_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_momc_obec_kod_idx ON rn_momc USING btree (obec_kod);


--
-- Name: rn_momc_spravobv_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_momc_spravobv_kod_idx ON rn_momc USING btree (spravobv_kod);


--
-- Name: rn_mop_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_mop_obec_kod_idx ON rn_mop USING btree (obec_kod);


--
-- Name: rn_obec_okres_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_obec_okres_kod_idx ON rn_obec USING btree (okres_kod);


--
-- Name: rn_obec_pou_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_obec_pou_kod_idx ON rn_obec USING btree (pou_kod);


--
-- Name: rn_okres_kraj_1960_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_okres_kraj_1960_kod_idx ON rn_okres USING btree (kraj_1960_kod);


--
-- Name: rn_okres_vusc_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_okres_vusc_kod_idx ON rn_okres USING btree (vusc_kod);


--
-- Name: rn_orp_spravni_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_orp_spravni_obec_kod_idx ON rn_orp USING btree (spravni_obec_kod);


--
-- Name: rn_orp_vusc_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_orp_vusc_kod_idx ON rn_orp USING btree (vusc_kod);


--
-- Name: rn_parcela_druh_cislovani_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_parcela_druh_cislovani_kod_idx ON rn_parcela USING btree (druh_cislovani_kod);


--
-- Name: rn_parcela_druh_pozemku_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_parcela_druh_pozemku_kod_idx ON rn_parcela USING btree (druh_pozemku_kod);


--
-- Name: rn_parcela_katuz_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_parcela_katuz_kod_idx ON rn_parcela USING btree (katuz_kod);


--
-- Name: rn_parcela_zpusob_vyu_poz_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_parcela_zpusob_vyu_poz_kod_idx ON rn_parcela USING btree (zpusob_vyu_poz_kod);


--
-- Name: rn_pou_orp_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_pou_orp_kod_idx ON rn_pou USING btree (orp_kod);


--
-- Name: rn_pou_spravni_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_pou_spravni_obec_kod_idx ON rn_pou USING btree (spravni_obec_kod);


--
-- Name: rn_region_soudrznosti_stat_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_region_soudrznosti_stat_kod_idx ON rn_region_soudrznosti USING btree (stat_kod);


--
-- Name: rn_spravni_obvod_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_spravni_obvod_obec_kod_idx ON rn_spravni_obvod USING btree (obec_kod);


--
-- Name: rn_spravni_obvod_spravni_momc_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_spravni_obvod_spravni_momc_kod_idx ON rn_spravni_obvod USING btree (spravni_momc_kod);


--
-- Name: rn_stavebni_objekt_cobce_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_cobce_kod_idx ON rn_stavebni_objekt USING btree (cobce_kod);


--
-- Name: rn_stavebni_objekt_identifikacni_parcela_id_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_identifikacni_parcela_id_idx ON rn_stavebni_objekt USING btree (identifikacni_parcela_id);


--
-- Name: rn_stavebni_objekt_momc_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_momc_kod_idx ON rn_stavebni_objekt USING btree (momc_kod);


--
-- Name: rn_stavebni_objekt_typ_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_typ_kod_idx ON rn_stavebni_objekt USING btree (typ_kod);


--
-- Name: rn_ulice_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_ulice_obec_kod_idx ON rn_ulice USING btree (obec_kod);


--
-- Name: rn_vo_momc_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_vo_momc_kod_idx ON rn_vo USING btree (momc_kod);


--
-- Name: rn_vo_obec_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_vo_obec_kod_idx ON rn_vo USING btree (obec_kod);


--
-- Name: rn_vusc_regsoudr_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_vusc_regsoudr_kod_idx ON rn_vusc USING btree (regsoudr_kod);


--
-- Name: rn_zpusob_ochrany_objektu_stavobj_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_zpusob_ochrany_objektu_stavobj_kod_idx ON rn_zpusob_ochrany_objektu USING btree (stavobj_kod);


--
-- Name: rn_zpusob_ochrany_pozemku_parcela_id_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_zpusob_ochrany_pozemku_parcela_id_idx ON rn_zpusob_ochrany_pozemku USING btree (parcela_id);


--
-- Name: rn_zsj_katuz_kod_idx; Type: INDEX; Schema: public; Owner: ob; Tablespace: 
--

CREATE INDEX rn_zsj_katuz_kod_idx ON rn_zsj USING btree (katuz_kod);


--
-- PostgreSQL database dump complete
--

