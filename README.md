# mikrotik_country_addresslist_generator
chmox +x addresslist*

./addresslist_install.sh

./addresslist_generator.sh
___

## Mikrotik script
/tool fetch url="https://raw.githubusercontent.com/zzeesstt/mikrotik_country_addresslist_generator/main/address_list_ru_pl.src" mode=https

/import address_list_ru_pl.src

/file remove address_list_ru_pl.src

