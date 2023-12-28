# mikrotik_country_addresslist_generator
chmox +x addresslist*

./addresslist_install.sh

./addresslist_generator.sh
___

## Mikrotik comand
/tool fetch url="https://raw.githubusercontent.com/zzeesstt/mikrotik_country_addresslist_generator/main/address_list_ru_pl.src" mode=https

/import address_list_ru_pl.src

/file remove address_list_ru_pl.src

___
## Mikrotik autoupdate script RU\PL country
/system scheduler add interval=1d name=addresslist_ru_pl_update on-event=addresslist_ru_pl_update policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=2023-12-28 start-time=04:30:00

/system script add dont-require-permissions=no name=addresslist_ru_pl_update policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/tool fetch url=\"https://raw.githubusercontent.com/zzeesstt/mikrotik_country_addresslist_generator/main/address_list_ru_pl.src\" mode=https\r\
\n/import address_list_ru_pl.src\r\
\n/file remove address_list_ru_pl.src"