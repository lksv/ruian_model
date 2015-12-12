#!/bin/bash

DOWNLOAD_FROM="http://www.cuzk.cz/CUZK/media/CiselnikyISUI/UI_ADRESNI_POSTA/UI_ADRESNI_POSTA.zip"
DIR=$(dirname $0)

wget "$DOWNLOAD_FROM" -O UI_ADRESNI_POSTA.zip
unzip -o UI_ADRESNI_POSTA.zip
iconv -f windows-1250 -t utf-8 UI_ADRESNI_POSTA.csv | \
   # last line somtime contain a mess
  grep ';' > "${DIR}/UI_ADRESNI_POSTA.utf8.csv"

rm UI_ADRESNI_POSTA.csv UI_ADRESNI_POSTA.zip

