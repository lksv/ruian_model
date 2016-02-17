pg_dump -d ruian -t 'rn_*' -T 'rn_parcela' -T rn_stavebni_objekt -T rn_adresni_misto -T rn_zpusob_ochrany_pozemku -T rn_bonit_dily_parcel -T rn_zsj -Fc > ruian_part.dump

psql <<EOF
  create database "ruian_without_postgis";
  \c ruian_without_postgis
  CREATE EXTENSION postgis;
EOF

pg_restore -U ob -d ruian_without_postgis ruian_part.dump
rm ruian_part.dump

psql -d ruian_without_postgis <<EOF
  ALTER table rn_cast_obce DROP COLUMN definicni_bod;
  ALTER table rn_cast_obce DROP COLUMN hranice;
  ALTER table rn_katastralni_uzemi DROP COLUMN definicni_bod;
  ALTER table rn_katastralni_uzemi DROP COLUMN hranice;
  ALTER table rn_kraj_1960 DROP COLUMN definicni_bod;
  ALTER table rn_kraj_1960 DROP COLUMN hranice;
  ALTER table rn_momc DROP COLUMN definicni_bod;
  ALTER table rn_momc DROP COLUMN hranice;
  ALTER table rn_mop DROP COLUMN definicni_bod;
  ALTER table rn_mop DROP COLUMN hranice;
  ALTER table rn_obec DROP COLUMN definicni_bod;
  ALTER table rn_obec DROP COLUMN hranice;
  ALTER table rn_okres DROP COLUMN definicni_bod;
  ALTER table rn_okres DROP COLUMN hranice;
  ALTER table rn_orp DROP COLUMN definicni_bod;
  ALTER table rn_orp DROP COLUMN hranice;
  ALTER table rn_pou DROP COLUMN definicni_bod;
  ALTER table rn_pou DROP COLUMN hranice;
  ALTER table rn_region_soudrznosti DROP COLUMN definicni_bod;
  ALTER table rn_region_soudrznosti DROP COLUMN hranice;
  ALTER table rn_spravni_obvod DROP COLUMN definicni_bod;
  ALTER table rn_spravni_obvod DROP COLUMN hranice;
  ALTER table rn_stat DROP COLUMN definicni_bod;
  ALTER table rn_stat DROP COLUMN hranice;
  ALTER table rn_ulice DROP COLUMN definicni_cara;
  ALTER table rn_vo DROP COLUMN definicni_bod;
  ALTER table rn_vo DROP COLUMN hranice;
  ALTER table rn_vusc DROP COLUMN definicni_bod;
  ALTER table rn_vusc DROP COLUMN hranice;

  --drop extension
  DROP EXTENSION postgis;
EOF

pg_dump -d ruian_without_postgis --inserts > ruian_without_postgis.sql
bzip2 ruian_without_postgis.sql

