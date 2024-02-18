#!/bin/bash

#load new ru ip
cd radb-tools
./renew-db

python3 ./ip-country-ripe.py RU
python3 ./ip-country-ripe.py BY
python3 ./ip-country-ripe.py CN


echo /ip/firewall/address-list > address_list_ru_pl_cn.src
echo remove [find list=ru] >> address_list_ru_pl_cn.src
cat ip_RU.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru_pl_cn.src
cat ip_BY.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru_pl_cn.src
cat ip_CN.lst | xargs -I {} echo add address={} list=ru timeout=247d >> address_list_ru_pl_cn.src
mv address_list_ru_pl_cn.src ..