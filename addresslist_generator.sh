#!/bin/bash

#load new ru ip
cd radb-tools
./renew-db

python3 ./ip-country-ripe.py RU
python3 ./ip-country-ripe.py BY


echo /ip/firewall/address-list > address_list_ru_pl.src
echo remove [find list=ru] >> address_list_ru_pl.src
cat ip_RU.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru_pl.src
cat ip_BY.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru_pl.src
echo 'add address=159.138.192.0-159.138.207.255 list=ru timeout=247d comment="Huawai"' >> address_list_ru_pl.src
mv address_list_ru_pl.src ..