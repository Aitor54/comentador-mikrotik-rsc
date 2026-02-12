# 2026-02-02 21:49:52 by RouterOS 7.20.4
# software id = QYJ8-2S1T
#
# model = RBMetalG-52SHPacn
# serial number = HJC0A0KT8GM
/interface eoip
add keepalive=10s,3 local-address=192.168.30.102 loop-protect=off \
    mac-address=FE:14:76:89:5C:82 name=IF-EOIP-CRS remote-address=\
    192.168.30.100 tunnel-id=102
/interface vlan
add interface=IF-EOIP-CRS name=IF-VLAN10-OT vlan-id=10
add interface=IF-EOIP-CRS name=IF-VLAN20-N4 vlan-id=20
/interface vrrp
add group-authority=self interface=IF-VLAN10-OT interval=5s name=\
    IF-VRRP-VLAN10-INT priority=200 vrid=10
add group-authority=self interface=IF-VLAN20-N4 interval=5s name=\
    IF-VRRP-VLAN20-INT priority=200 vrid=20
/interface list
add name=VRRP-EXT
add name=VRRP-INT
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=RTG_AP supplicant-identity=MikroTik
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=12 band=5ghz-a/n/ac country=\
    no_country_set disabled=no frequency=auto frequency-mode=superchannel \
    mode=station-pseudobridge radio-name=RTG080_ANT2 security-profile=RTG_AP \
    ssid=RTG_AP wireless-protocol=802.11
/interface vlan
add interface=wlan1 name=IF-VLAN8-N4 vlan-id=8
add interface=wlan1 name=IF-VLAN9-OT vlan-id=9
add interface=wlan1 name=IF-VLAN99 vlan-id=99
/interface vrrp
add group-authority=IF-VRRP-VLAN20-INT interface=IF-VLAN8-N4 interval=5s \
    name=IF-VRRP-VLAN8-N4 on-backup=\
    "/ip address set [find where comment=\"CRS\"] disabled=yes" on-master=\
    "/ip address set [find where comment=\"CRS\"] disabled=no" priority=200 \
    vrid=215
add group-authority=IF-VRRP-VLAN10-INT interface=IF-VLAN9-OT interval=5s \
    name=IF-VRRP-VLAN9-OT priority=200 vrid=214
/system logging action
add disk-file-count=10 disk-file-name=roamingLog disk-lines-per-file=60000 \
    name=roamingLogs target=disk
add name=LibreNMS remote=172.17.1.207 target=remote
/ip firewall connection tracking
set enabled=yes udp-timeout=10s
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=8192
/interface list member
add interface=IF-VRRP-VLAN8-N4 list=VRRP-EXT
add interface=IF-VRRP-VLAN9-OT list=VRRP-EXT
add interface=IF-VRRP-VLAN10-INT list=VRRP-INT
add interface=IF-VRRP-VLAN20-INT list=VRRP-INT
/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:5A:73:D9:38:0D name=ovpn-server1
/interface wireless connect-list
add comment=mejorAP interface=wlan1 mac-address=F4:1E:57:3B:DD:95
add comment=denegarTodo connect=no interface=wlan1
/ip address
add address=172.20.0.180/23 interface=IF-VLAN99 network=172.20.0.0
add address=192.168.30.102 interface=lo network=192.168.30.102
add address=192.168.0.252/29 interface=ether1 network=192.168.0.248
add address=192.168.0.242/29 interface=IF-VLAN20-N4 network=192.168.0.240
add address=172.20.1.180/23 comment=CRS interface=IF-VLAN99 network=\
    172.20.0.0
add address=192.168.10.242/29 interface=IF-VLAN10-OT network=192.168.10.240
add address=192.168.10.1/24 interface=IF-VRRP-VLAN10-INT network=192.168.10.0
add address=192.168.0.109/24 interface=IF-VRRP-VLAN20-INT network=192.168.0.0
add address=127.0.0.1 interface=IF-VLAN9-OT network=127.0.0.1
add address=127.0.0.1 interface=IF-VLAN8-N4 network=127.0.0.1
add address=172.17.11.80/24 interface=IF-VRRP-VLAN9-OT network=172.17.11.0
add address=10.34.49.80/25 interface=IF-VRRP-VLAN8-N4 network=10.34.49.0
/ip firewall filter
add action=fasttrack-connection chain=forward comment=FASTTRACK \
    connection-state=established,related hw-offload=yes
add action=accept chain=input comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related
add action=accept chain=forward comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related
add action=accept chain=output comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related
add action=accept chain=input comment=PERMITIR_SSH dst-port=22 protocol=tcp
add action=accept chain=input comment=PERMITIR_NAS src-address=172.16.1.6
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=10.34.49.98
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=!10.34.49.0/25
add action=accept chain=input comment=PERMITIR_API dst-port=8728 protocol=tcp
add action=accept chain=input comment=PERMITIR_API_SSL dst-port=8729 \
    in-interface=IF-VLAN99 protocol=tcp
add action=accept chain=input comment=PERMITIR_NTP dst-port=123 protocol=udp
add action=accept chain=input comment=PERMITIR_SNMP dst-port=161 \
    in-interface=IF-VLAN99 protocol=udp
add action=accept chain=input comment=PERMITIR_VRRP protocol=vrrp
add action=accept chain=input comment=PERMITIR_ICMP protocol=icmp
add action=accept chain=input comment=PERMITIR_RED_INTERNA src-address=\
    192.168.0.0/24
add action=accept chain=input comment=PERMITIR_VNC dst-port=5900-5901 \
    protocol=tcp
add action=accept chain=forward comment=PERMITIR_NAT connection-nat-state=\
    dstnat src-address=!10.34.49.0/25
add action=accept chain=forward comment=PERMITIR_ICMP protocol=icmp
add action=accept chain=forward comment=DESDE_RTG_HACIA_FUERA src-address=\
    192.168.0.0/24
add action=accept chain=output comment=PERMITIR_NAS dst-address=172.16.1.6
add action=accept chain=output comment=PERMITIR_NTP dst-port=123 protocol=udp
add action=accept chain=output comment=PERMITIR_ICMP protocol=icmp
add action=accept chain=output comment=PERMITIR_SYSLOG dst-address=\
    172.17.1.207
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=!172.17.11.0/24
add action=accept chain=input comment=PERMITIR_MILESTONE src-address=\
    172.16.1.0/28
add action=accept chain=forward comment=PERMITIR_NAT connection-nat-state=\
    dstnat src-address=!172.17.11.0/24
add action=accept chain=forward comment=PERMITIR_L2TP_LTE dst-port=1701 \
    protocol=udp
add action=accept chain=input comment=PERMITIR_EOIP protocol=gre
add action=accept chain=output comment=PERMITIR_EOIP protocol=gre
add action=accept chain=forward comment=PERMITIR_RED_INTERNA out-interface=\
    IF-VRRP-VLAN9-OT src-address=192.168.10.0/24
add action=drop chain=input comment=DENEGAR_INPUT
add action=drop chain=forward comment=DENEGAR_FORWARD
add action=drop chain=output comment=DENEGAR_OUTPUT
/ip firewall nat
add action=masquerade chain=srcnat comment=MASQUERADE_SALIDA_VLAN8 \
    out-interface=IF-VRRP-VLAN8-N4
add action=masquerade chain=srcnat comment=MASQUERADE_LTE src-address=\
    192.168.0.103
add action=masquerade chain=srcnat comment=MASQUERADE_SALIDA_VLAN9 \
    out-interface=IF-VRRP-VLAN9-OT
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5901 \
    protocol=tcp to-addresses=192.168.0.18 to-ports=5900
add action=dst-nat chain=dstnat comment=CRS dst-address=172.20.1.180 \
    to-addresses=192.168.30.100
add action=dst-nat chain=dstnat comment=SENSOR_FUEL dst-port=6164 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.35 \
    to-addresses=192.168.10.15 to-ports=6164
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_CARRO dst-port=8060 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.60 to-ports=80
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_PORTICO_NORTE dst-port=\
    8061 in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.61 to-ports=80
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_PORTICO_SUR dst-port=\
    8062 in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.62 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_CAM_CARRO dst-port=8060 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.60 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_CAM_PORTICO_NORTE dst-port=8061 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.61 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_CAM_PORTICO_SUR dst-port=8062 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.62 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_PLC dst-port=8010 in-interface=\
    IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.0/27 to-addresses=\
    192.168.10.10 to-ports=80
add action=dst-nat chain=dstnat comment=VNC_CMS dst-address=172.17.11.80 \
    dst-port=5900 in-interface=IF-VRRP-VLAN9-OT protocol=tcp to-addresses=\
    192.168.10.20 to-ports=5900
add action=dst-nat chain=dstnat comment=S7_PROTOCOL dst-port=102,502 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.35 \
    to-addresses=192.168.10.10
add action=dst-nat chain=dstnat comment=TABLET_PLC dst-port=1099 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=10.34.64.0/23 \
    to-addresses=192.168.10.10
add action=dst-nat chain=dstnat comment=IGNITION_SCADA dst-port=8088 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp to-addresses=192.168.10.20 \
    to-ports=8088
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5900 \
    in-interface=IF-VRRP-VLAN8-N4 protocol=tcp src-address=10.34.49.98 \
    to-addresses=192.168.0.18 to-ports=5900
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5900 \
    in-interface=IF-VRRP-VLAN8-N4 protocol=tcp src-address=!10.34.49.0/25 \
    to-addresses=192.168.0.18 to-ports=5900
add action=dst-nat chain=dstnat comment=GPS dst-port=2345 protocol=tcp \
    to-addresses=192.168.0.8 to-ports=2345
add action=dst-nat chain=dstnat comment=GPS dst-port=2346 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.8 to-ports=2346
add action=dst-nat chain=dstnat comment=GPS dst-port=2222 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.8 to-ports=22
add action=dst-nat chain=dstnat comment=GPS dst-port=1940 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=udp to-addresses=192.168.0.8 to-ports=1940
add action=dst-nat chain=dstnat comment=N4_PLC dst-port=501 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp src-address=!10.34.49.0/25 to-addresses=\
    192.168.0.2 to-ports=501
add action=dst-nat chain=dstnat comment=GPS dst-port=41100 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.2 to-ports=41100
add action=dst-nat chain=dstnat comment=GPS dst-port=1962 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.2 to-ports=1962
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/ip route
add dst-address=10.34.59.148/32 gateway=172.17.11.254
add disabled=no dst-address=10.34.0.0/16 gateway=10.34.49.99
add disabled=no dst-address=172.16.0.0/15 gateway=172.17.11.254
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=10.34.49.99 \
    routing-table=main scope=30 suppress-hw-offload=no target-scope=10
add disabled=no distance=1 dst-address=192.168.30.100/32 gateway=\
    192.168.0.250 pref-src=192.168.0.252 routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no dst-address=192.168.2.0/24 gateway=172.17.11.254 \
    routing-table=main suppress-hw-offload=no
add disabled=no dst-address=172.17.4.36/32 gateway=172.20.1.200 \
    routing-table=main suppress-hw-offload=no
add comment="CMS LTE Francis Gallardo Tablet" disabled=no distance=1 \
    dst-address=10.34.64.0/23 gateway=172.17.11.254 routing-table=main scope=\
    30 suppress-hw-offload=no target-scope=10
/ip service
set ftp disabled=yes
set telnet disabled=yes
set www disabled=yes
/ip ssh
set strong-crypto=yes
/ipv6 nd
set [ find default=yes ] disabled=yes
/routing bfd configuration
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5
/snmp
set enabled=yes location=RTG080 trap-version=2
/system clock
set time-zone-name=Europe/Madrid
/system identity
set name=RTG080_ANT2
/system logging
set 0 action=LibreNMS topics=info,!firewall
set 1 action=LibreNMS
set 2 action=LibreNMS
set 3 action=LibreNMS
add action=roamingLogs topics=debug,script
add topics=critical
add topics=error
add topics=info
add topics=warning
/system note
set note="  ___ _________  ___  _____                   _             _     \r\
    \n / _ \\| ___ |  \\/  | |_   _|                 (_)           | |    \r\
    \n/ /_\\ | |_/ | .  . |   | | ___ _ __ _ __ ___  _ _ __   __ _| |___ \r\
    \n|  _  |  __/| |\\/| |   | |/ _ | '__| '_ ` _ \\| | '_ \\ / _` | / __|\r\
    \n| | | | |   | |  | |   | |  __| |  | | | | | | | | | | (_| | \\__ \\\r\
    \n\\_____\\_|   \\_|  |_/   \\__\\___|_|  |_| |_| |_|_|_| |_|\\__,_|_|___/\
    \r\
    \n / _ \\| |               (_)                                       \r\
    \n/ /_\\ | | __ _  ___  ___ _ _ __ __ _ ___                          \r\
    \n|  _  | |/ _` |/ _ \\/ __| | '__/ _` / __|                         \r\
    \n| | | | | (_| |  __| (__| | | | (_| \\__ \\                         \r\
    \n\\_| |_|_|\\__, |\\___|\\___|_|_|  \\__,_|___/                         \
    \r\
    \n          __/ |                                                   \r\
    \n         |___/                                                    \r\
    \nATENCION\r\
    \nEste sistema es de uso exclusivo para personal autorizado.\r\
    \nTodos los accesos y actividades son registrados y monitoreados.\r\
    \nCualquier intento de acceso no autorizado sera reportado y \r\
    \npodria derivar en acciones legales.\r\
    \nSi no tiene autorizacion, desconectese de inmediato.\r\
    \n" show-at-cli-login=yes show-at-login=no
/system ntp client
set enabled=yes
/system ntp server
set enabled=yes
/system ntp client servers
add address=172.17.1.250
add address=192.168.0.109
/system routerboard settings
set auto-upgrade=yes
/system scheduler
add interval=10s name=roaming on-event=":local corriendo [/system/script/job/p\
    rint count-only where script=roaming]\r\
    \n:if (corriendo = 0) do={\r\
    \n/system/script/run roaming\r\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=30s name=updateSignalValues on-event=updateSignalValues policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=1w name=backupToNAS on-event=backupToNAS policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-03-04 start-time=03:45:00
/system script
add dont-require-permissions=no name=roaming owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_Script que permite a un cliente Wi-Fi realizar roaming entre puntos de a\
    cceso de una red Wi-Fi.\
    \n# Este script est\C3\A1 pensado para ser ejecutado en un RouterOS de Mik\
    rotik.\
    \n# Versi\C3\B3n BETA\
    \n# Guillermo Carri\C3\B3n Vega - 2025\
    \n\
    \nwhile (true) do={\
    \n    # Recoje los datos de la conexi\C3\B3n Wi-Fi actual.\
    \n    :global minimalStrength\
    \n    :global minimalUpgrade\
    \n    :global minimalSTN\
    \n    :local wlanMonitor [/interface wireless monitor wlan1 once as-value]\
    \n    :local currentStrength (\$wlanMonitor->\"signal-strength\")\
    \n    :local currentAP (\$wlanMonitor->\"radio-name\")\
    \n    :local currentSTN (\$wlanMonitor->\"signal-to-noise\")\
    \n    :local diferencia\
    \n    :delay 1s;\
    \n    while ((\$currentStrength < \$minimalStrength) && (\$currentSTN < \$\
    minimalSTN)) do={\
    \n        # Si la se\C3\B1al Wi-Fi es menor que el m\C3\ADnimo, se inicia \
    el proceso de roaming.\
    \n        :local candidateAPs []\
    \n        :local currentCCQ (((\$wlanMonitor->\"tx-ccq\") + (\$wlanMonitor\
    ->\"rx-ccq\"))/2)\
    \n        :local currentChannel (\$wlanMonitor->\"channel\")\
    \n        :local counter 0\
    \n        :local signalTester\
    \n        :local bestSignal\
    \n        :local bestAPindex\
    \n        :local currentScan\
    \n        :log debug \"ROAMING: La se\C3\B1al Wi-Fi ha ca\C3\ADdo por deba\
    jo del limite de calidad minima.\"\
    \n        :log debug (\"ROAMING: Datos actuales: | ap=\" . \$currentAP . \
    \" | channel=\" . \$currentChannel . \" | signal=\" . \$currentStrength . \
    \"dBm | stn=\" . \$currentSTN . \"dB | ccq=\" . \$currentCCQ . \"%\");\
    \n        :log debug \"ROAMING: Escanenado en busca de una mejor conexion.\
    \";\
    \n        :if ([/interface get wlan1 value-name=running] = true) do={\
    \n            # Si la interfaz Wi-Fi est\C3\A1 activa, se realiza un escan\
    eo en background de las conexiones disponibles.\
    \n            :set \$currentScan ([/interface wireless scan wlan1 duration\
    =10s background=yes as-value])\
    \n        } else={\
    \n            # Si la interfaz Wi-Fi no est\C3\A1 activa, se realiza un es\
    caneo en foreground de las conexiones disponibles.\
    \n            :set \$currentScan ([/interface wireless scan wlan1 duration\
    =10s background=no as-value])\
    \n        }\
    \n        :log debug \"ROAMING: Conexiones disponibles encontradas:\";\
    \n        :foreach item in=\$currentScan do={\
    \n            # Se recorre cada conexi\C3\B3n encontrada en el escaneo.\
    \n            :local scannedSSID (\$item->\"ssid\")\
    \n            :if (\$scannedSSID = \"RTG_AP\") do={\
    \n                # Si el SSID de la conexi\C3\B3n es \"RTG_AP\", se a\C3\
    \B1ade a la lista de conexiones candidatas.\
    \n                :local scannedID (\$item->\".id\")\
    \n                :local scannedAddress (\$item->\"address\")\
    \n                :local scannedChannel (\$item->\"channel\")\
    \n                :local scannedRadioName (\$item->\"radio-name\")\
    \n                :local scannedROS (\$item->\"routeros-version\")\
    \n                :local scannedStrength (\$item->\"sig\")\
    \n                :set (\$candidateAPs->\$counter) {ap=\$scannedRadioName;\
    \_mac=\$scannedAddress; signal=\$scannedStrength}\
    \n                :local valor (\$candidateAPs->\$counter)\
    \n                :set \$counter (\$counter + 1)\
    \n                :local texto \"ROAMING: \"\
    \n                :foreach k,v in=\$valor do={\
    \n                    # Se construye un mensaje de depuraci\C3\B3n con los\
    \_datos de cada AP candidato encontrado.\
    \n                    :set \$texto (\$texto . \"\$k=\$v; \")\
    \n                }\
    \n                :log debug \$texto\
    \n            }\
    \n        }\
    \n        :if ([:len \$candidateAPs] > 0) do={\
    \n            # Si se han encontrado conexiones candidatas, se procede a e\
    valuar cu\C3\A1l es la mejor.\
    \n            :for i from=0 to=([:len \$candidateAPs] - 1) do={\
    \n                # Se recorre la lista de conexiones candidatas.\
    \n                :set \$signalTester ((\$candidateAPs->\$i)->\"signal\")\
    \n                :if ((\$signalTester > \$bestSignal)||(\$i = 0)) do={\
    \n                    # Si la se\C3\B1al del AP candidato es mejor que la \
    mejor se\C3\B1al encontrada hasta ahora, se actualiza.\
    \n                    :set \$bestSignal \$signalTester\
    \n                    :set \$bestAPindex \$i \
    \n                }\
    \n            }\
    \n            :log debug (\"ROAMING: MEJOR AP: | ap=\". ((\$candidateAPs->\
    \$bestAPindex)->\"ap\") . \" | mac=\" . ((\$candidateAPs->\$bestAPindex)->\
    \"mac\") . \" | signal=\" . ((\$candidateAPs->\$bestAPindex)->\"signal\"))\
    ;\
    \n            :if (((\$candidateAPs->\$bestAPindex)->\"ap\") = \$currentAP\
    ) do={\
    \n                # Si el mejor AP candidato es el mismo al que ya est\C3\
    \A1 conectado, no se realiza ning\C3\BAn cambio.\
    \n                :log debug \"ROAMING: No se encuentra un AP mejor que el\
    \_ya conectado.\";\
    \n                :set \$wlanMonitor [/interface wireless monitor wlan1 on\
    ce as-value]\
    \n                :set \$currentStrength (\$wlanMonitor->\"signal-strength\
    \")\
    \n            } else={\
    \n                # Si se ha encontrado un mejor AP candidato, se eval\C3\
    \BAa si el cambio es significativo.\
    \n                :if (\$currentStrength) do={\
    \n                    # Si la se\C3\B1al actual es v\C3\A1lida, se calcula\
    \_la diferencia entre la se\C3\B1al del mejor AP candidato y la se\C3\B1al\
    \_actual.\
    \n                    :set \$bestSignal (\$bestSignal * -1);\
    \n                    :set \$currentStrength (\$currentStrength * -1);\
    \n                    :if (\$bestSignal > \$currentStrength) do={\
    \n                        # Si la se\C3\B1al del mejor AP candidato es may\
    or que la se\C3\B1al actual, se calcula la diferencia.\
    \n                        :set \$diferencia (\$bestSignal - \$currentStren\
    gth)\
    \n                    } else={\
    \n                        # Si la se\C3\B1al del mejor AP candidato es men\
    or que la se\C3\B1al actual, se calcula la diferencia de forma inversa.\
    \n                        :set \$diferencia (\$currentStrength - \$bestSig\
    nal)\
    \n                    }\
    \n                    :set \$diferencia (\$diferencia * -1)\
    \n                } else={\
    \n                    # Si la se\C3\B1al actual no es v\C3\A1lida, se asum\
    e una diferencia negativa por defecto.\
    \n                    :set \$diferencia -100\
    \n                }\
    \n                :set \$bestSignal (\$bestSignal * -1);\
    \n                :set \$currentStrength (\$currentStrength * -1);\
    \n                :if (\$diferencia <= \$minimalUpgrade) do={\
    \n                    # Si la diferencia entre la se\C3\B1al del mejor AP \
    candidato y la se\C3\B1al actual es mayor que la mejora m\C3\ADnima necesa\
    ria, se realiza el cambio. \
    \n                    # Recuerda que las se\C3\B1ales son negativas, por l\
    o que una diferencia de -4dBm es mejor que -3dBm en cuanto a la calidad de\
    \_se\C3\B1al que ganamos.\
    \n                    :log debug \"ROAMING: Se realiza un cambio de AP\";\
    \n                    :log debug \"ROAMING: ------------------------------\
    --------------------------------------------------\";\
    \n                    :log debug (\"ROAMING: Datos anteriores: | ap=\" . \
    \$currentAP . \" | channel=\" . \$currentChannel . \" | signal= \" . \$cur\
    rentStrength . \"dBm | stn=\" . \$currentSTN . \"dB | ccq=\" . \$currentCC\
    Q . \"%\");\
    \n                    :local conexionForzada [/interface wireless connect-\
    list find where comment=\"mejorAP\"]\
    \n                    :local conexionDenegada [/interface wireless connect\
    -list find where comment=\"denegarTodo\"]\
    \n                    :if ((\$conexionForzada = \"\")||(\$conexionDenegada\
    \_= \"\")) do={\
    \n                        # Si no existe una conexi\C3\B3n forzada o una c\
    onexi\C3\B3n denegada, se crea una nueva conexi\C3\B3n forzada con el mejo\
    r AP candidato.\
    \n                        /interface wireless connect-list remove [find]\
    \n                        /interface wireless connect-list add mac-address\
    =((\$candidateAPs->\$bestAPindex)->\"mac\") comment=\"mejorAP\" interface=\
    wlan1\
    \n                        /interface wireless connect-list add comment=den\
    egarTodo connect=no interface=wlan1\
    \n                    } else={\
    \n                        :local estadoConexionForzada [/interface/wireles\
    s/connect-list/get \$conexionForzada value-name=disabled ]\
    \n                        :local estadoConexionDenegada [/interface/wirele\
    ss/connect-list/get \$conexionDenegada value-name=disabled ]\
    \n                        :if ((\$estadoConexionForzada = true)||(\$estado\
    ConexionDenegada = true)) do={\
    \n                            # Si la conexi\C3\B3n forzada o la conexi\C3\
    \B3n denegada est\C3\A1n deshabilitadas, se habilitan.\
    \n                            /interface wireless connect-list set \$conex\
    ionForzada disabled=no\
    \n                            /interface wireless connect-list set \$conex\
    ionDenegada disabled=no\
    \n                        }\
    \n                        # Si ya existe una conexi\C3\B3n forzada, se act\
    ualiza la direcci\C3\B3n MAC de la conexi\C3\B3n forzada con el mejor AP c\
    andidato.\
    \n                        /interface wireless connect-list set \$conexionF\
    orzada mac-address=((\$candidateAPs->\$bestAPindex)->\"mac\")\
    \n                        /interface wireless connect-list set \$conexionD\
    enegada\
    \n                    }\
    \n                    :delay 10s;\
    \n                    :set \$wlanMonitor [/interface wireless monitor wlan\
    1 once as-value]\
    \n                    :set \$currentStrength (\$wlanMonitor->\"signal-stre\
    ngth\")\
    \n                    :set \$currentAP (\$wlanMonitor->\"radio-name\")\
    \n                    :set \$currentSTN (\$wlanMonitor->\"signal-to-noise\
    \")\
    \n                    :set \$currentChannel (\$wlanMonitor->\"channel\")\
    \n                    :set \$currentCCQ (((\$wlanMonitor->\"tx-ccq\") + (\
    \$wlanMonitor->\"rx-ccq\"))/2)\
    \n                    :log debug (\"ROAMING: Datos nuevos: | ap=\" . \$cur\
    rentAP . \" | channel=\" . \$currentChannel . \" | signal=\" . \$currentSt\
    rength . \"dBm | stn=\" . \$currentSTN . \"dB | ccq=\" . \$currentCCQ . \"\
    %\");\
    \n                    :log debug \"ROAMING: ------------------------------\
    --------------------------------------------------\";\
    \n                } else={\
    \n                    # Si la mejora no es significativa, se registra un m\
    ensaje de depuraci\C3\B3n y se mantiene la conexi\C3\B3n actual.\
    \n                    :log debug \"ROAMING: Hay un AP mejor, pero el cambi\
    o no es significativo\";\
    \n                    :log debug (\"ROAMING: Datos actuales: | ap=\" . \$c\
    urrentAP . \" | channel=\" . \$currentChannel . \" | signal=\" . \$current\
    Strength . \"dBm | stn=\" . \$currentSTN . \"dB | ccq=\" . \$currentCCQ . \
    \"%\");\
    \n                    :log debug (\"ROAMING: MEJOR AP: | ap=\". ((\$candid\
    ateAPs->\$bestAPindex)->\"ap\") . \" | mac=\" . ((\$candidateAPs->\$bestAP\
    index)->\"mac\") . \" | signal=\" . ((\$candidateAPs->\$bestAPindex)->\"si\
    gnal\"));\
    \n                    :log debug (\"ROAMING: Mejora maxima actual: \" . \$\
    diferencia . \"dBm de mejora.\");\
    \n                    :log debug (\"ROAMING: Mejora minima necesaria para \
    realizar el cambio: \" . \$minimalUpgrade . \"dBm de mejora.\");\
    \n                    :set \$wlanMonitor [/interface wireless monitor wlan\
    1 once as-value]\
    \n                    :set \$currentStrength (\$wlanMonitor->\"signal-stre\
    ngth\")\
    \n                }\
    \n            }\
    \n        } else={\
    \n            # Si no se han encontrado conexiones candidatas, se registra\
    \_un mensaje de depuraci\C3\B3n y se mantiene la conexi\C3\B3n actual.\
    \n            :log debug \"ROAMING: No se han encontrado conexiones Wi-Fi \
    disponibles.\";\
    \n            :set \$wlanMonitor [/interface wireless monitor wlan1 once a\
    s-value]\
    \n            :set \$currentStrength (\$wlanMonitor->\"signal-strength\")\
    \n        }\
    \n        :delay 1s;\
    \n    }\
    \n}\
    \n"
add dont-require-permissions=no name=updateSignalValues owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    do {\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/B\
    KIdeltec/Scripting/ROAMING/minimalSignal.txt\"\
    \n    :global minimalStrength [/file/get minimalSignal.txt contents]\
    \n} on-error={\
    \n    :global minimalStrength -59\
    \n}\
    \n:do {\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/B\
    KIdeltec/Scripting/ROAMING/minimalUpgrade.txt\"\
    \n    :global minimalUpgrade [/file/get minimalUpgrade.txt contents]\
    \n} on-error={\
    \n    :global minimalUpgrade -5\
    \n}\
    \n:do {\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/B\
    KIdeltec/Scripting/ROAMING/minimalSTN.txt\"\
    \n    :global minimalSTN [/file/get minimalSTN.txt contents]\
    \n} on-error={\
    \n    :global minimalSTN 45\
    \n}\
    \n\
    \n"
add dont-require-permissions=no name=backupToNAS owner=ideltec policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local ruta \"BKIdeltec/OT/RTG/RTG080/ANT2/\"\r\
    \n:local exportacion\r\
    \n:local exportacionConRSC\r\
    \n:local exportacionConBackup\r\
    \n\r\
    \n\r\
    \n:set \$exportacion ([/system/clock/get date ] . \" \" . [/system/identit\
    y/get name])\r\
    \n:set \$exportacionConRSC (\$exportacion . \".rsc\")\r\
    \n:set \$exportacionConBackup (\$exportacion . \".backup\")\r\
    \n\r\
    \nexport file=\$exportacion show-sensitive\r\
    \nsystem backup save name=\$exportacion\r\
    \n:delay 5\r\
    \n/tool fetch mode=sftp address=172.16.1.6 duration=1m user=BackupCMS pass\
    word=B4ckup.372  src-path=\$exportacionConRSC  dst-path=(\$ruta . \$export\
    acionConRSC) upload=yes\r\
    \n:delay 5\r\
    \n/tool fetch mode=sftp address=172.16.1.6 duration=1m user=BackupCMS pass\
    word=B4ckup.372  src-path=\$exportacionConBackup  dst-path=(\$ruta . \$exp\
    ortacionConBackup) upload=yes\r\
    \n:delay 5\r\
    \n/file remove [find name~\".rsc\"]\r\
    \n/file remove [find name~\".backup\"]"
/tool bandwidth-server
set enabled=no
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes
