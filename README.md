# Mikrotik: точечный обход блокировок\формирование актуального списка сетей указанных стран 2024 

**+ За основу взят инструмент для экспорта BGB актуальной онлайн базы сетей**
 
**+ Адреслисты выгружаются в оперативную память**

Плюсы: не занимают место ПЗУ на устройствах с маленьким флеш

Минусы: адреслист пропадет при перезагрузке
___
### Установка\запуск, получение актульного списка сетей стран Ru\Pl
```
git clone --branch main https://github.com/zzeesstt/mikrotik_country_addresslist_generator.git

chmod +x addresslist*

./addresslist_install.sh

./addresslist_generator.sh
```

### Mikrotik: готовый скрипт автообновления для стран RU\PL используя файл репозитория
```
/system scheduler add interval=1d name=addresslist_ru_pl_update on-event=addresslist_ru_pl_update policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=2023-12-28 start-time=04:30:00

/system script add dont-require-permissions=no name=addresslist_ru_pl_update policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/tool fetch url=\"https://raw.githubusercontent.com/zzeesstt/mikrotik_country_addresslist_generator/main/address_list_ru_pl_cn.src\" mode=https\r\
\n/import address_list_ru_pl_cn.src\r\
\n/file remove address_list_ru_pl_cn.src"
```

### Mikrotik: описанме
```
# скачать скрипт на mikrotik
/tool fetch url="https://raw.githubusercontent.com/zzeesstt/mikrotik_country_addresslist_generator/main/address_list_ru_pl_cn.src" mode=https

# импортировать скрипт
/import address_list_ru_pl_cn.src

# удалить скрипт
/file remove address_list_ru_pl_cn.src

# создать кастомную таблицу марщрутизации "vpn"
/routing table add disabled=no fib name=vpn

# ловим интересующий нас трафик и засовываем его в таблицу "vpn" 
/ip firewall mangle add action=mark-routing chain=prerouting dst-address-list=ru dst-port=80,443 new-routing-mark=vpn passthrough=yes protocol=tcp

# создаем марщрут для кастомной таблицы "vpn", направляем трафик в VPN интерфейс
/ip route add comment="vpn" distance=1 dst-address=0.0.0.0/0 gateway=<VPN_INTERFACE> routing-table=vpn
```
### (tested ROS7)
### За основу взят проект https://github.com/furriest/radb-tools