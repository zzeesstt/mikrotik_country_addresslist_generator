#!/bin/bash

#load new ru ip
./radb-tools/renew-db

python3 ./radb-tools/ip-country-ripe.py RU
python3 ./radb-tools/ip-country-ripe.py BY


echo /ip/firewall/address-list > address_list_ru.src
echo remove [find list=ru] >> address_list_ru.src
cat radb-tools/ip_RU.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru.src
cat radb-tools/ip_BY.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru.src