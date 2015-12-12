CREATE TABLE adresni_posta (
    id integer NOT NULL,
    psc integer,
    nazev character varying(255),
    plati_od timestamp without time zone,
    plati_do timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


CREATE SEQUENCE adresni_posta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ONLY adresni_posta ALTER COLUMN id SET DEFAULT nextval('adresni_posta_id_seq'::regclass);
ALTER TABLE ONLY adresni_posta
    ADD CONSTRAINT adresni_posta_pkey PRIMARY KEY (id);
