ActiveRecord Models for RUIAN Objects in Postgres
-------------------------------------------------

RUIAN is [Registr územní identifikace, adres a
nemovitostí](http://www.cuzk.cz/ruian/RUIAN.aspx).

See document [Struktura a popis výměnného formátu RÚIAN (VFR)](http://www.cuzk.cz/Uvod/Produkty-a-sluzby/RUIAN/2-Poskytovani-udaju-RUIAN-ISUI-VDP/Vymenny-format-RUIAN/Vymenny-format-RUIAN-%28VFR%29/Struktura-a-popis-VFR-1_6_0.aspx)



This library defines basics (not all) models, e.g.:

* Vusc (Vyšší územně samosprávný celek)
* Okres
* Orp (Obec s rozšířenou působností)
* Pou (Pověřený obecní úřad)
* Obec
* CastObce
* Momc  (Městský obvod / městská část u statutárně členěných měst)
* KatastralniUzemi
* Parcela
* StavebniObjekt
* AdresniMisto

# Prerequirements

You have to have imported RUIAN data to Postgres:

## Create Database

     sudo -u postgres psql
     create database "ruian";
     create role ob with createdb login password 'ob';
     GRANT ALL PRIVILEGES ON DATABASE ruian TO ob;

## Enable Extension

     #DROP EXTENSION postgis CASCADE;
     psql -d ruian
     CREATE EXTENSION postgis;
     CREATE EXTENSION postgis_topology;

     #additional (not needed?)
     #CREATE EXTENSION fuzzystrmatch;
     #CREATE EXTENSION postgis_tiger_geocoder;

## Compile ruian2pgsql

     cd vendor/ruian2pgsql/
     sudo apt-get install openjdk-7-jdk
     sudo apt-get install maven
     mvn package


## Download RUIAN data

See [Dávkové zpracování obcí](http://freegis.fsv.cvut.cz/gwiki/RUIAN_/_GDAL#D.C3.A1vkov.C3.A9_zpracov.C3.A1n.C3.AD_obc.C3.AD)
following snippet is base upon this chapter.

```bash
wget 'http://www.cuzk.cz/CUZK/media/CiselnikyISUI/UI_OBEC/UI_OBEC.zip?ext=.zip' -O UI_OBEC.zip

# dekomprese na standardní výstup
zcat UI_OBEC.zip | \
  # vybrat první položku
cut -d';' -f1 | \
  # přeskočit první řádek (názvy položek)
sed 1d | \
  # přeskočit prázdné řádky
sed '/^\s*$/d' | \
  awk '{print "OB_"$1"_UKSH"}' > seznam_obce.txt

echo ST_UKSH >> seznam_obce.txt

mkdir -p RUIAN_DATA
cd RUIAN_DATA
DATE=$(date +%Y%m$(date -d "$(date +%m)/1 + 1 month - 1 day" "+%d"))
for I in $(cat ../seznam_obce.txt); do
  wget -N http://vdp.cuzk.cz/vymenny_format/soucasna/$DATE_${I}.xml.gz
done
```

## Convert RUIAN data to PostgreSQL database

     java -cp ruian2pgsql-1.6.0-jar-with-dependencies.jar \
       com.fordfrog.ruian2pgsql.App --create-tables --db-connection-url \
       'jdbc:postgresql://localhost/ruian?user=ob&password=ob' --input-dir \
       inputdir --convert-to-ewkt --ignore-invalid-gml

     cd vendor/ruian2pgsql/target
     java -cp ruian2pgsql-1.6.0-jar-with-dependencies.jar com.fordfrog.ruian2pgsql.App --db-connection-url 'jdbc:postgresql://localhost/ruian?user=ob&password=ob' --input-dir ../../RUIAN_DATA/ --convert-to-ewkt --ignore-invalid-gml --linearize-ewkt


# Backup RUIAN db, create schema, misc

You can create empty schema by:

     java -cp ruian2pgsql-1.6.0-jar-with-dependencies.jar com.fordfrog.ruian2pgsql.App --db-connection-url 'jdbc:postgresql://localhost/ruian?user=ob&password=ob' --input-dir .  --convert-to-ewkt --ignore-invalid-gml --linearize-ewkt --truncate-all

Dump whole ruian db:

     pg_dump -d ruian -U ob -Fc > ruian_all.dump  # 3,2G

Dump only some tables, to save space:

     pg_dump -d ruian -U ob -t 'rn_*' -T 'rn_parcela' -T rn_stavebni_objekt -T rn_adresni_misto -T rn_zpusob_ochrany_pozemku -T rn_bonit_dily_parcel -T rn_zsj -Fc > ruian.dump

Restore DB:

     sudo -u postgres psql
     create database "ruian";
     create role ob with createdb login password 'ob';
     GRANT ALL PRIVILEGES ON DATABASE ruian TO ob;
     \c ruian
     CREATE EXTENSION postgis;
     CREATE EXTENSION postgis_topology;

bash:

     pg_restore -d ruian ruian.dump

# How to use

     require 'ruian_models`
     RuianModles.setup

     # Now you can use all modles, e.g.:
     puts Obec.cont
