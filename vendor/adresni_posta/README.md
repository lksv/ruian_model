List of All PSC and it's "Nazvu pošt"
=====================================

It is downloaded from [cuzk.cz](http://www.cuzk.cz/Uvod/Produkty-a-sluzby/RUIAN/2-Poskytovani-udaju-RUIAN-ISUI-VDP/Ciselniky-ISUI/Atributy-adresniho-mista/Adresni-posty-pro-dorucovani.aspx?feed=RSS)

     curl 'http://www.cuzk.cz/CUZK/media/CiselnikyISUI/UI_ADRESNI_POSTA/UI_ADRESNI_POSTA.zip' |
       iconv -f windows-1250 -t utf-8 > UI_ADRESNI_POSTA.csv


This list is also available at [Zákaznické výstupy](https://www.ceskaposta.cz/ke-stazeni/zakaznicke-vystupy).
Particulary the link [Seznam PSČ částí obcí a obcí bez částí (zip, 302kB)](https://www.ceskaposta.cz/documents/10180/484271/db_pcobc.zip)

For load data to DB use:

     rake adresni_posta:load
