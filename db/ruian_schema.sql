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
    definicni_bod geometry,
    zachranka geometry,
    hasici geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);

CREATE TABLE rn_bonit_dily_parcel (
    parcela_id bigint,
    bpej_kod integer,
    vymera integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);

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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
CREATE TABLE rn_kraj_1960 (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    stat_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
CREATE TABLE rn_mop (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
CREATE TABLE rn_stat (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
CREATE TABLE rn_ulice (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_cara geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
CREATE TABLE rn_zpusob_ochrany_objektu (
    stavobj_kod integer,
    kod integer,
    zpusob_ochrany_kod integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);
CREATE TABLE rn_zpusob_ochrany_pozemku (
    kod integer,
    zpusob_ochrany_kod integer,
    parcela_id bigint,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
);
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
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);
ALTER TABLE ONLY rn_adresni_misto
    ADD CONSTRAINT rn_adresni_misto_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_cast_obce
    ADD CONSTRAINT rn_cast_obce_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_katastralni_uzemi
    ADD CONSTRAINT rn_katastralni_uzemi_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_kraj_1960
    ADD CONSTRAINT rn_kraj_1960_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_momc
    ADD CONSTRAINT rn_momc_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_mop
    ADD CONSTRAINT rn_mop_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_obec
    ADD CONSTRAINT rn_obec_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_okres
    ADD CONSTRAINT rn_okres_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_orp
    ADD CONSTRAINT rn_orp_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_parcela
    ADD CONSTRAINT rn_parcela_pkey PRIMARY KEY (id);
ALTER TABLE ONLY rn_pou
    ADD CONSTRAINT rn_pou_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_region_soudrznosti
    ADD CONSTRAINT rn_region_soudrznosti_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_spravni_obvod
    ADD CONSTRAINT rn_spravni_obvod_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_stat
    ADD CONSTRAINT rn_stat_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_stavebni_objekt
    ADD CONSTRAINT rn_stavebni_objekt_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_ulice
    ADD CONSTRAINT rn_ulice_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_vo
    ADD CONSTRAINT rn_vo_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_vusc
    ADD CONSTRAINT rn_vusc_pkey PRIMARY KEY (kod);
ALTER TABLE ONLY rn_zsj
    ADD CONSTRAINT rn_zsj_pkey PRIMARY KEY (kod);
CREATE INDEX rn_adresni_misto_adrp_psc_idx ON rn_adresni_misto USING btree (adrp_psc);
CREATE INDEX rn_adresni_misto_definicni_bod_idx ON rn_adresni_misto USING gist (definicni_bod);
CREATE INDEX rn_adresni_misto_hasici_idx ON rn_adresni_misto USING gist (hasici);
CREATE INDEX rn_adresni_misto_stavobj_kod_idx ON rn_adresni_misto USING btree (stavobj_kod);
CREATE INDEX rn_adresni_misto_ulice_kod_idx ON rn_adresni_misto USING btree (ulice_kod);
CREATE INDEX rn_adresni_misto_vo_kod_idx ON rn_adresni_misto USING btree (vo_kod);
CREATE INDEX rn_adresni_misto_zachranka_idx ON rn_adresni_misto USING gist (zachranka);
CREATE INDEX rn_bonit_dily_parcel_parcela_id_idx ON rn_bonit_dily_parcel USING btree (parcela_id);
CREATE INDEX rn_cast_obce_definicni_bod_idx ON rn_cast_obce USING gist (definicni_bod);
CREATE INDEX rn_cast_obce_hranice_idx ON rn_cast_obce USING gist (hranice);
CREATE INDEX rn_cast_obce_obec_kod_idx ON rn_cast_obce USING btree (obec_kod);
CREATE INDEX rn_detailni_tea_adresni_misto_kod_idx ON rn_detailni_tea USING btree (adresni_misto_kod);
CREATE INDEX rn_detailni_tea_stavobj_kod_idx ON rn_detailni_tea USING btree (stavobj_kod);
CREATE INDEX rn_katastralni_uzemi_definicni_bod_idx ON rn_katastralni_uzemi USING gist (definicni_bod);
CREATE INDEX rn_katastralni_uzemi_hranice_idx ON rn_katastralni_uzemi USING gist (hranice);
CREATE INDEX rn_katastralni_uzemi_obec_kod_idx ON rn_katastralni_uzemi USING btree (obec_kod);
CREATE INDEX rn_kraj_1960_definicni_bod_idx ON rn_kraj_1960 USING gist (definicni_bod);
CREATE INDEX rn_kraj_1960_hranice_idx ON rn_kraj_1960 USING gist (hranice);
CREATE INDEX rn_kraj_1960_stat_kod_idx ON rn_kraj_1960 USING btree (stat_kod);
CREATE INDEX rn_momc_definicni_bod_idx ON rn_momc USING gist (definicni_bod);
CREATE INDEX rn_momc_hranice_idx ON rn_momc USING gist (hranice);
CREATE INDEX rn_momc_mop_kod_idx ON rn_momc USING btree (mop_kod);
CREATE INDEX rn_momc_obec_kod_idx ON rn_momc USING btree (obec_kod);
CREATE INDEX rn_momc_spravobv_kod_idx ON rn_momc USING btree (spravobv_kod);
CREATE INDEX rn_mop_definicni_bod_idx ON rn_mop USING gist (definicni_bod);
CREATE INDEX rn_mop_hranice_idx ON rn_mop USING gist (hranice);
CREATE INDEX rn_mop_obec_kod_idx ON rn_mop USING btree (obec_kod);
CREATE INDEX rn_obec_definicni_bod_idx ON rn_obec USING gist (definicni_bod);
CREATE INDEX rn_obec_hranice_idx ON rn_obec USING gist (hranice);
CREATE INDEX rn_obec_okres_kod_idx ON rn_obec USING btree (okres_kod);
CREATE INDEX rn_obec_pou_kod_idx ON rn_obec USING btree (pou_kod);
CREATE INDEX rn_okres_definicni_bod_idx ON rn_okres USING gist (definicni_bod);
CREATE INDEX rn_okres_hranice_idx ON rn_okres USING gist (hranice);
CREATE INDEX rn_okres_kraj_1960_kod_idx ON rn_okres USING btree (kraj_1960_kod);
CREATE INDEX rn_okres_vusc_kod_idx ON rn_okres USING btree (vusc_kod);
CREATE INDEX rn_orp_definicni_bod_idx ON rn_orp USING gist (definicni_bod);
CREATE INDEX rn_orp_hranice_idx ON rn_orp USING gist (hranice);
CREATE INDEX rn_orp_spravni_obec_kod_idx ON rn_orp USING btree (spravni_obec_kod);
CREATE INDEX rn_orp_vusc_kod_idx ON rn_orp USING btree (vusc_kod);
CREATE INDEX rn_parcela_definicni_bod_idx ON rn_parcela USING gist (definicni_bod);
CREATE INDEX rn_parcela_druh_cislovani_kod_idx ON rn_parcela USING btree (druh_cislovani_kod);
CREATE INDEX rn_parcela_druh_pozemku_kod_idx ON rn_parcela USING btree (druh_pozemku_kod);
CREATE INDEX rn_parcela_hranice_idx ON rn_parcela USING gist (hranice);
CREATE INDEX rn_parcela_katuz_kod_idx ON rn_parcela USING btree (katuz_kod);
CREATE INDEX rn_parcela_zpusob_vyu_poz_kod_idx ON rn_parcela USING btree (zpusob_vyu_poz_kod);
CREATE INDEX rn_pou_definicni_bod_idx ON rn_pou USING gist (definicni_bod);
CREATE INDEX rn_pou_hranice_idx ON rn_pou USING gist (hranice);
CREATE INDEX rn_pou_orp_kod_idx ON rn_pou USING btree (orp_kod);
CREATE INDEX rn_pou_spravni_obec_kod_idx ON rn_pou USING btree (spravni_obec_kod);
CREATE INDEX rn_region_soudrznosti_definicni_bod_idx ON rn_region_soudrznosti USING gist (definicni_bod);
CREATE INDEX rn_region_soudrznosti_hranice_idx ON rn_region_soudrznosti USING gist (hranice);
CREATE INDEX rn_region_soudrznosti_stat_kod_idx ON rn_region_soudrznosti USING btree (stat_kod);
CREATE INDEX rn_spravni_obvod_definicni_bod_idx ON rn_spravni_obvod USING gist (definicni_bod);
CREATE INDEX rn_spravni_obvod_hranice_idx ON rn_spravni_obvod USING gist (hranice);
CREATE INDEX rn_spravni_obvod_obec_kod_idx ON rn_spravni_obvod USING btree (obec_kod);
CREATE INDEX rn_spravni_obvod_spravni_momc_kod_idx ON rn_spravni_obvod USING btree (spravni_momc_kod);
CREATE INDEX rn_stavebni_objekt_cobce_kod_idx ON rn_stavebni_objekt USING btree (cobce_kod);
CREATE INDEX rn_stavebni_objekt_definicni_bod_idx ON rn_stavebni_objekt USING gist (definicni_bod);
CREATE INDEX rn_stavebni_objekt_hranice_idx ON rn_stavebni_objekt USING gist (hranice);
CREATE INDEX rn_stavebni_objekt_identifikacni_parcela_id_idx ON rn_stavebni_objekt USING btree (identifikacni_parcela_id);
CREATE INDEX rn_stavebni_objekt_momc_kod_idx ON rn_stavebni_objekt USING btree (momc_kod);
CREATE INDEX rn_stavebni_objekt_typ_kod_idx ON rn_stavebni_objekt USING btree (typ_kod);
CREATE INDEX rn_ulice_definicni_cara_idx ON rn_ulice USING gist (definicni_cara);
CREATE INDEX rn_ulice_obec_kod_idx ON rn_ulice USING btree (obec_kod);
CREATE INDEX rn_vo_definicni_bod_idx ON rn_vo USING gist (definicni_bod);
CREATE INDEX rn_vo_hranice_idx ON rn_vo USING gist (hranice);
CREATE INDEX rn_vo_momc_kod_idx ON rn_vo USING btree (momc_kod);
CREATE INDEX rn_vo_obec_kod_idx ON rn_vo USING btree (obec_kod);
CREATE INDEX rn_vusc_definicni_bod_idx ON rn_vusc USING gist (definicni_bod);
CREATE INDEX rn_vusc_hranice_idx ON rn_vusc USING gist (hranice);
CREATE INDEX rn_vusc_regsoudr_kod_idx ON rn_vusc USING btree (regsoudr_kod);
CREATE INDEX rn_zpusob_ochrany_objektu_stavobj_kod_idx ON rn_zpusob_ochrany_objektu USING btree (stavobj_kod);
CREATE INDEX rn_zpusob_ochrany_pozemku_parcela_id_idx ON rn_zpusob_ochrany_pozemku USING btree (parcela_id);
CREATE INDEX rn_zsj_definicni_bod_idx ON rn_zsj USING gist (definicni_bod);
CREATE INDEX rn_zsj_hranice_idx ON rn_zsj USING gist (hranice);
CREATE INDEX rn_zsj_katuz_kod_idx ON rn_zsj USING btree (katuz_kod);
