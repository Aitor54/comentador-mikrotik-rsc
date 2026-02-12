# 2026-02-03 16:55:00 by RouterOS 7.20.4
# model = RBMetalG-52SHPacn
# Senior Network Engineer Review - APMT Project

########## SECCIÓN: TÚNELES L2 (EOIP) ##########
# QUÉ HACE: Crea un túnel de Nivel 2 (Ethernet over IP) encapsulado en IP hacia el CRS.
# UTILIDAD: Permite extender el dominio de colisión Ethernet de la infraestructura central hasta la grúa.
# SI FALTA: La grúa no podrá participar en las VLANs industriales gestionadas por el CRS central.
/interface eoip
add keepalive=10s,3 local-address=192.168.30.102 loop-protect=off \
    mac-address=FE:14:76:89:5C:82 name=IF-EOIP-CRS remote-address=\
    192.168.30.100 tunnel-id=102

########## SECCIÓN: ETIQUETADO VLAN (CAPA 2) ##########
# QUÉ HACE: Define las subinterfaces lógicas (VLAN 10 y 20) sobre el túnel EOIP.
# UTILIDAD: Separa el tráfico de Control (OT) del tráfico de Gestión (N4) dentro del túnel.
# SI FALTA: El tráfico llegaría sin etiqueta, mezclando datos críticos de PLC con tráfico administrativo.
/interface vlan
add interface=IF-EOIP-CRS name=IF-VLAN10-OT vlan-id=10
add interface=IF-VLAN20-N4 vlan-id=20

########## SECCIÓN: REDUNDANCIA VRRP ##########
# QUÉ HACE: Configura el protocolo de redundancia de gateway para las VLANs internas.
# UTILIDAD: Permite que dos antenas compartan una IP virtual; si una falla, la otra asume el tráfico.
# SI FALTA: Un fallo en esta unidad dejaría a la grúa sin gateway, deteniendo la operación.
/interface vrrp
add group-authority=self interface=IF-VLAN10-OT interval=5s name=\
    IF-VRRP-VLAN10-INT priority=200 vrid=10
add group-authority=self interface=IF-VLAN20-N4 interval=5s name=\
    IF-VRRP-VLAN20-INT priority=200 vrid=20

########## SECCIÓN: CLASIFICACIÓN DE INTERFACES ##########
# QUÉ HACE: Agrupa las interfaces en listas lógicas (Externas e Internas).
# UTILIDAD: Simplifica la creación de reglas de firewall al referenciar grupos en lugar de interfaces individuales.
# SI FALTA: Habría que crear reglas duplicadas para cada interfaz, aumentando la complejidad y errores.
/interface list
add name=VRRP-EXT
add name=VRRP-INT

/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no

########## SECCIÓN: SEGURIDAD INALÁMBRICA ##########
# QUÉ HACE: Define el perfil de cifrado WPA2-PSK para la conexión Wi-Fi.
# UTILIDAD: Garantiza la confidencialidad e integridad de los datos transmitidos por el aire.
# SI FALTA: La red quedaría abierta o con cifrado débil, vulnerable a ataques de interceptación.
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=RTG_AP supplicant-identity=MikroTik

########## SECCIÓN: INTERFAZ RADIO (WI-FI) ##########
# QUÉ HACE: Configura la radio física en 5GHz modo station-pseudobridge.
# UTILIDAD: Establece el enlace físico inalámbrico hacia los APs de la terminal.
# SI FALTA: No hay conectividad inalámbrica, la grúa queda aislada físicamente.
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=12 band=5ghz-a/n/ac country=\
    no_country_set disabled=no frequency=auto frequency-mode=superchannel \
    mode=station-pseudobridge radio-name=RTG080_ANT2 security-profile=RTG_AP \
    ssid=RTG_AP wireless-protocol=802.11

########## SECCIÓN: VLANs DE TRANSPORTE (WLAN) ##########
# QUÉ HACE: Crea las VLANs de transporte 8 y 9 sobre la interfaz inalámbrica física.
# UTILIDAD: Transporta el tráfico de datos segmentado por el aire.
# SI FALTA: Las IPs de servicio no tendrían interfaz base sobre la cual operar.
/interface vlan
add interface=wlan1 name=IF-VLAN8-N4 vlan-id=8
add interface=wlan1 name=IF-VLAN9-OT vlan-id=9
add interface=wlan1 name=IF-VLAN99 vlan-id=99

########## SECCIÓN: VRRP EXTERNO (FAILOVER ACTIVO) ##########
# QUÉ HACE: Gestiona la redundancia en el lado "aire" y dispara scripts al cambiar de estado.
# UTILIDAD: Asegura que solo la antena "Master" tenga activas ciertas IPs o servicios de red.
# SI FALTA: Podrían haber conflictos de IP duplicadas si ambas antenas intentan ser maestras simultáneamente.
/interface vrrp
add group-authority=IF-VRRP-VLAN20-INT interface=IF-VLAN8-N4 interval=5s \
    name=IF-VRRP-VLAN8-N4 on-backup=\
    "/ip address set [find where comment=\"CRS\"] disabled=yes" on-master=\
    "/ip address set [find where comment=\"CRS\"] disabled=no" priority=200 \
    vrid=215
add group-authority=IF-VRRP-VLAN10-INT interface=IF-VLAN9-OT interval=5s \
    name=IF-VRRP-VLAN9-OT priority=200 vrid=214

########## SECCIÓN: ACCIONES DE LOGGING ##########
# QUÉ HACE: Define destinos para los registros (Disco local y Servidor LibreNMS remoto).
# UTILIDAD: Permite auditoría y resolución de problemas (roaming logs) y monitoreo centralizado.
# SI FALTA: No habría registro de eventos históricos para detectar fallos intermitentes.
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

########## SECCIÓN: ASIGNACIÓN DE MIEMBROS A LISTAS ##########
# QUÉ HACE: Asocia las interfaces VRRP a las listas EXT e INT creadas anteriormente.
# UTILIDAD: Organiza el tráfico según su origen/destino (Externa/Interna).
# SI FALTA: Las reglas de firewall basadas en listas no tendrían efecto sobre estas interfaces.
/interface list member
add interface=IF-VRRP-VLAN8-N4 list=VRRP-EXT
add interface=IF-VLAN9-OT list=VRRP-EXT
add interface=IF-VLAN10-INT list=VRRP-INT
add interface=IF-VLAN20-INT list=VRRP-INT

/interface ovpn-server server
add auth=sha1,md5 mac-address=FE:5A:73:D9:38:0D name=ovpn-server1

########## SECCIÓN: LÓGICA DE CONEXIÓN FORZADA ##########
# QUÉ HACE: Determina a qué AP específico debe o no debe conectarse el equipo.
# UTILIDAD: Se utiliza por el script de roaming para "anclar" la conexión al mejor AP detectado.
# SI FALTA: El equipo podría conectarse a un AP con señal pobre si no se le obliga a cambiar.
/interface wireless connect-list
add comment=mejorAP interface=wlan1 mac-address=F4:1E:57:3B:DD:95
add comment=denegarTodo connect=no interface=wlan1

########## SECCIÓN: DIRECCIONAMIENTO IP ##########
# QUÉ HACE: Asigna las IPs estáticas y virtuales de gestión y operación.
# UTILIDAD: Establece la identidad de Capa 3 para todos los servicios (Winbox, SNMP, Comunicaciones PLC).
# SI FALTA: No hay comunicación IP; el equipo es invisible en la red.
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

########## SECCIÓN: FIREWALL FILTRO (SEGURIDAD PERIMETRAL) ##########
# QUÉ HACE: Define las reglas de denegación/permiso para el tráfico que entra, sale o atraviesa el router.
# UTILIDAD: Protege la infraestructura industrial eliminando tráfico no deseado y previniendo ataques.
# SI FALTA: El router queda vulnerable y el tráfico de broadcast/multicast innecesario podría saturar el enlace.
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

########## SECCIÓN: FIREWALL NAT (TRADUCCIÓN) ##########
# QUÉ HACE: Gestiona el enmascaramiento y la redirección de puertos (Dst-Nat).
# UTILIDAD: Permite el acceso a dispositivos internos (cámaras, PLC, VNC) desde la red externa usando una única IP.
# SI FALTA: Los servicios internos serán inaccesibles desde fuera de la propia grúa.
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

########## SECCIÓN: TABLA DE RUTAS (ENRUTAMIENTO) ##########
# QUÉ HACE: Indica al router qué camino tomar para llegar a redes fuera de su subred directa.
# UTILIDAD: Permite el tráfico hacia los servidores centrales, el NAS de backup y el CRS.
# SI FALTA: El router no sabría a dónde enviar los paquetes destinados a otras redes, perdiendo toda conectividad externa.
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

########## SECCIÓN: NOTA DE SISTEMA ##########
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

########## SECCIÓN: TAREAS PROGRAMADAS (SCHEDULER) ##########
# QUÉ HACE: Automatiza la ejecución periódica de scripts críticos.
# UTILIDAD: Lanza el chequeo de roaming cada 10s, la actualización de umbrales cada 30s y el backup semanal.
# SI FALTA: Las funciones inteligentes de la grúa (roaming, autoconfiguración, backups) dejarían de funcionar.
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

########## SECCIÓN: SCRIPTS LÓGICOS ##########
# QUÉ HACE: Contiene la inteligencia de red para roaming y mantenimiento.
# UTILIDAD: Permite al equipo decidir de forma autónoma el mejor AP y realizar copias de seguridad.
# SI FALTA: El equipo perdería su capacidad de autogestión industrial.
/system script
add dont-require-permissions=no name=roaming owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" .
    # QUÉ HACE: Lógica principal de Roaming Activo para clientes Wi-Fi MikroTik. \n
    # UTILIDAD: Mantiene la grúa conectada al AP con mejor relación S/N y señal. \n
    "while (true) do={
        :global minimalStrength; :global minimalUpgrade; :global minimalSTN;
        :local wlanMonitor [/interface wireless monitor wlan1 once as-value];
        :local currentStrength (\$wlanMonitor->\"signal-strength\");
        :local currentAP (\$wlanMonitor->\"radio-name\");
        :local currentSTN (\$wlanMonitor->\"signal-to-noise\");
        :delay 1s;
        while ((\$currentStrength < \$minimalStrength) && (\$currentSTN < \$minimalSTN)) do={
            :local candidateAPs []; :local counter 0; :local currentScan; " .
            # ESCANEO EN SEGUNDO PLANO PARA NO CORTAR CONEXIÓN \n
            ":if ([/interface get wlan1 value-name=running] = true) do={
                :set \$currentScan ([/interface wireless scan wlan1 duration=5s background=yes as-value])
            } else={
                :set \$currentScan ([/interface wireless scan wlan1 duration=5s background=no as-value])
            };
            :foreach item in=\$currentScan do={
                :if (\$item->\"ssid\" = \"RTG_AP\") do={
                    :set (\$candidateAPs->\$counter) {ap=\$item->\"radio-name\"; mac=\$item->\"address\"; signal=\$item->\"sig\"};
                    :set \$counter (\$counter + 1);
                }
            };
            :if ([:len \$candidateAPs] > 0) do={
                :local bestSignal; :local bestAPindex;
                :for i from=0 to=([:len \$candidateAPs] - 1) do={
                    :local sig ((\$candidateAPs->\$i)->\"signal\");
                    :if ((\$sig > \$bestSignal) || (\$i = 0)) do={
                        :set \$bestSignal \$sig; :set \$bestAPindex \$i;
                    }
                }; " .
                # EVALUACIÓN DE SI EL CAMBIO MERECE LA PENA (HISTÉRESIS) \n
                ":local diff (\$bestSignal - \$currentStrength);
                :if (\$diff >= \$minimalUpgrade) do={
                    :log info \"ROAMING: Saltando a AP \".((\$candidateAPs->\$bestAPindex)->\"ap\").\" (Mejora: \".\$diff.\"dB)\";
                    /interface wireless connect-list remove [find comment=\"mejorAP\"];
                    /interface wireless connect-list add mac-address=((\$candidateAPs->\$bestAPindex)->\"mac\") comment=\"mejorAP\" interface=wlan1;
                    :delay 10s;
                }
            };
            :set \$wlanMonitor [/interface wireless monitor wlan1 once as-value];
            :set \$currentStrength (\$wlanMonitor->\"signal-strength\");
        }
    }")

add dont-require-permissions=no name=updateSignalValues owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" .
    # QUÉ HACE: Descarga umbrales de roaming desde el NAS central. \n
    # UTILIDAD: Permite ajustar la sensibilidad del roaming en toda la flota desde un solo fichero. \n
    ":do {
        /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/BKIdeltec/Scripting/ROAMING/minimalSignal.txt\";
        :global minimalStrength [/file/get minimalSignal.txt contents];
    } on-error={ :global minimalStrength -65 };
    :do {
        /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/BKIdeltec/Scripting/ROAMING/minimalUpgrade.txt\";
        :global minimalUpgrade [/file/get minimalUpgrade.txt contents];
    } on-error={ :global minimalUpgrade 5 };")

add dont-require-permissions=no name=backupToNAS owner=ideltec policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" .
    # QUÉ HACE: Exporta configuración RSC y Backup binario al NAS. \n
    # UTILIDAD: Garantiza la recuperación ante desastres en menos de 5 minutos mediante sustitución de hardware. \n
    ":local ruta \"BKIdeltec/OT/RTG/RTG080/ANT2/\";
    :local nombre ([/system/clock/get date ] . \"-\" . [/system/identity/get name]);
    export file=(\$nombre . \".rsc\") show-sensitive;
    system backup save name=\$nombre;
    :delay 5;
    /tool fetch mode=sftp address=172.16.1.6 user=BackupCMS password=B4ckup.372 src-path=(\$nombre.\".rsc\") dst-path=(\$ruta.\$nombre.\".rsc\") upload=yes;
    /tool fetch mode=sftp address=172.16.1.6 user=BackupCMS password=B4ckup.372 src-path=(\$nombre.\".backup\") dst-path=(\$ruta.\$nombre.\".backup\") upload=yes;
    /file remove [find name~\$nombre];")

########## SECCIÓN: HERRAMIENTAS ADICIONALES ##########
/tool bandwidth-server
set enabled=no
/tool mac-server ping
set enabled=no
/tool romon
set enabled=yes


########## MEJORAS Y OPTIMIZACIONES SUGERIDAS ##########
# 1. SEGURIDAD: Cambiar puertos de gestión (Winbox, SSH) a puertos no estándar.
# 2. REDUNDANCIA: Ajustar tiempos de BFD para una detección de fallo aún más fina (<150ms).
# 3. MONITOREO: Implementar Health check via Netwatch para reiniciar interfaces LTE en caso de bloqueo.
# 4. EFICIENCIA: Agrupar reglas de Firewall NAT por tipo de servicio industrial (OT vs N4).
# 5. SCRIPTS: Añadir log de eventos SFTP para depurar fallos de backup hacia el NAS.
