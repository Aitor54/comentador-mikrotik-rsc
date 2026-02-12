################################################################################
##########   MANUAL TÉCNICO DE OPERACIÓN Y MANTENIMIENTO (1:1)   ###############
##########         CCR1009-7G-1C-1S+ (Identity: Desconocido)           ###############
################################################################################
# Analizando dispositivo... (Contexto Operacional N4)
# Integridad 1:1 garantizada. Cada línea comentada para diagnóstico rápido.

# feb/04/2026 09:58:30 by RouterOS 6.49.19
# software id = UFFE-BHWN
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F0A71EDA3

################################################################################
##########   SECCIÓN: /INTERFACE BRIDGE   ##########
################################################################################
/interface bridge
# QUÉ HACE: Configura parámetros específicos en /interface bridge.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add name=BR_VLAN5
add name=BR_VLAN8
add name=BR_VLAN50
add comment="--- AITOR" name=BR_VLAN99
add name=BR_VLAN1344
add name=BR_VLAN1401
add name=BR_VLAN1405
add name=BR_VLAN1408
add name=BR_VLAN1414
add name=Lo-QC10
add name=Lo-QC11
add name=Lo-QC12
add name=Lo-QC14
add name=Lo-QC15
add name=Lo-QC16
add name=Lo-QC17
add name=Lo-QC18
add name=Lo-QC19
add name=Lo-QC20
add name=Lo-QC21
add name=Lo-QC22
add name=Lo-QC23
add name=Lo-QC24
add name=Lo-QC25
add name=Lo-QC26
add name=Lo-QC27
add name=Lo-QC28
add name=Lo-QC29

################################################################################
##########   SECCIÓN: /INTERFACE ETHERNET   ##########
################################################################################
/interface ethernet
# QUÉ HACE: Configura parámetros específicos en /interface ethernet.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps

################################################################################
##########   SECCIÓN: /INTERFACE L2TP-SERVER   ##########
################################################################################
/interface l2tp-server
# QUÉ HACE: Configura parámetros específicos en /interface l2tp-server.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add name=IF-L2TP-LTE-ROUTER user=tunel-lte

################################################################################
##########   SECCIÓN: /INTERFACE VRRP   ##########
################################################################################
/interface vrrp
# QUÉ HACE: Implementa redundancia de puerta de enlace mediante una IP virtual compartida.
# UTILIDAD: Si esta antena falla, otra toma el control de forma transparente para permitir la continuidad operativa.
# SI FALTA: Un fallo en el hardware de red dejaría a la grúa totalmente inoperativa sin capacidad de failover.
add interface=BR_VLAN50 name=IF-VRRP-VLAN50 priority=250 vrid=0

################################################################################
##########   SECCIÓN: /INTERFACE EOIP   ##########
################################################################################
/interface eoip
# QUÉ HACE: Crea un túnel de Nivel 2 encapsulado en IP hacia la infraestructura central.
# UTILIDAD: Permite que la grúa se comporte como si estuviera conectada por cable al CRS, extendiendo VLANs industriales.
# SI FALTA: La grúa pierde toda comunicación de control y telemetría con el sistema de patio.
add keepalive=1s,3 local-address=172.19.10.241 loop-protect=off mac-address=\
    02:B4:F9:E4:EE:07 name=IF-EOIP-2011-QC10 remote-address=172.19.10.242 \
    tunnel-id=101
add keepalive=1s,3 local-address=172.19.11.241 loop-protect=off mac-address=\
    02:98:F9:BB:D5:B5 name=IF-EOIP-2011-QC11 remote-address=172.19.11.242 \
    tunnel-id=111
add keepalive=1s,3 local-address=172.19.12.241 loop-protect=off mac-address=\
    02:DE:35:96:F2:D1 name=IF-EOIP-2011-QC12 remote-address=172.19.12.242 \
    tunnel-id=121
add keepalive=1s,3 local-address=172.19.14.241 loop-protect=off mac-address=\
    FE:6E:32:58:77:31 name=IF-EOIP-2011-QC14 remote-address=172.19.14.242 \
    tunnel-id=141
add keepalive=1s,3 local-address=172.19.15.241 loop-protect=off mac-address=\
    FE:EA:90:0F:0E:52 name=IF-EOIP-2011-QC15 remote-address=172.19.15.242 \
    tunnel-id=151
add keepalive=1s,3 local-address=172.19.16.241 loop-protect=off mac-address=\
    FE:19:64:7B:6A:59 name=IF-EOIP-2011-QC16 remote-address=172.19.16.242 \
    tunnel-id=161
add keepalive=1s,3 local-address=172.19.17.241 loop-protect=off mac-address=\
    FE:A3:DF:50:F4:F3 name=IF-EOIP-2011-QC17 remote-address=172.19.17.242 \
    tunnel-id=171
add keepalive=1s,3 local-address=172.19.18.241 loop-protect=off mac-address=\
    FE:BB:6D:51:14:E5 name=IF-EOIP-2011-QC18 remote-address=172.19.18.242 \
    tunnel-id=181
add keepalive=1s,3 local-address=172.19.19.241 loop-protect=off mac-address=\
    FE:16:9A:24:C1:2D name=IF-EOIP-2011-QC19 remote-address=172.19.19.242 \
    tunnel-id=191
add keepalive=1s,3 local-address=172.19.20.241 loop-protect=off mac-address=\
    FE:E6:EF:14:F5:FE name=IF-EOIP-2011-QC20 remote-address=172.19.20.242 \
    tunnel-id=201
add keepalive=1s,3 local-address=172.19.21.241 loop-protect=off mac-address=\
    FE:11:79:AB:92:45 name=IF-EOIP-2011-QC21 remote-address=172.19.21.242 \
    tunnel-id=211
add keepalive=1s,3 local-address=172.19.22.241 loop-protect=off mac-address=\
    02:1C:B3:54:5F:85 name=IF-EOIP-2011-QC22 remote-address=172.19.22.242 \
    tunnel-id=221
add keepalive=1s,3 local-address=172.19.23.241 loop-protect=off mac-address=\
    FE:15:B7:58:90:21 name=IF-EOIP-2011-QC23 remote-address=172.19.23.242 \
    tunnel-id=231
add keepalive=1s,3 local-address=172.19.24.241 loop-protect=off mac-address=\
    FE:36:3C:EC:54:05 name=IF-EOIP-2011-QC24 remote-address=172.19.24.242 \
    tunnel-id=241
add keepalive=1s,3 local-address=172.19.25.241 loop-protect=off mac-address=\
    FE:86:AA:11:4B:A7 name=IF-EOIP-2011-QC25 remote-address=172.19.25.242 \
    tunnel-id=251
add keepalive=1s,3 local-address=172.19.26.241 loop-protect=off mac-address=\
    02:42:19:8B:34:FF name=IF-EOIP-2011-QC26 remote-address=172.19.26.242 \
    tunnel-id=261
add keepalive=1s,3 local-address=172.19.27.241 loop-protect=off mac-address=\
    FE:B7:39:1E:C9:85 name=IF-EOIP-2011-QC27 remote-address=172.19.27.242 \
    tunnel-id=271
add keepalive=1s,3 local-address=172.19.28.241 loop-protect=off mac-address=\
    02:98:B4:86:F3:8E name=IF-EOIP-2011-QC28 remote-address=172.19.28.242 \
    tunnel-id=281
add keepalive=1s,3 local-address=172.19.29.241 loop-protect=off mac-address=\
    02:68:56:B6:CA:53 name=IF-EOIP-2011-QC29 remote-address=172.19.29.242 \
    tunnel-id=291
add keepalive=1s,3 local-address=172.19.10.241 loop-protect=off mac-address=\
    02:B5:73:E5:ED:18 name=IF-EOIP-SOB-QC10 remote-address=172.19.10.243 \
    tunnel-id=102
add keepalive=1s,3 local-address=172.19.11.241 loop-protect=off mac-address=\
    02:E2:16:56:64:34 name=IF-EOIP-SOB-QC11 remote-address=172.19.11.243 \
    tunnel-id=112
add keepalive=1s,3 local-address=172.19.12.241 loop-protect=off mac-address=\
    02:B1:60:88:87:6B name=IF-EOIP-SOB-QC12 remote-address=172.19.12.243 \
    tunnel-id=122
add keepalive=1s,3 local-address=172.19.14.241 loop-protect=off mac-address=\
    FE:3D:B6:EA:F0:3C name=IF-EOIP-SOB-QC14 remote-address=172.19.14.243 \
    tunnel-id=142
add keepalive=1s,3 local-address=172.19.15.241 loop-protect=off mac-address=\
    FE:3C:79:36:C1:9C name=IF-EOIP-SOB-QC15 remote-address=172.19.15.243 \
    tunnel-id=152
add keepalive=1s,3 local-address=172.19.16.241 loop-protect=off mac-address=\
    FE:6E:A1:D1:B3:73 name=IF-EOIP-SOB-QC16 remote-address=172.19.16.243 \
    tunnel-id=162
add keepalive=1s,3 local-address=172.19.17.241 loop-protect=off mac-address=\
    FE:36:78:44:D2:E5 name=IF-EOIP-SOB-QC17 remote-address=172.19.17.243 \
    tunnel-id=172
add keepalive=1s,3 local-address=172.19.18.241 loop-protect=off mac-address=\
    FE:83:51:9B:6D:41 name=IF-EOIP-SOB-QC18 remote-address=172.19.18.243 \
    tunnel-id=182
add keepalive=1s,3 local-address=172.19.19.241 loop-protect=off mac-address=\
    FE:6A:E4:84:23:E3 name=IF-EOIP-SOB-QC19 remote-address=172.19.19.243 \
    tunnel-id=192
add keepalive=1s,3 local-address=172.19.20.241 loop-protect=off mac-address=\
    FE:66:32:78:9D:F3 name=IF-EOIP-SOB-QC20 remote-address=172.19.20.243 \
    tunnel-id=202
add keepalive=1s,3 local-address=172.19.21.241 loop-protect=off mac-address=\
    FE:22:57:B8:FE:1F name=IF-EOIP-SOB-QC21 remote-address=172.19.21.243 \
    tunnel-id=212
add keepalive=1s,3 local-address=172.19.22.241 loop-protect=off mac-address=\
    FE:9A:0C:E9:13:DB name=IF-EOIP-SOB-QC22 remote-address=172.19.22.243 \
    tunnel-id=222
add keepalive=1s,3 local-address=172.19.23.241 loop-protect=off mac-address=\
    FE:B2:FF:C2:84:B3 name=IF-EOIP-SOB-QC23 remote-address=172.19.23.243 \
    tunnel-id=232
add keepalive=1s,3 local-address=172.19.24.241 loop-protect=off mac-address=\
    FE:72:1B:0E:E3:20 name=IF-EOIP-SOB-QC24 remote-address=172.19.24.243 \
    tunnel-id=242
add keepalive=1s,3 local-address=172.19.25.241 loop-protect=off mac-address=\
    FE:3F:EB:3F:7A:74 name=IF-EOIP-SOB-QC25 remote-address=172.19.25.243 \
    tunnel-id=252
add keepalive=1s,3 local-address=172.19.26.241 loop-protect=off mac-address=\
    02:32:3D:36:06:CD name=IF-EOIP-SOB-QC26 remote-address=172.19.26.243 \
    tunnel-id=262
add keepalive=1s,3 local-address=172.19.27.241 loop-protect=off mac-address=\
    02:51:38:1D:BF:FA name=IF-EOIP-SOB-QC27 remote-address=172.19.27.243 \
    tunnel-id=272
add keepalive=1s,3 local-address=172.19.28.241 loop-protect=off mac-address=\
    02:E6:A0:4B:EB:1D name=IF-EOIP-SOB-QC28 remote-address=172.19.28.243 \
    tunnel-id=282
add keepalive=1s,3 local-address=172.19.29.241 loop-protect=off mac-address=\
    02:55:DA:36:60:AB name=IF-EOIP-SOB-QC29 remote-address=172.19.29.243 \
    tunnel-id=292

################################################################################
##########   SECCIÓN: /INTERFACE VLAN   ##########
################################################################################
/interface vlan
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN5-QC14-2011-OUT (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment="VLAN 5" interface=IF-EOIP-2011-QC14 name=IF-VLAN5-QC14-2011-OUT \
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 5).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    vlan-id=5
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC10-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC10 name=IF-VLAN8-QC10-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica \ (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment="-- AITOR" interface=IF-EOIP-2011-QC11 name=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    IF-VLAN8-QC11-2011-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC11-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC11 name=IF-VLAN8-QC11-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC12-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC12 name=IF-VLAN8-QC12-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica \ (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment="-- AITOR" interface=IF-EOIP-2011-QC14 name=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    IF-VLAN8-QC14-2011-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC14-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC14 name=IF-VLAN8-QC14-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC15-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC15 name=IF-VLAN8-QC15-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC16-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC16 name=IF-VLAN8-QC16-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC17-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC17 name=IF-VLAN8-QC17-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC18-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC18 name=IF-VLAN8-QC18-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC19-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC19 name=IF-VLAN8-QC19-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC20-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC20 name=IF-VLAN8-QC20-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC21-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC21 name=IF-VLAN8-QC21-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC22-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC22 name=IF-VLAN8-QC22-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC23-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC23 name=IF-VLAN8-QC23-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC24-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC24 name=IF-VLAN8-QC24-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC25-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC25 name=IF-VLAN8-QC25-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC26-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC26 name=IF-VLAN8-QC26-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC27-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC27 name=IF-VLAN8-QC27-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC28-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC28 name=IF-VLAN8-QC28-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-QC29-SOB-OUT (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-SOB-QC29 name=IF-VLAN8-QC29-SOB-OUT vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN50-QC11 (VLAN 50).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC11 name=IF-VLAN50-QC11 vlan-id=50
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN50-QC14 (VLAN 50).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC14 name=IF-VLAN50-QC14 vlan-id=50
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN99-QC11 (VLAN \).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=--AITOR interface=IF-EOIP-2011-QC11 name=IF-VLAN99-QC11 vlan-id=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    99
# QUÉ HACE: Segmenta el tráfico de la red lógica \ (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=--AITOR interface=IF-EOIP-2011-QC14 name=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 99).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    IF-VLAN99-RTG_TRACKING-OUT vlan-id=99
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC10-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1344-QC10-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC11-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1344-QC11-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC12-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1344-QC12-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC14-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1344-QC14-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC15-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1344-QC15-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC16-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1344-QC16-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC17-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1344-QC17-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC18-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1344-QC18-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC19-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1344-QC19-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC20-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1344-QC20-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC21-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1344-QC21-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC22-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1344-QC22-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC23-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1344-QC23-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC24-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1344-QC24-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC25-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1344-QC25-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC26-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1344-QC26-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC27-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1344-QC27-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC28-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1344-QC28-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-QC29-2011-OUT (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1344-QC29-2011-OUT vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica \ (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=---AITOR interface=IF-EOIP-2011-QC11 name=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 1401).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    "IF-VLAN1401-DMZ_RTG- QC11-OUT" vlan-id=1401
# QUÉ HACE: Segmenta el tráfico de la red lógica \ (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=---AITOR interface=IF-EOIP-2011-QC14 name=\
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 1401).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    IF-VLAN1401-DMZ_RTG-QC14-OUT vlan-id=1401
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC10-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1405-QC10-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC11-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1405-QC11-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC12-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1405-QC12-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC14-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1405-QC14-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC15-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1405-QC15-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC16-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1405-QC16-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC17-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1405-QC17-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC18-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1405-QC18-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC19-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1405-QC19-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC20-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1405-QC20-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC21-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1405-QC21-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC22-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1405-QC22-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC23-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1405-QC23-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC24-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1405-QC24-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC25-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1405-QC25-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC26-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1405-QC26-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC27-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1405-QC27-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC28-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1405-QC28-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-QC29-2011-OUT (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1405-QC29-2011-OUT vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC10-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1408-QC10-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC11-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1408-QC11-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC12-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1408-QC12-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC14-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1408-QC14-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC15-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1408-QC15-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC16-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1408-QC16-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC17-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1408-QC17-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC18-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1408-QC18-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC19-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1408-QC19-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC20-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1408-QC20-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC21-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1408-QC21-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC22-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1408-QC22-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC23-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1408-QC23-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC24-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1408-QC24-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC25-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1408-QC25-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC26-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1408-QC26-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC27-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1408-QC27-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC28-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1408-QC28-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-QC29-2011-OUT (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1408-QC29-2011-OUT vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC10-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC10 name=IF-VLAN1414-QC10-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC11-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC11 name=IF-VLAN1414-QC11-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC12-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC12 name=IF-VLAN1414-QC12-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC14-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC14 name=IF-VLAN1414-QC14-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC15-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC15 name=IF-VLAN1414-QC15-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC16-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC16 name=IF-VLAN1414-QC16-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC17-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC17 name=IF-VLAN1414-QC17-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC18-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC18 name=IF-VLAN1414-QC18-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC19-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC19 name=IF-VLAN1414-QC19-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC20-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC20 name=IF-VLAN1414-QC20-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC21-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC21 name=IF-VLAN1414-QC21-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC22-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC22 name=IF-VLAN1414-QC22-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC23-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC23 name=IF-VLAN1414-QC23-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC24-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC24 name=IF-VLAN1414-QC24-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC25-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC25 name=IF-VLAN1414-QC25-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC26-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC26 name=IF-VLAN1414-QC26-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC27-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC27 name=IF-VLAN1414-QC27-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC28-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC28 name=IF-VLAN1414-QC28-2011-OUT vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-QC29-2011-OUT (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-EOIP-2011-QC29 name=IF-VLAN1414-QC29-2011-OUT vlan-id=1414

################################################################################
##########   SECCIÓN: /INTERFACE BONDING   ##########
################################################################################
/interface bonding
# QUÉ HACE: Configura parámetros específicos en /interface bonding.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add mode=802.3ad name=IF-BOND-CISCO slaves=ether1,ether2 \
    transmit-hash-policy=layer-2-and-3
add mode=802.3ad name=IF-BOND-CISCO-LTE slaves=ether5,ether6

################################################################################
##########   SECCIÓN: /INTERFACE VLAN   ##########
################################################################################
/interface vlan
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN5-IN (VLAN 5).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment="VLAN 5" interface=IF-BOND-CISCO name=IF-VLAN5-IN vlan-id=5
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN8-IN (VLAN 8).
# UTILIDAD: Aísla el tráfico de N4 (Gestión) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN8-IN vlan-id=8
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN50-GESTION (VLAN 50).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN50-GESTION vlan-id=50
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN53-CISCO-LTE (VLAN 53).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO-LTE name=IF-VLAN53-CISCO-LTE vlan-id=53
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN99-RTG_TRACKING-IN (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=--AITOR interface=IF-BOND-CISCO name=IF-VLAN99-RTG_TRACKING-IN \
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 99).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    vlan-id=99
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1344-IN (VLAN 1344).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1344-IN vlan-id=1344
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1401-DMZ_RTG-IN (VLAN None).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add comment=--AITOR interface=IF-BOND-CISCO name=IF-VLAN1401-DMZ_RTG-IN \
# QUÉ HACE: Segmenta el tráfico de la red lógica  (VLAN 1401).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
    vlan-id=1401
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1405-IN (VLAN 1405).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1405-IN vlan-id=1405
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1408-IN (VLAN 1408).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1408-IN vlan-id=1408
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1414-IN (VLAN 1414).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1414-IN vlan-id=1414
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1429-CCR (VLAN 1429).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1429-CCR vlan-id=1429
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1700-WIFI-QC10 (VLAN 1700).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1700-WIFI-QC10 vlan-id=1700
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1701-FIBRA1-QC10 (VLAN 1701).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1701-FIBRA1-QC10 vlan-id=1701
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1702-FIBRA2-QC10 (VLAN 1702).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1702-FIBRA2-QC10 vlan-id=1702
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1703-FIBRA3-QC10 (VLAN 1703).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1703-FIBRA3-QC10 vlan-id=1703
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1704-WIFI-SOB-QC10 (VLAN 1704).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1704-WIFI-SOB-QC10 vlan-id=1704
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1710-WIFI-QC11 (VLAN 1710).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1710-WIFI-QC11 vlan-id=1710
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1711-FIBRA1-QC11 (VLAN 1711).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1711-FIBRA1-QC11 vlan-id=1711
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1712-FIBRA2-QC11 (VLAN 1712).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1712-FIBRA2-QC11 vlan-id=1712
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1713-FIBRA3-QC11 (VLAN 1713).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1713-FIBRA3-QC11 vlan-id=1713
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1714-WIFI-SOB-QC11 (VLAN 1714).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1714-WIFI-SOB-QC11 vlan-id=1714
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1720-WIFI-QC12 (VLAN 1720).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1720-WIFI-QC12 vlan-id=1720
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1721-FIBRA1-QC12 (VLAN 1721).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1721-FIBRA1-QC12 vlan-id=1721
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1722-FIBRA2-QC12 (VLAN 1722).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1722-FIBRA2-QC12 vlan-id=1722
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1723-FIBRA3-QC12 (VLAN 1723).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1723-FIBRA3-QC12 vlan-id=1723
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1724-WIFI-SOB-QC12 (VLAN 1724).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1724-WIFI-SOB-QC12 vlan-id=1724
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1740-WIFI-QC14 (VLAN 1740).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1740-WIFI-QC14 vlan-id=1740
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1741-FIBRA1-QC14 (VLAN 1741).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1741-FIBRA1-QC14 vlan-id=1741
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1742-FIBRA2-QC14 (VLAN 1742).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1742-FIBRA2-QC14 vlan-id=1742
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1743-FIBRA3-QC14 (VLAN 1743).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1743-FIBRA3-QC14 vlan-id=1743
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1744-WIFI-SOB-QC14 (VLAN 1744).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1744-WIFI-SOB-QC14 vlan-id=1744
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1750-WIFI-QC15 (VLAN 1750).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1750-WIFI-QC15 vlan-id=1750
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1751-FIBRA1-QC15 (VLAN 1751).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1751-FIBRA1-QC15 vlan-id=1751
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1752-FIBRA2-QC15 (VLAN 1752).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1752-FIBRA2-QC15 vlan-id=1752
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1753-FIBRA3-QC15 (VLAN 1753).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1753-FIBRA3-QC15 vlan-id=1753
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1754-WIFI-SOB-QC15 (VLAN 1754).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1754-WIFI-SOB-QC15 vlan-id=1754
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1760-WIFI-QC16 (VLAN 1760).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1760-WIFI-QC16 vlan-id=1760
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1761-FIBRA1-QC16 (VLAN 1761).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1761-FIBRA1-QC16 vlan-id=1761
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1762-FIBRA2-QC16 (VLAN 1762).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1762-FIBRA2-QC16 vlan-id=1762
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1763-FIBRA3-QC16 (VLAN 1763).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1763-FIBRA3-QC16 vlan-id=1763
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1764-WIFI-SOB-QC16 (VLAN 1764).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1764-WIFI-SOB-QC16 vlan-id=1764
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1770-WIFI-QC17 (VLAN 1770).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1770-WIFI-QC17 vlan-id=1770
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1771-FIBRA1-QC17 (VLAN 1771).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1771-FIBRA1-QC17 vlan-id=1771
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1772-FIBRA2-QC17 (VLAN 1772).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1772-FIBRA2-QC17 vlan-id=1772
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1773-FIBRA3-QC17 (VLAN 1773).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1773-FIBRA3-QC17 vlan-id=1773
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1774-WIFI-SOB-QC17 (VLAN 1774).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1774-WIFI-SOB-QC17 vlan-id=1774
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1780-WIFI-QC18 (VLAN 1780).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1780-WIFI-QC18 vlan-id=1780
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1781-FIBRA1-QC18 (VLAN 1781).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1781-FIBRA1-QC18 vlan-id=1781
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1782-FIBRA2-QC18 (VLAN 1782).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1782-FIBRA2-QC18 vlan-id=1782
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1783-FIBRA3-QC18 (VLAN 1783).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1783-FIBRA3-QC18 vlan-id=1783
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1784-WIFI-SOB-QC18 (VLAN 1784).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1784-WIFI-SOB-QC18 vlan-id=1784
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1790-WIFI-QC19 (VLAN 1790).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1790-WIFI-QC19 vlan-id=1790
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1791-FIBRA1-QC19 (VLAN 1791).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1791-FIBRA1-QC19 vlan-id=1791
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1792-FIBRA2-QC19 (VLAN 1792).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1792-FIBRA2-QC19 vlan-id=1792
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1793-FIBRA3-QC19 (VLAN 1793).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1793-FIBRA3-QC19 vlan-id=1793
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1794-WIFI-SOB-QC19 (VLAN 1794).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1794-WIFI-SOB-QC19 vlan-id=1794
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1800-WIFI-QC20 (VLAN 1800).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1800-WIFI-QC20 vlan-id=1800
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1801-FIBRA1-QC20 (VLAN 1801).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1801-FIBRA1-QC20 vlan-id=1801
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1802-FIBRA2-QC20 (VLAN 1802).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1802-FIBRA2-QC20 vlan-id=1802
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1803-FIBRA3-QC20 (VLAN 1803).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1803-FIBRA3-QC20 vlan-id=1803
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1804-WIFI-SOB-QC20 (VLAN 1804).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1804-WIFI-SOB-QC20 vlan-id=1804
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1810-WIFI-QC21 (VLAN 1810).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1810-WIFI-QC21 vlan-id=1810
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1811-FIBRA1-QC21 (VLAN 1811).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1811-FIBRA1-QC21 vlan-id=1811
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1812-FIBRA2-QC21 (VLAN 1812).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1812-FIBRA2-QC21 vlan-id=1812
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1813-FIBRA3-QC21 (VLAN 1813).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1813-FIBRA3-QC21 vlan-id=1813
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1814-WIFI-SOB-QC21 (VLAN 1814).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1814-WIFI-SOB-QC21 vlan-id=1814
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1820-WIFI-QC22 (VLAN 1820).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1820-WIFI-QC22 vlan-id=1820
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1821-FIBRA1-QC22 (VLAN 1821).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1821-FIBRA1-QC22 vlan-id=1821
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1822-FIBRA2-QC22 (VLAN 1822).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1822-FIBRA2-QC22 vlan-id=1822
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1823-FIBRA3-QC22 (VLAN 1823).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1823-FIBRA3-QC22 vlan-id=1823
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1824-WIFI-SOB-QC22 (VLAN 1824).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1824-WIFI-SOB-QC22 vlan-id=1824
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1830-WIFI-QC23 (VLAN 1830).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1830-WIFI-QC23 vlan-id=1830
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1831-FIBRA1-QC23 (VLAN 1831).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1831-FIBRA1-QC23 vlan-id=1831
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1832-FIBRA2-QC23 (VLAN 1832).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1832-FIBRA2-QC23 vlan-id=1832
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1833-FIBRA3-QC23 (VLAN 1833).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1833-FIBRA3-QC23 vlan-id=1833
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1834-WIFI-SOB-QC23 (VLAN 1834).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1834-WIFI-SOB-QC23 vlan-id=1834
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1840-WIFI-QC24 (VLAN 1840).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1840-WIFI-QC24 vlan-id=1840
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1841-FIBRA1-QC24 (VLAN 1841).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1841-FIBRA1-QC24 vlan-id=1841
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1842-FIBRA2-QC24 (VLAN 1842).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1842-FIBRA2-QC24 vlan-id=1842
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1843-FIBRA3-QC24 (VLAN 1843).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1843-FIBRA3-QC24 vlan-id=1843
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1844-WIFI-SOB-QC24 (VLAN 1844).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1844-WIFI-SOB-QC24 vlan-id=1844
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1850-WIFI-QC25 (VLAN 1850).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1850-WIFI-QC25 vlan-id=1850
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1851-FIBRA1-QC25 (VLAN 1851).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1851-FIBRA1-QC25 vlan-id=1851
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1852-FIBRA2-QC25 (VLAN 1852).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1852-FIBRA2-QC25 vlan-id=1852
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1853-FIBRA3-QC25 (VLAN 1853).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1853-FIBRA3-QC25 vlan-id=1853
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1854-WIFI-SOB-QC25 (VLAN 1854).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1854-WIFI-SOB-QC25 vlan-id=1854
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1860-WIFI-QC26 (VLAN 1860).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1860-WIFI-QC26 vlan-id=1860
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1861-FIBRA1-QC26 (VLAN 1861).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1861-FIBRA1-QC26 vlan-id=1861
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1862-FIBRA2-QC26 (VLAN 1862).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1862-FIBRA2-QC26 vlan-id=1862
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1863-FIBRA3-QC26 (VLAN 1863).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1863-FIBRA3-QC26 vlan-id=1863
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1864-WIFI-SOB-QC26 (VLAN 1864).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1864-WIFI-SOB-QC26 vlan-id=1864
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1870-WIFI-QC27 (VLAN 1870).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1870-WIFI-QC27 vlan-id=1870
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1871-FIBRA1-QC27 (VLAN 1871).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1871-FIBRA1-QC27 vlan-id=1871
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1872-FIBRA2-QC27 (VLAN 1872).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1872-FIBRA2-QC27 vlan-id=1872
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1873-FIBRA3-QC27 (VLAN 1873).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1873-FIBRA3-QC27 vlan-id=1873
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1874-WIFI-SOB-QC27 (VLAN 1874).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1874-WIFI-SOB-QC27 vlan-id=1874
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1880-WIFI-QC28 (VLAN 1880).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1880-WIFI-QC28 vlan-id=1880
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1881-FIBRA1-QC28 (VLAN 1881).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1881-FIBRA1-QC28 vlan-id=1881
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1882-FIBRA2-QC28 (VLAN 1882).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1882-FIBRA2-QC28 vlan-id=1882
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1883-FIBRA3-QC28 (VLAN 1883).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1883-FIBRA3-QC28 vlan-id=1883
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1884-WIFI-SOB-QC28 (VLAN 1884).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1884-WIFI-SOB-QC28 vlan-id=1884
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1890-WIFI-QC29 (VLAN 1890).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1890-WIFI-QC29 vlan-id=1890
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1891-FIBRA1-QC29 (VLAN 1891).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1891-FIBRA1-QC29 vlan-id=1891
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1892-FIBRA2-QC29 (VLAN 1892).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1892-FIBRA2-QC29 vlan-id=1892
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1893-FIBRA3-QC29 (VLAN 1893).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1893-FIBRA3-QC29 vlan-id=1893
# QUÉ HACE: Segmenta el tráfico de la red lógica IF-VLAN1894-WIFI-SOB-QC29 (VLAN 1894).
# UTILIDAD: Aísla el tráfico de OT (Operación) para evitar interferencias y garantizar ancho de banda.
# SI FALTA: Se produciría una mezcla de tráfico que podría saturar los PLCs o exponer la gestión a ataques.
add interface=IF-BOND-CISCO name=IF-VLAN1894-WIFI-SOB-QC29 vlan-id=1894

################################################################################
##########   SECCIÓN: /INTERFACE VRRP   ##########
################################################################################
/interface vrrp
# QUÉ HACE: Implementa redundancia de puerta de enlace mediante una IP virtual compartida.
# UTILIDAD: Si esta antena falla, otra toma el control de forma transparente para permitir la continuidad operativa.
# SI FALTA: Un fallo en el hardware de red dejaría a la grúa totalmente inoperativa sin capacidad de failover.
add interface=IF-VLAN1701-FIBRA1-QC10 name=IF-VRRP-FIBRA1-QC10 priority=250
add interface=IF-VLAN1711-FIBRA1-QC11 name=IF-VRRP-FIBRA1-QC11 priority=250 \
    vrid=11
add interface=IF-VLAN1721-FIBRA1-QC12 name=IF-VRRP-FIBRA1-QC12 priority=250 \
    vrid=21
add interface=IF-VLAN1741-FIBRA1-QC14 name=IF-VRRP-FIBRA1-QC14 priority=250 \
    vrid=41
add interface=IF-VLAN1751-FIBRA1-QC15 name=IF-VRRP-FIBRA1-QC15 priority=250 \
    vrid=51
add interface=IF-VLAN1761-FIBRA1-QC16 name=IF-VRRP-FIBRA1-QC16 priority=250 \
    vrid=61
add interface=IF-VLAN1771-FIBRA1-QC17 name=IF-VRRP-FIBRA1-QC17 priority=250 \
    vrid=71
add interface=IF-VLAN1781-FIBRA1-QC18 name=IF-VRRP-FIBRA1-QC18 priority=250 \
    vrid=81
add interface=IF-VLAN1791-FIBRA1-QC19 name=IF-VRRP-FIBRA1-QC19 priority=250 \
    vrid=91
add interface=IF-VLAN1801-FIBRA1-QC20 name=IF-VRRP-FIBRA1-QC20 priority=250 \
    vrid=101
add interface=IF-VLAN1811-FIBRA1-QC21 name=IF-VRRP-FIBRA1-QC21 priority=250 \
    vrid=111
add interface=IF-VLAN1821-FIBRA1-QC22 name=IF-VRRP-FIBRA1-QC22 priority=250 \
    vrid=121
add interface=IF-VLAN1831-FIBRA1-QC23 name=IF-VRRP-FIBRA1-QC23 priority=250 \
    vrid=131
add interface=IF-VLAN1841-FIBRA1-QC24 name=IF-VRRP-FIBRA1-QC24 priority=250 \
    vrid=141
add interface=IF-VLAN1851-FIBRA1-QC25 name=IF-VRRP-FIBRA1-QC25 priority=250 \
    vrid=151
add interface=IF-VLAN1861-FIBRA1-QC26 name=IF-VRRP-FIBRA1-QC26 priority=250 \
    vrid=161
add interface=IF-VLAN1871-FIBRA1-QC27 name=IF-VRRP-FIBRA1-QC27 priority=250 \
    vrid=171
add interface=IF-VLAN1881-FIBRA1-QC28 name=IF-VRRP-FIBRA1-QC28 priority=250 \
    vrid=181
add interface=IF-VLAN1891-FIBRA1-QC29 name=IF-VRRP-FIBRA1-QC29 priority=250 \
    vrid=191
add interface=IF-VLAN1702-FIBRA2-QC10 name=IF-VRRP-FIBRA2-QC10 priority=250 \
    vrid=2
add interface=IF-VLAN1712-FIBRA2-QC11 name=IF-VRRP-FIBRA2-QC11 priority=250 \
    vrid=12
add interface=IF-VLAN1722-FIBRA2-QC12 name=IF-VRRP-FIBRA2-QC12 priority=250 \
    vrid=22
add interface=IF-VLAN1742-FIBRA2-QC14 name=IF-VRRP-FIBRA2-QC14 priority=250 \
    vrid=42
add interface=IF-VLAN1752-FIBRA2-QC15 name=IF-VRRP-FIBRA2-QC15 priority=250 \
    vrid=52
add interface=IF-VLAN1762-FIBRA2-QC16 name=IF-VRRP-FIBRA2-QC16 priority=250 \
    vrid=62
add interface=IF-VLAN1772-FIBRA2-QC17 name=IF-VRRP-FIBRA2-QC17 priority=250 \
    vrid=72
add interface=IF-VLAN1782-FIBRA2-QC18 name=IF-VRRP-FIBRA2-QC18 priority=250 \
    vrid=82
add interface=IF-VLAN1792-FIBRA2-QC19 name=IF-VRRP-FIBRA2-QC19 priority=250 \
    vrid=92
add interface=IF-VLAN1802-FIBRA2-QC20 name=IF-VRRP-FIBRA2-QC20 priority=250 \
    vrid=102
add interface=IF-VLAN1812-FIBRA2-QC21 name=IF-VRRP-FIBRA2-QC21 priority=250 \
    vrid=112
add interface=IF-VLAN1822-FIBRA2-QC22 name=IF-VRRP-FIBRA2-QC22 priority=250 \
    vrid=122
add interface=IF-VLAN1832-FIBRA2-QC23 name=IF-VRRP-FIBRA2-QC23 priority=250 \
    vrid=132
add interface=IF-VLAN1842-FIBRA2-QC24 name=IF-VRRP-FIBRA2-QC24 priority=250 \
    vrid=142
add interface=IF-VLAN1852-FIBRA2-QC25 name=IF-VRRP-FIBRA2-QC25 priority=250 \
    vrid=152
add interface=IF-VLAN1862-FIBRA2-QC26 name=IF-VRRP-FIBRA2-QC26 priority=250 \
    vrid=162
add interface=IF-VLAN1872-FIBRA2-QC27 name=IF-VRRP-FIBRA2-QC27 priority=250 \
    vrid=172
add interface=IF-VLAN1882-FIBRA2-QC28 name=IF-VRRP-FIBRA2-QC28 priority=250 \
    vrid=182
add interface=IF-VLAN1892-FIBRA2-QC29 name=IF-VRRP-FIBRA2-QC29 priority=250 \
    vrid=192
add interface=IF-VLAN1703-FIBRA3-QC10 name=IF-VRRP-FIBRA3-QC10 priority=250 \
    vrid=3
add interface=IF-VLAN1713-FIBRA3-QC11 name=IF-VRRP-FIBRA3-QC11 priority=250 \
    vrid=13
add interface=IF-VLAN1723-FIBRA3-QC12 name=IF-VRRP-FIBRA3-QC12 priority=250 \
    vrid=23
add interface=IF-VLAN1743-FIBRA3-QC14 name=IF-VRRP-FIBRA3-QC14 priority=250 \
    vrid=43
add interface=IF-VLAN1753-FIBRA3-QC15 name=IF-VRRP-FIBRA3-QC15 priority=250 \
    vrid=53
add interface=IF-VLAN1763-FIBRA3-QC16 name=IF-VRRP-FIBRA3-QC16 priority=250 \
    vrid=63
add interface=IF-VLAN1773-FIBRA3-QC17 name=IF-VRRP-FIBRA3-QC17 priority=250 \
    vrid=73
add interface=IF-VLAN1783-FIBRA3-QC18 name=IF-VRRP-FIBRA3-QC18 priority=250 \
    vrid=83
add interface=IF-VLAN1793-FIBRA3-QC19 name=IF-VRRP-FIBRA3-QC19 priority=250 \
    vrid=93
add interface=IF-VLAN1803-FIBRA3-QC20 name=IF-VRRP-FIBRA3-QC20 priority=250 \
    vrid=103
add interface=IF-VLAN1813-FIBRA3-QC21 name=IF-VRRP-FIBRA3-QC21 priority=250 \
    vrid=113
add interface=IF-VLAN1823-FIBRA3-QC22 name=IF-VRRP-FIBRA3-QC22 priority=250 \
    vrid=123
add interface=IF-VLAN1833-FIBRA3-QC23 name=IF-VRRP-FIBRA3-QC23 priority=250 \
    vrid=133
add interface=IF-VLAN1843-FIBRA3-QC24 name=IF-VRRP-FIBRA3-QC24 priority=250 \
    vrid=143
add interface=IF-VLAN1853-FIBRA3-QC25 name=IF-VRRP-FIBRA3-QC25 priority=250 \
    vrid=153
add interface=IF-VLAN1863-FIBRA3-QC26 name=IF-VRRP-FIBRA3-QC26 priority=250 \
    vrid=163
add interface=IF-VLAN1873-FIBRA3-QC27 name=IF-VRRP-FIBRA3-QC27 priority=250 \
    vrid=173
add interface=IF-VLAN1883-FIBRA3-QC28 name=IF-VRRP-FIBRA3-QC28 priority=250 \
    vrid=183
add interface=IF-VLAN1893-FIBRA3-QC29 name=IF-VRRP-FIBRA3-QC29 priority=250 \
    vrid=193
add interface=IF-VLAN53-CISCO-LTE name=IF-VRRP-LTE priority=250 vrid=6
add interface=IF-VLAN1700-WIFI-QC10 name=IF-VRRP-WIFI-QC10 priority=250 vrid=\
    5
add interface=IF-VLAN1710-WIFI-QC11 name=IF-VRRP-WIFI-QC11 priority=250 vrid=\
    15
add interface=IF-VLAN1720-WIFI-QC12 name=IF-VRRP-WIFI-QC12 priority=250 vrid=\
    25
add interface=IF-VLAN1740-WIFI-QC14 name=IF-VRRP-WIFI-QC14 priority=250 vrid=\
    45
add interface=IF-VLAN1750-WIFI-QC15 name=IF-VRRP-WIFI-QC15 priority=250 vrid=\
    55
add interface=IF-VLAN1760-WIFI-QC16 name=IF-VRRP-WIFI-QC16 priority=250 vrid=\
    65
add interface=IF-VLAN1770-WIFI-QC17 name=IF-VRRP-WIFI-QC17 priority=250 vrid=\
    75
add interface=IF-VLAN1780-WIFI-QC18 name=IF-VRRP-WIFI-QC18 priority=250 vrid=\
    85
add interface=IF-VLAN1790-WIFI-QC19 name=IF-VRRP-WIFI-QC19 priority=250 vrid=\
    95
add interface=IF-VLAN1800-WIFI-QC20 name=IF-VRRP-WIFI-QC20 priority=250 vrid=\
    105
add interface=IF-VLAN1810-WIFI-QC21 name=IF-VRRP-WIFI-QC21 priority=250 vrid=\
    115
add interface=IF-VLAN1820-WIFI-QC22 name=IF-VRRP-WIFI-QC22 priority=250 vrid=\
    125
add interface=IF-VLAN1830-WIFI-QC23 name=IF-VRRP-WIFI-QC23 priority=250 vrid=\
    135
add interface=IF-VLAN1840-WIFI-QC24 name=IF-VRRP-WIFI-QC24 priority=250 vrid=\
    145
add interface=IF-VLAN1850-WIFI-QC25 name=IF-VRRP-WIFI-QC25 priority=250 vrid=\
    155
add interface=IF-VLAN1860-WIFI-QC26 name=IF-VRRP-WIFI-QC26 priority=250 vrid=\
    165
add interface=IF-VLAN1870-WIFI-QC27 name=IF-VRRP-WIFI-QC27 priority=250 vrid=\
    175
add interface=IF-VLAN1880-WIFI-QC28 name=IF-VRRP-WIFI-QC28 priority=250 vrid=\
    185
add interface=IF-VLAN1890-WIFI-QC29 name=IF-VRRP-WIFI-QC29 priority=250 vrid=\
    195
add interface=IF-VLAN1704-WIFI-SOB-QC10 name=IF-VRRP-WIFI-SOB-QC10 priority=\
    250 vrid=4
add interface=IF-VLAN1714-WIFI-SOB-QC11 name=IF-VRRP-WIFI-SOB-QC11 priority=\
    250 vrid=14
add interface=IF-VLAN1724-WIFI-SOB-QC12 name=IF-VRRP-WIFI-SOB-QC12 priority=\
    250 vrid=24
add interface=IF-VLAN1744-WIFI-SOB-QC14 name=IF-VRRP-WIFI-SOB-QC14 priority=\
    250 vrid=44
add interface=IF-VLAN1754-WIFI-SOB-QC15 name=IF-VRRP-WIFI-SOB-QC15 priority=\
    250 vrid=54
add interface=IF-VLAN1764-WIFI-SOB-QC16 name=IF-VRRP-WIFI-SOB-QC16 priority=\
    250 vrid=64
add interface=IF-VLAN1774-WIFI-SOB-QC17 name=IF-VRRP-WIFI-SOB-QC17 priority=\
    250 vrid=74
add interface=IF-VLAN1784-WIFI-SOB-QC18 name=IF-VRRP-WIFI-SOB-QC18 priority=\
    250 vrid=84
add interface=IF-VLAN1794-WIFI-SOB-QC19 name=IF-VRRP-WIFI-SOB-QC19 priority=\
    250 vrid=94
add interface=IF-VLAN1804-WIFI-SOB-QC20 name=IF-VRRP-WIFI-SOB-QC20 priority=\
    250 vrid=104
add interface=IF-VLAN1814-WIFI-SOB-QC21 name=IF-VRRP-WIFI-SOB-QC21 priority=\
    250 vrid=114
add interface=IF-VLAN1824-WIFI-SOB-QC22 name=IF-VRRP-WIFI-SOB-QC22 priority=\
    250 vrid=124
add interface=IF-VLAN1834-WIFI-SOB-QC23 name=IF-VRRP-WIFI-SOB-QC23 priority=\
    250 vrid=134
add interface=IF-VLAN1844-WIFI-SOB-QC24 name=IF-VRRP-WIFI-SOB-QC24 priority=\
    250 vrid=144
add interface=IF-VLAN1854-WIFI-SOB-QC25 name=IF-VRRP-WIFI-SOB-QC25 priority=\
    250 vrid=154
add interface=IF-VLAN1864-WIFI-SOB-QC26 name=IF-VRRP-WIFI-SOB-QC26 priority=\
    250 vrid=164
add interface=IF-VLAN1874-WIFI-SOB-QC27 name=IF-VRRP-WIFI-SOB-QC27 priority=\
    250 vrid=174
add interface=IF-VLAN1884-WIFI-SOB-QC28 name=IF-VRRP-WIFI-SOB-QC28 priority=\
    250 vrid=184
add interface=IF-VLAN1894-WIFI-SOB-QC29 name=IF-VRRP-WIFI-SOB-QC29 priority=\
    250 vrid=194

################################################################################
##########   SECCIÓN: /INTERFACE LIST   ##########
################################################################################
/interface list
# QUÉ HACE: Configura parámetros específicos en /interface list.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add name=SINLDP

################################################################################
##########   SECCIÓN: /INTERFACE WIRELESS SECURITY-PROFILES   ##########
################################################################################
/interface wireless security-profiles
# QUÉ HACE: Configura parámetros específicos en /interface wireless security-profiles.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set [ find default=yes ] supplicant-identity=MikroTik

################################################################################
##########   SECCIÓN: /ROUTING BGP INSTANCE   ##########
################################################################################
/routing bgp instance
# QUÉ HACE: Configura parámetros específicos en /routing bgp instance.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set default disabled=yes
add as=65000 name=QC11 router-id=172.19.11.241
add as=65000 name=QC12 router-id=172.19.12.241
add as=65000 name=QC28 router-id=172.19.28.241
add as=65000 name=QC10 router-id=172.19.10.241
add as=65000 name=QC29 router-id=172.19.29.241
add as=65000 name=QC26 router-id=172.19.26.241
add as=65000 name=QC14 router-id=172.19.14.241
add as=65000 name=QC22 router-id=172.19.22.241
add as=65000 name=QC21 router-id=172.19.21.241
add as=65000 name=QC18 router-id=172.19.18.241
add as=65000 name=QC19 router-id=172.19.19.241
add as=65000 name=QC17 router-id=172.19.17.241
add as=65000 name=QC25 router-id=172.19.25.241
add as=65000 name=QC15 router-id=172.19.15.241
add as=65000 name=QC16 router-id=172.19.16.241
add as=65000 name=QC27 router-id=172.19.27.241
add as=65000 name=QC20 router-id=172.19.20.241
add as=65000 name=QC23 router-id=172.19.23.241
add as=65000 name=QC24 router-id=172.19.24.241

################################################################################
##########   SECCIÓN: /SNMP COMMUNITY   ##########
################################################################################
/snmp community
# QUÉ HACE: Configura parámetros específicos en /snmp community.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set [ find default=yes ] disabled=yes
add addresses=::/0 authentication-password=1234567890 encryption-password=\
    1234567890 encryption-protocol=AES name=snmp4otnetwork security=\
    authorized

################################################################################
##########   SECCIÓN: /SYSTEM LOGGING ACTION   ##########
################################################################################
/system logging action
# QUÉ HACE: Configura parámetros específicos en /system logging action.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add name=LibreNMS remote=172.17.1.207 target=remote

################################################################################
##########   SECCIÓN: /USER GROUP   ##########
################################################################################
/user group
# QUÉ HACE: Configura parámetros específicos en /user group.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"

################################################################################
##########   SECCIÓN: /INTERFACE BRIDGE PORT   ##########
################################################################################
/interface bridge port
# QUÉ HACE: Configura parámetros específicos en /interface bridge port.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add bridge=BR_VLAN8 ingress-filtering=yes interface=IF-VLAN8-IN
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC10-SOB-OUT
add bridge=BR_VLAN1344 ingress-filtering=yes interface=IF-VLAN1344-IN
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC10-2011-OUT
add bridge=BR_VLAN1414 ingress-filtering=yes interface=IF-VLAN1414-IN
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC10-2011-OUT
add bridge=BR_VLAN1408 ingress-filtering=yes interface=IF-VLAN1408-IN
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC10-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=IF-VLAN1405-IN
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC10-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC11-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC11-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC11-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC11-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC11-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC12-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC12-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC12-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC12-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC12-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC28-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC28-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC28-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC28-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC28-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC29-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC29-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC29-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC29-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC29-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC26-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC26-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC26-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC26-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC26-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC14-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC14-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC14-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC14-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC14-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC22-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC22-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC22-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC22-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC22-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC21-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC21-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC21-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC21-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC21-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC18-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC18-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC18-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC18-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC18-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC19-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC19-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC19-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC19-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC19-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC17-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC17-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC17-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC17-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC17-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC25-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC25-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC25-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC25-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC25-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC15-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC15-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC15-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC15-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC15-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC16-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC16-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC16-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC16-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC16-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC27-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC27-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC27-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC27-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC27-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC20-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC20-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC20-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC20-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC20-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC23-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC23-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC23-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC23-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC23-2011-OUT
add bridge=BR_VLAN8 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN8-QC24-SOB-OUT
add bridge=BR_VLAN1344 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1344-QC24-2011-OUT
add bridge=BR_VLAN1405 ingress-filtering=yes interface=\
    IF-VLAN1405-QC24-2011-OUT
add bridge=BR_VLAN1408 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1408-QC24-2011-OUT
add bridge=BR_VLAN1414 horizon=10 ingress-filtering=yes interface=\
    IF-VLAN1414-QC24-2011-OUT
add bridge=BR_VLAN5 interface=IF-VLAN5-IN
add bridge=BR_VLAN5 interface=IF-VLAN5-QC14-2011-OUT
add bridge=BR_VLAN99 interface=IF-VLAN99-RTG_TRACKING-IN
add bridge=BR_VLAN99 horizon=10 interface=IF-VLAN99-RTG_TRACKING-OUT
add bridge=BR_VLAN8 comment=--aitor horizon=10 interface=\
    IF-VLAN8-QC14-2011-OUT
add bridge=BR_VLAN1401 horizon=10 interface=IF-VLAN1401-DMZ_RTG-QC14-OUT
add bridge=BR_VLAN1401 interface=IF-VLAN1401-DMZ_RTG-IN
add bridge=BR_VLAN8 comment=--aitor horizon=10 interface=\
    IF-VLAN8-QC11-2011-OUT
add bridge=BR_VLAN1401 horizon=10 interface="IF-VLAN1401-DMZ_RTG- QC11-OUT"
add bridge=BR_VLAN50 interface=IF-VLAN50-QC14
add bridge=BR_VLAN50 interface=IF-VLAN50-GESTION
add bridge=BR_VLAN50 interface=IF-VLAN50-QC11
add bridge=BR_VLAN99 interface=IF-VLAN99-QC11

################################################################################
##########   SECCIÓN: /IP FIREWALL CONNECTION TRACKING   ##########
################################################################################
/ip firewall connection tracking
# QUÉ HACE: Configura parámetros específicos en /ip firewall connection tracking.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set enabled=yes

################################################################################
##########   SECCIÓN: /IP NEIGHBOR DISCOVERY-SETTINGS   ##########
################################################################################
/ip neighbor discovery-settings
# QUÉ HACE: Configura parámetros específicos en /ip neighbor discovery-settings.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set discover-interface-list=!SINLDP

################################################################################
##########   SECCIÓN: /INTERFACE L2TP-SERVER SERVER   ##########
################################################################################
/interface l2tp-server server
# QUÉ HACE: Configura parámetros específicos en /interface l2tp-server server.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set default-profile=default enabled=yes ipsec-secret=tunel-LTE use-ipsec=yes

################################################################################
##########   SECCIÓN: /INTERFACE LIST MEMBER   ##########
################################################################################
/interface list member
# QUÉ HACE: Configura parámetros específicos en /interface list member.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add interface=IF-BOND-CISCO-LTE list=SINLDP
add interface=IF-VLAN53-CISCO-LTE list=SINLDP

################################################################################
##########   SECCIÓN: /IP ADDRESS   ##########
################################################################################
/ip address
# QUÉ HACE: Asigna la IP estática 172.19.10.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.2/28 interface=IF-VRRP-FIBRA1-QC10 network=172.19.10.0
# QUÉ HACE: Asigna la IP estática 172.19.10.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.18/28 interface=IF-VRRP-FIBRA2-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.16
# QUÉ HACE: Asigna la IP estática 172.19.10.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.34/28 interface=IF-VRRP-FIBRA3-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.32
# QUÉ HACE: Asigna la IP estática 172.19.10.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.50/28 interface=IF-VRRP-WIFI-SOB-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.48
# QUÉ HACE: Asigna la IP estática 172.19.10.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.66/28 interface=IF-VRRP-WIFI-QC10 network=172.19.10.64
# QUÉ HACE: Asigna la IP estática 172.19.10.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.241 interface=Lo-QC10 network=172.19.10.241
# QUÉ HACE: Asigna la IP estática 172.17.1.201/24 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.17.1.201/24 interface=IF-VLAN50-GESTION network=172.17.1.0
# QUÉ HACE: Asigna la IP estática 172.19.10.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.177/30 interface=IF-VLAN1701-FIBRA1-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.176
# QUÉ HACE: Asigna la IP estática 172.19.10.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.181/30 interface=IF-VLAN1702-FIBRA2-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.180
# QUÉ HACE: Asigna la IP estática 172.19.10.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.185/30 interface=IF-VLAN1703-FIBRA3-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.184
# QUÉ HACE: Asigna la IP estática 172.19.10.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.189/30 interface=IF-VLAN1704-WIFI-SOB-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.188
# QUÉ HACE: Asigna la IP estática 172.19.10.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.10.193/30 interface=IF-VLAN1700-WIFI-QC10 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.10.192
# QUÉ HACE: Asigna la IP estática 10.34.183.232/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=10.34.183.232/28 interface=IF-VLAN53-CISCO-LTE network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    10.34.183.224
# QUÉ HACE: Asigna la IP estática 172.19.11.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.241 interface=Lo-QC11 network=172.19.11.241
# QUÉ HACE: Asigna la IP estática 172.19.11.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.189/30 interface=IF-VLAN1714-WIFI-SOB-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.188
# QUÉ HACE: Asigna la IP estática 172.19.11.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.193/30 interface=IF-VLAN1710-WIFI-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.192
# QUÉ HACE: Asigna la IP estática 172.19.12.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.181/30 interface=IF-VLAN1722-FIBRA2-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.180
# QUÉ HACE: Asigna la IP estática 172.19.11.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.177/30 interface=IF-VLAN1711-FIBRA1-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.176
# QUÉ HACE: Asigna la IP estática 172.19.11.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.185/30 interface=IF-VLAN1713-FIBRA3-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.184
# QUÉ HACE: Asigna la IP estática 172.19.11.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.2/28 interface=IF-VRRP-FIBRA1-QC11 network=172.19.11.0
# QUÉ HACE: Asigna la IP estática 172.19.11.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.18/28 interface=IF-VRRP-FIBRA2-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.16
# QUÉ HACE: Asigna la IP estática 172.19.11.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.34/28 interface=IF-VRRP-FIBRA3-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.32
# QUÉ HACE: Asigna la IP estática 172.19.11.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.66/28 interface=IF-VRRP-WIFI-QC11 network=172.19.11.64
# QUÉ HACE: Asigna la IP estática 172.19.11.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.50/28 interface=IF-VRRP-WIFI-SOB-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.48
# QUÉ HACE: Asigna la IP estática 172.19.12.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.241 interface=Lo-QC12 network=172.19.12.241
# QUÉ HACE: Asigna la IP estática 172.19.12.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.2/28 interface=IF-VRRP-FIBRA1-QC12 network=172.19.12.0
# QUÉ HACE: Asigna la IP estática 172.19.28.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.18/28 interface=IF-VRRP-FIBRA2-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.16
# QUÉ HACE: Asigna la IP estática 172.19.12.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.34/28 interface=IF-VRRP-FIBRA3-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.32
# QUÉ HACE: Asigna la IP estática 172.19.12.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.50/28 interface=IF-VRRP-WIFI-SOB-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.48
# QUÉ HACE: Asigna la IP estática 172.19.12.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.66/28 interface=IF-VRRP-WIFI-QC12 network=172.19.12.64
# QUÉ HACE: Asigna la IP estática 172.19.12.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.177/30 interface=IF-VLAN1721-FIBRA1-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.176
# QUÉ HACE: Asigna la IP estática 172.19.12.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.189/30 interface=IF-VLAN1724-WIFI-SOB-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.188
# QUÉ HACE: Asigna la IP estática 172.19.12.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.193/30 interface=IF-VLAN1720-WIFI-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.192
# QUÉ HACE: Asigna la IP estática 172.19.11.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.11.181/30 interface=IF-VLAN1712-FIBRA2-QC11 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.11.180
# QUÉ HACE: Asigna la IP estática 172.19.12.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.185/30 interface=IF-VLAN1723-FIBRA3-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.184
# QUÉ HACE: Asigna la IP estática 172.19.28.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.241 interface=Lo-QC28 network=172.19.28.241
# QUÉ HACE: Asigna la IP estática 172.19.28.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.2/28 interface=IF-VRRP-FIBRA1-QC28 network=172.19.28.0
# QUÉ HACE: Asigna la IP estática 172.19.12.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.12.18/28 interface=IF-VRRP-FIBRA2-QC12 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.12.16
# QUÉ HACE: Asigna la IP estática 172.19.28.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.34/28 interface=IF-VRRP-FIBRA3-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.32
# QUÉ HACE: Asigna la IP estática 172.19.28.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.50/28 interface=IF-VRRP-WIFI-SOB-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.48
# QUÉ HACE: Asigna la IP estática 172.19.28.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.66/28 interface=IF-VRRP-WIFI-QC28 network=172.19.28.64
# QUÉ HACE: Asigna la IP estática 172.19.28.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.177/30 interface=IF-VLAN1881-FIBRA1-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.176
# QUÉ HACE: Asigna la IP estática 172.19.28.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.181/30 interface=IF-VLAN1882-FIBRA2-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.180
# QUÉ HACE: Asigna la IP estática 172.19.28.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.185/30 interface=IF-VLAN1883-FIBRA3-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.184
# QUÉ HACE: Asigna la IP estática 172.19.28.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.189/30 interface=IF-VLAN1884-WIFI-SOB-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.188
# QUÉ HACE: Asigna la IP estática 172.19.28.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.28.193/30 interface=IF-VLAN1880-WIFI-QC28 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.28.192
# QUÉ HACE: Asigna la IP estática 172.19.29.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.241 interface=Lo-QC29 network=172.19.29.241
# QUÉ HACE: Asigna la IP estática 172.19.29.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.2/28 interface=IF-VRRP-FIBRA1-QC29 network=172.19.29.0
# QUÉ HACE: Asigna la IP estática 172.19.29.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.18/28 interface=IF-VRRP-FIBRA2-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.16
# QUÉ HACE: Asigna la IP estática 172.19.29.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.34/28 interface=IF-VRRP-FIBRA3-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.32
# QUÉ HACE: Asigna la IP estática 172.19.29.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.50/28 interface=IF-VRRP-WIFI-SOB-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.48
# QUÉ HACE: Asigna la IP estática 172.19.29.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.66/28 interface=IF-VRRP-WIFI-QC29 network=172.19.29.64
# QUÉ HACE: Asigna la IP estática 172.19.29.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.177/30 interface=IF-VLAN1891-FIBRA1-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.176
# QUÉ HACE: Asigna la IP estática 172.19.29.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.181/30 interface=IF-VLAN1892-FIBRA2-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.180
# QUÉ HACE: Asigna la IP estática 172.19.29.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.185/30 interface=IF-VLAN1893-FIBRA3-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.184
# QUÉ HACE: Asigna la IP estática 172.19.29.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.189/30 interface=IF-VLAN1894-WIFI-SOB-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.188
# QUÉ HACE: Asigna la IP estática 172.19.29.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.29.193/30 interface=IF-VLAN1890-WIFI-QC29 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.29.192
# QUÉ HACE: Asigna la IP estática 172.19.26.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.241 interface=Lo-QC26 network=172.19.26.241
# QUÉ HACE: Asigna la IP estática 172.19.26.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.2/28 interface=IF-VRRP-FIBRA1-QC26 network=172.19.26.0
# QUÉ HACE: Asigna la IP estática 172.19.26.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.18/28 interface=IF-VRRP-FIBRA2-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.16
# QUÉ HACE: Asigna la IP estática 172.19.26.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.34/28 interface=IF-VRRP-FIBRA3-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.32
# QUÉ HACE: Asigna la IP estática 172.19.26.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.50/28 interface=IF-VRRP-WIFI-SOB-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.48
# QUÉ HACE: Asigna la IP estática 172.19.26.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.66/28 interface=IF-VRRP-WIFI-QC26 network=172.19.26.64
# QUÉ HACE: Asigna la IP estática 172.19.26.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.177/30 interface=IF-VLAN1861-FIBRA1-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.176
# QUÉ HACE: Asigna la IP estática 172.19.26.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.181/30 interface=IF-VLAN1862-FIBRA2-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.180
# QUÉ HACE: Asigna la IP estática 172.19.26.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.185/30 interface=IF-VLAN1863-FIBRA3-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.184
# QUÉ HACE: Asigna la IP estática 172.19.26.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.189/30 interface=IF-VLAN1864-WIFI-SOB-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.188
# QUÉ HACE: Asigna la IP estática 172.19.26.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.26.193/30 interface=IF-VLAN1860-WIFI-QC26 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.26.192
# QUÉ HACE: Asigna la IP estática 172.19.14.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.241 interface=Lo-QC14 network=172.19.14.241
# QUÉ HACE: Asigna la IP estática 172.19.14.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.2/28 interface=IF-VRRP-FIBRA1-QC14 network=172.19.14.0
# QUÉ HACE: Asigna la IP estática 172.19.14.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.18/28 interface=IF-VRRP-FIBRA2-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.16
# QUÉ HACE: Asigna la IP estática 172.19.14.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.34/28 interface=IF-VRRP-FIBRA3-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.32
# QUÉ HACE: Asigna la IP estática 172.19.14.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.50/28 interface=IF-VRRP-WIFI-SOB-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.48
# QUÉ HACE: Asigna la IP estática 172.19.14.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.66/28 interface=IF-VRRP-WIFI-QC14 network=172.19.14.64
# QUÉ HACE: Asigna la IP estática 172.19.14.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.177/30 interface=IF-VLAN1741-FIBRA1-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.176
# QUÉ HACE: Asigna la IP estática 172.19.14.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.181/30 interface=IF-VLAN1742-FIBRA2-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.180
# QUÉ HACE: Asigna la IP estática 172.19.14.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.185/30 interface=IF-VLAN1743-FIBRA3-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.184
# QUÉ HACE: Asigna la IP estática 172.19.14.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.189/30 interface=IF-VLAN1744-WIFI-SOB-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.188
# QUÉ HACE: Asigna la IP estática 172.19.14.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.14.193/30 interface=IF-VLAN1740-WIFI-QC14 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.14.192
# QUÉ HACE: Asigna la IP estática 172.19.22.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.241 interface=Lo-QC22 network=172.19.22.241
# QUÉ HACE: Asigna la IP estática 172.19.22.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.2/28 interface=IF-VRRP-FIBRA1-QC22 network=172.19.22.0
# QUÉ HACE: Asigna la IP estática 172.19.22.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.18/28 interface=IF-VRRP-FIBRA2-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.16
# QUÉ HACE: Asigna la IP estática 172.19.22.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.34/28 interface=IF-VRRP-FIBRA3-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.32
# QUÉ HACE: Asigna la IP estática 172.19.22.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.50/28 interface=IF-VRRP-WIFI-SOB-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.48
# QUÉ HACE: Asigna la IP estática 172.19.22.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.66/28 interface=IF-VRRP-WIFI-QC22 network=172.19.22.64
# QUÉ HACE: Asigna la IP estática 172.19.22.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.177/30 interface=IF-VLAN1821-FIBRA1-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.176
# QUÉ HACE: Asigna la IP estática 172.19.22.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.181/30 interface=IF-VLAN1822-FIBRA2-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.180
# QUÉ HACE: Asigna la IP estática 172.19.22.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.185/30 interface=IF-VLAN1823-FIBRA3-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.184
# QUÉ HACE: Asigna la IP estática 172.19.22.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.189/30 interface=IF-VLAN1824-WIFI-SOB-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.188
# QUÉ HACE: Asigna la IP estática 172.19.22.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.22.193/30 interface=IF-VLAN1820-WIFI-QC22 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.22.192
# QUÉ HACE: Asigna la IP estática 172.19.21.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.241 interface=Lo-QC21 network=172.19.21.241
# QUÉ HACE: Asigna la IP estática 172.19.21.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.2/28 interface=IF-VRRP-FIBRA1-QC21 network=172.19.21.0
# QUÉ HACE: Asigna la IP estática 172.19.21.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.18/28 interface=IF-VRRP-FIBRA2-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.16
# QUÉ HACE: Asigna la IP estática 172.19.21.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.34/28 interface=IF-VRRP-FIBRA3-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.32
# QUÉ HACE: Asigna la IP estática 172.19.21.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.50/28 interface=IF-VRRP-WIFI-SOB-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.48
# QUÉ HACE: Asigna la IP estática 172.19.21.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.66/28 interface=IF-VRRP-WIFI-QC21 network=172.19.21.64
# QUÉ HACE: Asigna la IP estática 172.19.21.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.177/30 interface=IF-VLAN1811-FIBRA1-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.176
# QUÉ HACE: Asigna la IP estática 172.19.21.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.181/30 interface=IF-VLAN1812-FIBRA2-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.180
# QUÉ HACE: Asigna la IP estática 172.19.21.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.185/30 interface=IF-VLAN1813-FIBRA3-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.184
# QUÉ HACE: Asigna la IP estática 172.19.21.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.189/30 interface=IF-VLAN1814-WIFI-SOB-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.188
# QUÉ HACE: Asigna la IP estática 172.19.21.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.21.193/30 interface=IF-VLAN1810-WIFI-QC21 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.21.192
# QUÉ HACE: Asigna la IP estática 172.19.18.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.241 interface=Lo-QC18 network=172.19.18.241
# QUÉ HACE: Asigna la IP estática 172.19.18.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.2/28 interface=IF-VRRP-FIBRA1-QC18 network=172.19.18.0
# QUÉ HACE: Asigna la IP estática 172.19.18.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.18/28 interface=IF-VRRP-FIBRA2-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.16
# QUÉ HACE: Asigna la IP estática 172.19.18.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.34/28 interface=IF-VRRP-FIBRA3-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.32
# QUÉ HACE: Asigna la IP estática 172.19.18.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.50/28 interface=IF-VRRP-WIFI-SOB-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.48
# QUÉ HACE: Asigna la IP estática 172.19.18.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.66/28 interface=IF-VRRP-WIFI-QC18 network=172.19.18.64
# QUÉ HACE: Asigna la IP estática 172.19.18.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.177/30 interface=IF-VLAN1781-FIBRA1-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.176
# QUÉ HACE: Asigna la IP estática 172.19.18.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.181/30 interface=IF-VLAN1782-FIBRA2-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.180
# QUÉ HACE: Asigna la IP estática 172.19.18.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.185/30 interface=IF-VLAN1783-FIBRA3-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.184
# QUÉ HACE: Asigna la IP estática 172.19.18.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.189/30 interface=IF-VLAN1784-WIFI-SOB-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.188
# QUÉ HACE: Asigna la IP estática 172.19.18.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.18.193/30 interface=IF-VLAN1780-WIFI-QC18 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.18.192
# QUÉ HACE: Asigna la IP estática 172.19.19.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.241 interface=Lo-QC19 network=172.19.19.241
# QUÉ HACE: Asigna la IP estática 172.19.19.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.2/28 interface=IF-VRRP-FIBRA1-QC19 network=172.19.19.0
# QUÉ HACE: Asigna la IP estática 172.19.19.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.18/28 interface=IF-VRRP-FIBRA2-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.16
# QUÉ HACE: Asigna la IP estática 172.19.19.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.34/28 interface=IF-VRRP-FIBRA3-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.32
# QUÉ HACE: Asigna la IP estática 172.19.19.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.50/28 interface=IF-VRRP-WIFI-SOB-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.48
# QUÉ HACE: Asigna la IP estática 172.19.19.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.66/28 interface=IF-VRRP-WIFI-QC19 network=172.19.19.64
# QUÉ HACE: Asigna la IP estática 172.19.19.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.177/30 interface=IF-VLAN1791-FIBRA1-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.176
# QUÉ HACE: Asigna la IP estática 172.19.19.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.181/30 interface=IF-VLAN1792-FIBRA2-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.180
# QUÉ HACE: Asigna la IP estática 172.19.19.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.185/30 interface=IF-VLAN1793-FIBRA3-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.184
# QUÉ HACE: Asigna la IP estática 172.19.19.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.189/30 interface=IF-VLAN1794-WIFI-SOB-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.188
# QUÉ HACE: Asigna la IP estática 172.19.19.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.19.193/30 interface=IF-VLAN1790-WIFI-QC19 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.19.192
# QUÉ HACE: Asigna la IP estática 172.19.17.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.241 interface=Lo-QC17 network=172.19.17.241
# QUÉ HACE: Asigna la IP estática 172.19.17.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.2/28 interface=IF-VRRP-FIBRA1-QC17 network=172.19.17.0
# QUÉ HACE: Asigna la IP estática 172.19.17.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.18/28 interface=IF-VRRP-FIBRA2-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.16
# QUÉ HACE: Asigna la IP estática 172.19.17.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.34/28 interface=IF-VRRP-FIBRA3-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.32
# QUÉ HACE: Asigna la IP estática 172.19.17.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.50/28 interface=IF-VRRP-WIFI-SOB-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.48
# QUÉ HACE: Asigna la IP estática 172.19.17.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.66/28 interface=IF-VRRP-WIFI-QC17 network=172.19.17.64
# QUÉ HACE: Asigna la IP estática 172.19.17.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.177/30 interface=IF-VLAN1771-FIBRA1-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.176
# QUÉ HACE: Asigna la IP estática 172.19.17.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.181/30 interface=IF-VLAN1772-FIBRA2-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.180
# QUÉ HACE: Asigna la IP estática 172.19.17.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.185/30 interface=IF-VLAN1773-FIBRA3-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.184
# QUÉ HACE: Asigna la IP estática 172.19.17.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.189/30 interface=IF-VLAN1774-WIFI-SOB-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.188
# QUÉ HACE: Asigna la IP estática 172.19.17.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.17.193/30 interface=IF-VLAN1770-WIFI-QC17 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.17.192
# QUÉ HACE: Asigna la IP estática 172.19.25.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.241 interface=Lo-QC25 network=172.19.25.241
# QUÉ HACE: Asigna la IP estática 172.19.25.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.2/28 interface=IF-VRRP-FIBRA1-QC25 network=172.19.25.0
# QUÉ HACE: Asigna la IP estática 172.19.25.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.18/28 interface=IF-VRRP-FIBRA2-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.16
# QUÉ HACE: Asigna la IP estática 172.19.25.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.34/28 interface=IF-VRRP-FIBRA3-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.32
# QUÉ HACE: Asigna la IP estática 172.19.25.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.50/28 interface=IF-VRRP-WIFI-SOB-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.48
# QUÉ HACE: Asigna la IP estática 172.19.25.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.66/28 interface=IF-VRRP-WIFI-QC25 network=172.19.25.64
# QUÉ HACE: Asigna la IP estática 172.19.25.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.177/30 interface=IF-VLAN1851-FIBRA1-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.176
# QUÉ HACE: Asigna la IP estática 172.19.25.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.181/30 interface=IF-VLAN1852-FIBRA2-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.180
# QUÉ HACE: Asigna la IP estática 172.19.25.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.185/30 interface=IF-VLAN1853-FIBRA3-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.184
# QUÉ HACE: Asigna la IP estática 172.19.25.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.189/30 interface=IF-VLAN1854-WIFI-SOB-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.188
# QUÉ HACE: Asigna la IP estática 172.19.25.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.25.193/30 interface=IF-VLAN1850-WIFI-QC25 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.25.192
# QUÉ HACE: Asigna la IP estática 172.19.15.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.241 interface=Lo-QC15 network=172.19.15.241
# QUÉ HACE: Asigna la IP estática 172.19.15.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.2/28 interface=IF-VRRP-FIBRA1-QC15 network=172.19.15.0
# QUÉ HACE: Asigna la IP estática 172.19.15.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.18/28 interface=IF-VRRP-FIBRA2-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.16
# QUÉ HACE: Asigna la IP estática 172.19.15.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.34/28 interface=IF-VRRP-FIBRA3-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.32
# QUÉ HACE: Asigna la IP estática 172.19.15.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.50/28 interface=IF-VRRP-WIFI-SOB-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.48
# QUÉ HACE: Asigna la IP estática 172.19.15.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.66/28 interface=IF-VRRP-WIFI-QC15 network=172.19.15.64
# QUÉ HACE: Asigna la IP estática 172.19.15.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.177/30 interface=IF-VLAN1751-FIBRA1-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.176
# QUÉ HACE: Asigna la IP estática 172.19.15.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.181/30 interface=IF-VLAN1752-FIBRA2-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.180
# QUÉ HACE: Asigna la IP estática 172.19.15.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.185/30 interface=IF-VLAN1753-FIBRA3-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.184
# QUÉ HACE: Asigna la IP estática 172.19.15.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.189/30 interface=IF-VLAN1754-WIFI-SOB-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.188
# QUÉ HACE: Asigna la IP estática 172.19.15.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.15.193/30 interface=IF-VLAN1750-WIFI-QC15 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.15.192
# QUÉ HACE: Asigna la IP estática 172.19.16.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.241 interface=Lo-QC16 network=172.19.16.241
# QUÉ HACE: Asigna la IP estática 172.19.16.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.2/28 interface=IF-VRRP-FIBRA1-QC16 network=172.19.16.0
# QUÉ HACE: Asigna la IP estática 172.19.16.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.18/28 interface=IF-VRRP-FIBRA2-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.16
# QUÉ HACE: Asigna la IP estática 172.19.16.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.34/28 interface=IF-VRRP-FIBRA3-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.32
# QUÉ HACE: Asigna la IP estática 172.19.16.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.50/28 interface=IF-VRRP-WIFI-SOB-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.48
# QUÉ HACE: Asigna la IP estática 172.19.16.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.66/28 interface=IF-VRRP-WIFI-QC16 network=172.19.16.64
# QUÉ HACE: Asigna la IP estática 172.19.16.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.177/30 interface=IF-VLAN1761-FIBRA1-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.176
# QUÉ HACE: Asigna la IP estática 172.19.16.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.181/30 interface=IF-VLAN1762-FIBRA2-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.180
# QUÉ HACE: Asigna la IP estática 172.19.16.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.185/30 interface=IF-VLAN1763-FIBRA3-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.184
# QUÉ HACE: Asigna la IP estática 172.19.16.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.189/30 interface=IF-VLAN1764-WIFI-SOB-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.188
# QUÉ HACE: Asigna la IP estática 172.19.16.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.16.193/30 interface=IF-VLAN1760-WIFI-QC16 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.16.192
# QUÉ HACE: Asigna la IP estática 172.19.27.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.241 interface=Lo-QC27 network=172.19.27.241
# QUÉ HACE: Asigna la IP estática 172.19.27.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.2/28 interface=IF-VRRP-FIBRA1-QC27 network=172.19.27.0
# QUÉ HACE: Asigna la IP estática 172.19.27.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.18/28 interface=IF-VRRP-FIBRA2-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.16
# QUÉ HACE: Asigna la IP estática 172.19.27.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.34/28 interface=IF-VRRP-FIBRA3-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.32
# QUÉ HACE: Asigna la IP estática 172.19.27.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.50/28 interface=IF-VRRP-WIFI-SOB-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.48
# QUÉ HACE: Asigna la IP estática 172.19.27.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.66/28 interface=IF-VRRP-WIFI-QC27 network=172.19.27.64
# QUÉ HACE: Asigna la IP estática 172.19.27.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.177/30 interface=IF-VLAN1871-FIBRA1-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.176
# QUÉ HACE: Asigna la IP estática 172.19.27.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.181/30 interface=IF-VLAN1872-FIBRA2-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.180
# QUÉ HACE: Asigna la IP estática 172.19.27.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.185/30 interface=IF-VLAN1873-FIBRA3-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.184
# QUÉ HACE: Asigna la IP estática 172.19.27.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.189/30 interface=IF-VLAN1874-WIFI-SOB-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.188
# QUÉ HACE: Asigna la IP estática 172.19.27.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.27.193/30 interface=IF-VLAN1870-WIFI-QC27 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.27.192
# QUÉ HACE: Asigna la IP estática 172.19.20.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.241 interface=Lo-QC20 network=172.19.20.241
# QUÉ HACE: Asigna la IP estática 172.19.20.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.2/28 interface=IF-VRRP-FIBRA1-QC20 network=172.19.20.0
# QUÉ HACE: Asigna la IP estática 172.19.20.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.18/28 interface=IF-VRRP-FIBRA2-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.16
# QUÉ HACE: Asigna la IP estática 172.19.20.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.34/28 interface=IF-VRRP-FIBRA3-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.32
# QUÉ HACE: Asigna la IP estática 172.19.20.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.50/28 interface=IF-VRRP-WIFI-SOB-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.48
# QUÉ HACE: Asigna la IP estática 172.19.20.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.66/28 interface=IF-VRRP-WIFI-QC20 network=172.19.20.64
# QUÉ HACE: Asigna la IP estática 172.19.20.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.177/30 interface=IF-VLAN1801-FIBRA1-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.176
# QUÉ HACE: Asigna la IP estática 172.19.20.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.181/30 interface=IF-VLAN1802-FIBRA2-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.180
# QUÉ HACE: Asigna la IP estática 172.19.20.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.185/30 interface=IF-VLAN1803-FIBRA3-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.184
# QUÉ HACE: Asigna la IP estática 172.19.20.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.189/30 interface=IF-VLAN1804-WIFI-SOB-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.188
# QUÉ HACE: Asigna la IP estática 172.19.20.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.20.193/30 interface=IF-VLAN1800-WIFI-QC20 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.20.192
# QUÉ HACE: Asigna la IP estática 172.19.23.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.241 interface=Lo-QC23 network=172.19.23.241
# QUÉ HACE: Asigna la IP estática 172.19.23.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.2/28 interface=IF-VRRP-FIBRA1-QC23 network=172.19.23.0
# QUÉ HACE: Asigna la IP estática 172.19.23.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.18/28 interface=IF-VRRP-FIBRA2-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.16
# QUÉ HACE: Asigna la IP estática 172.19.23.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.34/28 interface=IF-VRRP-FIBRA3-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.32
# QUÉ HACE: Asigna la IP estática 172.19.23.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.50/28 interface=IF-VRRP-WIFI-SOB-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.48
# QUÉ HACE: Asigna la IP estática 172.19.23.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.66/28 interface=IF-VRRP-WIFI-QC23 network=172.19.23.64
# QUÉ HACE: Asigna la IP estática 172.19.23.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.177/30 interface=IF-VLAN1831-FIBRA1-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.176
# QUÉ HACE: Asigna la IP estática 172.19.23.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.181/30 interface=IF-VLAN1832-FIBRA2-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.180
# QUÉ HACE: Asigna la IP estática 172.19.23.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.185/30 interface=IF-VLAN1833-FIBRA3-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.184
# QUÉ HACE: Asigna la IP estática 172.19.23.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.189/30 interface=IF-VLAN1834-WIFI-SOB-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.188
# QUÉ HACE: Asigna la IP estática 172.19.23.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.23.193/30 interface=IF-VLAN1830-WIFI-QC23 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.23.192
# QUÉ HACE: Asigna la IP estática 172.19.24.241 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.241 interface=Lo-QC24 network=172.19.24.241
# QUÉ HACE: Asigna la IP estática 172.19.24.2/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.2/28 interface=IF-VRRP-FIBRA1-QC24 network=172.19.24.0
# QUÉ HACE: Asigna la IP estática 172.19.24.18/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.18/28 interface=IF-VRRP-FIBRA2-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.16
# QUÉ HACE: Asigna la IP estática 172.19.24.34/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.34/28 interface=IF-VRRP-FIBRA3-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.32
# QUÉ HACE: Asigna la IP estática 172.19.24.50/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.50/28 interface=IF-VRRP-WIFI-SOB-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.48
# QUÉ HACE: Asigna la IP estática 172.19.24.66/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.66/28 interface=IF-VRRP-WIFI-QC24 network=172.19.24.64
# QUÉ HACE: Asigna la IP estática 172.19.24.177/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.177/30 interface=IF-VLAN1841-FIBRA1-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.176
# QUÉ HACE: Asigna la IP estática 172.19.24.181/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.181/30 interface=IF-VLAN1842-FIBRA2-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.180
# QUÉ HACE: Asigna la IP estática 172.19.24.185/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.185/30 interface=IF-VLAN1843-FIBRA3-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.184
# QUÉ HACE: Asigna la IP estática 172.19.24.189/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.189/30 interface=IF-VLAN1844-WIFI-SOB-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.188
# QUÉ HACE: Asigna la IP estática 172.19.24.193/30 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.19.24.193/30 interface=IF-VLAN1840-WIFI-QC24 network=\
# QUÉ HACE: Asigna la IP estática None para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
    172.19.24.192
# QUÉ HACE: Asigna la IP estática 10.34.183.231/28 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=10.34.183.231/28 interface=IF-VRRP-LTE network=10.34.183.224
# QUÉ HACE: Asigna la IP estática 172.17.1.200/24 para identificar al equipo en la red.
# UTILIDAD: Punto de acceso para gestión remota y comunicación entre dispositivos de la grúa.
# SI FALTA: El dispositivo no tendría identidad en la Capa 3, imposibilitando el enrutamiento.
add address=172.17.1.200/24 interface=IF-VRRP-VLAN50 network=172.17.1.0

################################################################################
##########   SECCIÓN: /IP FIREWALL NAT   ##########
################################################################################
/ip firewall nat
# QUÉ HACE: Traduce direcciones para acceso externo o publicación de servicios: Traducción.
# UTILIDAD: Permite acceder a cámaras, PLCs o sistemas internos desde redes externas (OT/N4).
# SI FALTA: Los servicios industriales críticos no serían accesibles desde el centro de control.
add action=masquerade chain=srcnat dst-address=172.19.0.0/16 src-address=\
    172.17.1.0/24

################################################################################
##########   SECCIÓN: /IP ROUTE   ##########
################################################################################
/ip route
# QUÉ HACE: Configura parámetros específicos en /ip route.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add distance=1 dst-address=10.34.64.0/23 gateway=10.34.183.230
add distance=1 dst-address=10.34.178.16/28 gateway=172.17.1.1
add distance=1 dst-address=10.34.178.20/32 gateway=172.17.1.1
add distance=1 dst-address=10.34.180.0/28 gateway=172.17.1.1
add distance=1 dst-address=10.236.0.0/16 gateway=172.17.1.1
add distance=1 dst-address=172.16.1.6/32 gateway=172.17.1.1
add distance=1 dst-address=172.17.4.0/24 gateway=172.17.1.1
add distance=1 dst-address=192.168.2.0/24 gateway=172.17.1.1

################################################################################
##########   SECCIÓN: /IP SERVICE   ##########
################################################################################
/ip service
# QUÉ HACE: Configura parámetros específicos en /ip service.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set ssh port=222
set api port=8727

################################################################################
##########   SECCIÓN: /IP SSH   ##########
################################################################################
/ip ssh
# QUÉ HACE: Configura parámetros específicos en /ip ssh.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set allow-none-crypto=yes forwarding-enabled=remote

################################################################################
##########   SECCIÓN: /PPP SECRET   ##########
################################################################################
/ppp secret
# QUÉ HACE: Configura parámetros específicos en /ppp secret.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add local-address=172.19.10.81 name=tunel-lte-qc10 password=Tunel-LTE \
    remote-address=172.19.10.82
add local-address=172.19.11.81 name=tunel-lte-qc11 password=Tunel-LTE \
    remote-address=172.19.11.82
add local-address=172.19.12.81 name=tunel-lte-qc12 password=Tunel-LTE \
    remote-address=172.19.12.82
add local-address=172.19.28.81 name=tunel-lte-qc28 password=Tunel-LTE \
    remote-address=172.19.28.82
add local-address=172.19.29.81 name=tunel-lte-qc29 password=Tunel-LTE \
    remote-address=172.19.29.82
add local-address=172.19.26.81 name=tunel-lte-qc26 password=Tunel-LTE \
    remote-address=172.19.26.82
add local-address=172.19.22.81 name=tunel-lte-qc22 password=Tunel-LTE \
    remote-address=172.19.22.82
add local-address=172.19.21.81 name=tunel-lte-qc21 password=Tunel-LTE \
    remote-address=172.19.21.82
add local-address=172.19.18.81 name=tunel-lte-qc18 password=Tunel-LTE \
    remote-address=172.19.18.82
add local-address=172.19.19.81 name=tunel-lte-qc19 password=Tunel-LTE \
    remote-address=172.19.19.82
add local-address=172.19.17.81 name=tunel-lte-qc17 password=Tunel-LTE \
    remote-address=172.19.17.82
add local-address=172.19.25.81 name=tunel-lte-qc25 password=Tunel-LTE \
    remote-address=172.19.25.82
add local-address=172.19.15.81 name=tunel-lte-qc15 password=Tunel-LTE \
    remote-address=172.19.15.82
add local-address=172.19.16.81 name=tunel-lte-qc16 password=Tunel-LTE \
    remote-address=172.19.16.82
add local-address=172.19.27.81 name=tunel-lte-qc27 password=Tunel-LTE \
    remote-address=172.19.27.82
add local-address=172.19.20.81 name=tunel-lte-qc20 password=Tunel-LTE \
    remote-address=172.19.20.82
add local-address=172.19.23.81 name=tunel-lte-qc23 password=Tunel-LTE \
    remote-address=172.19.23.82
add local-address=172.19.24.81 name=tunel-lte-qc24 password=Tunel-LTE \
    remote-address=172.19.24.82
add local-address=172.19.14.81 name=tunel-lte-qc14 password=Tunel-LTE \
    remote-address=172.19.14.82

################################################################################
##########   SECCIÓN: /ROUTING BGP NETWORK   ##########
################################################################################
/routing bgp network
# QUÉ HACE: Configura parámetros específicos en /routing bgp network.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add network=172.19.11.241/32 synchronize=no
add network=172.19.12.241/32 synchronize=no
add network=172.19.28.241/32 synchronize=no
add network=172.19.29.241/32 synchronize=no
add network=172.19.26.241/32 synchronize=no
add network=172.19.14.241/32 synchronize=no
add network=172.19.22.241/32 synchronize=no
add network=172.19.21.241/32 synchronize=no
add network=172.19.18.241/32 synchronize=no
add network=172.19.19.241/32 synchronize=no
add network=172.19.17.241/32 synchronize=no
add network=172.19.25.241/32 synchronize=no
add network=172.19.15.241/32 synchronize=no
add network=172.19.16.241/32 synchronize=no
add network=172.19.27.241/32 synchronize=no
add network=172.19.20.241/32 synchronize=no
add network=172.19.23.241/32 synchronize=no
add network=172.19.24.241/32 synchronize=no
add network=172.19.10.241/32 synchronize=no

################################################################################
##########   SECCIÓN: /ROUTING BGP PEER   ##########
################################################################################
/routing bgp peer
# QUÉ HACE: Configura parámetros específicos en /routing bgp peer.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC10 \
    keepalive-time=1s name=FIBRA1-2011-QC10 out-filter=BGP-OUT-FIBRA1 \
    remote-address=172.19.10.3 remote-as=65010 use-bfd=yes
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC10 \
    keepalive-time=1s name=FIBRA3-2011-QC10 out-filter=BGP-OUT-FIBRA3 \
    remote-address=172.19.10.35 remote-as=65010 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC10 keepalive-time=1s name=\
    WIFI-SOB-QC10 out-filter=BGP-OUT-SOB remote-address=172.19.10.52 \
    remote-as=65110
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC10 \
    keepalive-time=1s name=FIBRA2-2011-QC10 out-filter=BGP-OUT-FIBRA2 \
    remote-address=172.19.10.19 remote-as=65010 use-bfd=yes
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC10 \
    keepalive-time=1s name=FIBRA1-SOB-QC10 out-filter=BGP-OUT-FIBRA1 \
    remote-address=172.19.10.4 remote-as=65110 use-bfd=yes
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC10 \
    keepalive-time=1s name=FIBRA2-SOB-QC10 out-filter=BGP-OUT-FIBRA2 \
    remote-address=172.19.10.20 remote-as=65110 use-bfd=yes
add disabled=yes hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC10 \
    keepalive-time=1s name=FIBRA3-SOB-QC10 out-filter=BGP-OUT-FIBRA3 \
    remote-address=172.19.10.36 remote-as=65110 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-LTE instance=QC10 keepalive-time=1s name=\
    LTE-SOB-QC10 out-filter=BGP-OUT-LTE-QC10 remote-address=172.19.10.82 \
    remote-as=65110
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC10 keepalive-time=2s \
    name=WIFI-SE-2011-QC10 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.10.67 remote-as=65010
add in-filter=BGP-IN-WIFI-SE instance=QC10 name=WIFI-SE-SOB-QC10 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.10.68 remote-as=65110
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC11 keepalive-time=1s \
    name=FIBRA1-2011-QC11 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.11.3 remote-as=65011 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC11 keepalive-time=1s \
    name=FIBRA1-SOB-QC11 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.11.4 \
    remote-as=65111 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC11 keepalive-time=1s \
    name=FIBRA2-2011-QC11 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.11.19 remote-as=65011 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC11 keepalive-time=1s \
    name=FIBRA2-SOB-QC11 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.11.20 remote-as=65111 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC11 keepalive-time=1s \
    name=FIBRA3-2011-QC11 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.11.35 remote-as=65011 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC11 keepalive-time=1s \
    name=FIBRA3-SOB-QC11 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.11.36 remote-as=65111 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC11 keepalive-time=1s name=\
    WIFI-SOB-QC11 out-filter=BGP-OUT-SOB remote-address=172.19.11.52 \
    remote-as=65111
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC11 keepalive-time=2s \
    name=WIFI-SE-2011-QC11 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.11.67 remote-as=65011
add in-filter=BGP-IN-WIFI-SE instance=QC11 name=WIFI-SE-SOB-QC11 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.11.68 remote-as=65111
add hold-time=3s in-filter=BGP-IN-LTE instance=QC11 keepalive-time=1s name=\
    LTE-SOB-QC11 out-filter=BGP-OUT-LTE-QC11 remote-address=172.19.11.82 \
    remote-as=65111
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC12 keepalive-time=1s \
    name=FIBRA1-2011-QC12 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.12.3 remote-as=65012 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC12 keepalive-time=1s \
    name=FIBRA1-SOB-QC12 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.12.4 \
    remote-as=65112 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC12 keepalive-time=1s \
    name=FIBRA2-2011-QC12 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.12.19 remote-as=65012 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC12 keepalive-time=1s \
    name=FIBRA2-SOB-QC12 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.12.20 remote-as=65112 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC12 keepalive-time=1s \
    name=FIBRA3-2011-QC12 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.12.35 remote-as=65012 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC12 keepalive-time=1s \
    name=FIBRA3-SOB-QC12 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.12.36 remote-as=65112 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-LTE instance=QC12 keepalive-time=1s name=\
    LTE-SOB-QC12 out-filter=BGP-OUT-LTE-QC12 remote-address=172.19.12.82 \
    remote-as=65112
add hold-time=3s in-filter=BGP-IN-SOB instance=QC12 keepalive-time=1s name=\
    WIFI-SOB-QC12 out-filter=BGP-OUT-SOB remote-address=172.19.12.52 \
    remote-as=65112
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC12 keepalive-time=2s \
    name=WIFI-SE-2011-QC12 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.12.67 remote-as=65012
add in-filter=BGP-IN-WIFI-SE instance=QC12 name=WIFI-SE-SOB-QC12 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.12.68 remote-as=65112
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC28 keepalive-time=1s \
    name=FIBRA1-2011-QC28 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.28.3 remote-as=65028 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC28 keepalive-time=1s \
    name=FIBRA1-SOB-QC28 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.28.4 \
    remote-as=65128 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC28 keepalive-time=1s \
    name=FIBRA2-2011-QC28 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.28.19 remote-as=65028 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC28 keepalive-time=1s \
    name=FIBRA2-SOB-QC28 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.28.20 remote-as=65128 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC28 keepalive-time=1s \
    name=FIBRA3-2011-QC28 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.28.35 remote-as=65028 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC28 keepalive-time=1s \
    name=FIBRA3-SOB-QC28 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.28.36 remote-as=65128 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC28 keepalive-time=1s name=\
    WIFI-SOB-QC28 out-filter=BGP-OUT-SOB remote-address=172.19.28.52 \
    remote-as=65128
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC28 keepalive-time=2s \
    name=WIFI-SE-2011-QC28 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.28.67 remote-as=65028
add in-filter=BGP-IN-WIFI-SE instance=QC28 name=WIFI-SE-SOB-QC28 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.28.68 remote-as=65128
add hold-time=3s in-filter=BGP-IN-LTE instance=QC28 keepalive-time=1s name=\
    LTE-SOB-QC28 out-filter=BGP-OUT-LTE-QC28 remote-address=172.19.28.82 \
    remote-as=65128
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC29 keepalive-time=1s \
    name=FIBRA1-2011-QC29 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.29.3 remote-as=65029 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC29 keepalive-time=1s \
    name=FIBRA1-SOB-QC29 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.29.4 \
    remote-as=65129 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC29 keepalive-time=1s \
    name=FIBRA2-2011-QC29 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.29.19 remote-as=65029 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC29 keepalive-time=1s \
    name=FIBRA2-SOB-QC29 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.29.20 remote-as=65129 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC29 keepalive-time=1s \
    name=FIBRA3-2011-QC29 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.29.35 remote-as=65029 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC29 keepalive-time=1s \
    name=FIBRA3-SOB-QC29 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.29.36 remote-as=65129 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-LTE instance=QC29 keepalive-time=1s name=\
    LTE-SOB-QC29 out-filter=BGP-OUT-LTE-QC29 remote-address=172.19.29.82 \
    remote-as=65129
add hold-time=3s in-filter=BGP-IN-SOB instance=QC29 keepalive-time=1s name=\
    WIFI-SOB-QC29 out-filter=BGP-OUT-SOB remote-address=172.19.29.52 \
    remote-as=65129
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC29 keepalive-time=2s \
    name=WIFI-SE-2011-QC29 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.29.67 remote-as=65029
add in-filter=BGP-IN-WIFI-SE instance=QC29 name=WIFI-SE-SOB-QC29 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.29.68 remote-as=65129
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC26 keepalive-time=1s \
    name=FIBRA1-2011-QC26 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.26.3 remote-as=65026 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC26 keepalive-time=1s \
    name=FIBRA1-SOB-QC26 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.26.4 \
    remote-as=65126 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC26 keepalive-time=1s \
    name=FIBRA2-2011-QC26 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.26.19 remote-as=65026 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC26 keepalive-time=1s \
    name=FIBRA2-SOB-QC26 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.26.20 remote-as=65126 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC26 keepalive-time=1s \
    name=FIBRA3-2011-QC26 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.26.35 remote-as=65026 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC26 keepalive-time=1s \
    name=FIBRA3-SOB-QC26 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.26.36 remote-as=65126 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-LTE instance=QC26 keepalive-time=1s name=\
    LTE-SOB-QC26 out-filter=BGP-OUT-LTE-QC26 remote-address=172.19.26.82 \
    remote-as=65126
add hold-time=3s in-filter=BGP-IN-SOB instance=QC26 keepalive-time=1s name=\
    WIFI-SOB-QC26 out-filter=BGP-OUT-SOB remote-address=172.19.26.52 \
    remote-as=65126
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC26 keepalive-time=2s \
    name=WIFI-SE-2011-QC26 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.26.67 remote-as=65026
add in-filter=BGP-IN-WIFI-SE instance=QC26 name=WIFI-SE-SOB-QC26 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.26.68 remote-as=65126
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC14 keepalive-time=1s \
    name=FIBRA1-2011-QC14 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.14.3 remote-as=65014 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC14 keepalive-time=1s \
    name=FIBRA2-2011-QC14 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.14.19 remote-as=65014 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC14 keepalive-time=1s \
    name=FIBRA3-2011-QC14 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.14.35 remote-as=65014 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC14 keepalive-time=1s \
    name=FIBRA1-SOB-QC14 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.14.4 \
    remote-as=65114 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC14 keepalive-time=1s \
    name=FIBRA2-SOB-QC14 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.14.20 remote-as=65114 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC14 keepalive-time=1s \
    name=FIBRA3-SOB-QC14 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.14.36 remote-as=65114 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC14 keepalive-time=1s name=\
    WIFI-SOB-QC14 out-filter=BGP-OUT-SOB remote-address=172.19.14.52 \
    remote-as=65114
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC14 keepalive-time=2s \
    name=WIFI-SE-2011-QC14 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.14.67 remote-as=65014
add in-filter=BGP-IN-WIFI-SE instance=QC14 name=WIFI-SE-SOB-QC14 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.14.68 remote-as=65114
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC22 keepalive-time=1s \
    name=FIBRA1-2011-QC22 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.22.3 remote-as=65022 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC22 keepalive-time=1s \
    name=FIBRA3-2011-QC22 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.22.35 remote-as=65022 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC22 keepalive-time=1s name=\
    WIFI-SOB-QC22 out-filter=BGP-OUT-SOB remote-address=172.19.22.52 \
    remote-as=65122
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC22 keepalive-time=1s \
    name=FIBRA2-2011-QC22 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.22.19 remote-as=65022 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC22 keepalive-time=1s \
    name=FIBRA1-SOB-QC22 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.22.4 \
    remote-as=65122 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC22 keepalive-time=1s \
    name=FIBRA2-SOB-QC22 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.22.20 remote-as=65122 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC22 keepalive-time=1s \
    name=FIBRA3-SOB-QC22 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.22.36 remote-as=65122 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-LTE instance=QC22 keepalive-time=1s name=\
    LTE-SOB-QC22 out-filter=BGP-OUT-LTE-QC22 remote-address=172.19.22.82 \
    remote-as=65122
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC22 keepalive-time=2s \
    name=WIFI-SE-2011-QC22 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.22.67 remote-as=65022
add in-filter=BGP-IN-WIFI-SE instance=QC22 name=WIFI-SE-SOB-QC22 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.22.68 remote-as=65122
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC21 keepalive-time=1s \
    name=FIBRA1-2011-QC21 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.21.3 remote-as=65021 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC21 keepalive-time=1s \
    name=FIBRA2-2011-QC21 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.21.19 remote-as=65021 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC21 keepalive-time=1s \
    name=FIBRA3-2011-QC21 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.21.35 remote-as=65021 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC21 keepalive-time=1s \
    name=FIBRA1-SOB-QC21 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.21.4 \
    remote-as=65121 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC21 keepalive-time=1s \
    name=FIBRA2-SOB-QC21 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.21.20 remote-as=65121 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC21 keepalive-time=1s \
    name=FIBRA3-SOB-QC21 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.21.36 remote-as=65121 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC21 keepalive-time=1s name=\
    WIFI-SOB-QC21 out-filter=BGP-OUT-SOB remote-address=172.19.21.52 \
    remote-as=65121
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC21 keepalive-time=2s \
    name=WIFI-SE-2011-QC21 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.21.67 remote-as=65021
add in-filter=BGP-IN-WIFI-SE instance=QC21 name=WIFI-SE-SOB-QC21 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.21.68 remote-as=65121
add hold-time=3s in-filter=BGP-IN-LTE instance=QC21 keepalive-time=1s name=\
    LTE-SOB-QC21 out-filter=BGP-OUT-LTE-QC21 remote-address=172.19.21.82 \
    remote-as=65121
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC18 keepalive-time=1s \
    name=FIBRA1-2011-QC18 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.18.3 remote-as=65018 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC18 keepalive-time=1s \
    name=FIBRA2-2011-QC18 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.18.19 remote-as=65018 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC18 keepalive-time=1s \
    name=FIBRA3-2011-QC18 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.18.35 remote-as=65018 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC18 keepalive-time=1s \
    name=FIBRA1-SOB-QC18 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.18.4 \
    remote-as=65118 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC18 keepalive-time=1s \
    name=FIBRA2-SOB-QC18 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.18.20 remote-as=65118 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC18 keepalive-time=1s \
    name=FIBRA3-SOB-QC18 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.18.36 remote-as=65118 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC18 keepalive-time=1s name=\
    WIFI-SOB-QC18 out-filter=BGP-OUT-SOB remote-address=172.19.18.52 \
    remote-as=65118
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC18 keepalive-time=2s \
    name=WIFI-SE-2011-QC18 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.18.67 remote-as=65018
add in-filter=BGP-IN-WIFI-SE instance=QC18 name=WIFI-SE-SOB-QC18 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.18.68 remote-as=65118
add hold-time=3s in-filter=BGP-IN-LTE instance=QC18 keepalive-time=1s name=\
    LTE-SOB-QC18 out-filter=BGP-OUT-LTE-QC18 remote-address=172.19.18.82 \
    remote-as=65118
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC19 keepalive-time=1s \
    name=FIBRA1-2011-QC19 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.19.3 remote-as=65019 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC19 keepalive-time=1s \
    name=FIBRA2-2011-QC19 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.19.19 remote-as=65019 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC19 keepalive-time=1s \
    name=FIBRA3-2011-QC19 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.19.35 remote-as=65019 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC19 keepalive-time=1s \
    name=FIBRA1-SOB-QC19 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.19.4 \
    remote-as=65119 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC19 keepalive-time=1s \
    name=FIBRA2-SOB-QC19 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.19.20 remote-as=65119 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC19 keepalive-time=1s \
    name=FIBRA3-SOB-QC19 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.19.36 remote-as=65119 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC19 keepalive-time=1s name=\
    WIFI-SOB-QC19 out-filter=BGP-OUT-SOB remote-address=172.19.19.52 \
    remote-as=65119
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC19 keepalive-time=2s \
    name=WIFI-SE-2011-QC19 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.19.67 remote-as=65019
add in-filter=BGP-IN-WIFI-SE instance=QC19 name=WIFI-SE-SOB-QC19 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.19.68 remote-as=65119
add hold-time=3s in-filter=BGP-IN-LTE instance=QC19 keepalive-time=1s name=\
    LTE-SOB-QC19 out-filter=BGP-OUT-LTE-QC19 remote-address=172.19.19.82 \
    remote-as=65119
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC17 keepalive-time=1s \
    name=FIBRA1-2011-QC17 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.17.3 remote-as=65017 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC17 keepalive-time=1s \
    name=FIBRA2-2011-QC17 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.17.19 remote-as=65017 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC17 keepalive-time=1s \
    name=FIBRA3-2011-QC17 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.17.35 remote-as=65017 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC17 keepalive-time=1s \
    name=FIBRA1-SOB-QC17 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.17.4 \
    remote-as=65117 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC17 keepalive-time=1s \
    name=FIBRA2-SOB-QC17 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.17.20 remote-as=65117 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC17 keepalive-time=1s \
    name=FIBRA3-SOB-QC17 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.17.36 remote-as=65117 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC17 keepalive-time=1s name=\
    WIFI-SOB-QC17 out-filter=BGP-OUT-SOB remote-address=172.19.17.52 \
    remote-as=65117
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC17 keepalive-time=2s \
    name=WIFI-SE-2011-QC17 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.17.67 remote-as=65017
add in-filter=BGP-IN-WIFI-SE instance=QC17 name=WIFI-SE-SOB-QC17 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.17.68 remote-as=65117
add hold-time=3s in-filter=BGP-IN-LTE instance=QC17 keepalive-time=1s name=\
    LTE-SOB-QC17 out-filter=BGP-OUT-LTE-QC17 remote-address=172.19.17.82 \
    remote-as=65117
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC25 keepalive-time=1s \
    name=FIBRA1-2011-QC25 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.25.3 remote-as=65025 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC25 keepalive-time=1s \
    name=FIBRA2-2011-QC25 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.25.19 remote-as=65025 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC25 keepalive-time=1s \
    name=FIBRA3-2011-QC25 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.25.35 remote-as=65025 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC25 keepalive-time=1s \
    name=FIBRA1-SOB-QC25 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.25.4 \
    remote-as=65125 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC25 keepalive-time=1s \
    name=FIBRA2-SOB-QC25 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.25.20 remote-as=65125 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC25 keepalive-time=1s \
    name=FIBRA3-SOB-QC25 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.25.36 remote-as=65125 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC25 keepalive-time=1s name=\
    WIFI-SOB-QC25 out-filter=BGP-OUT-SOB remote-address=172.19.25.52 \
    remote-as=65125
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC25 keepalive-time=2s \
    name=WIFI-SE-2011-QC25 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.25.67 remote-as=65025
add in-filter=BGP-IN-WIFI-SE instance=QC25 name=WIFI-SE-SOB-QC25 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.25.68 remote-as=65125
add hold-time=3s in-filter=BGP-IN-LTE instance=QC25 keepalive-time=1s name=\
    LTE-SOB-QC25 out-filter=BGP-OUT-LTE-QC25 remote-address=172.19.25.82 \
    remote-as=65125
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC15 keepalive-time=1s \
    name=FIBRA1-2011-QC15 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.15.3 remote-as=65015 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC15 keepalive-time=1s \
    name=FIBRA2-2011-QC15 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.15.19 remote-as=65015 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC15 keepalive-time=1s \
    name=FIBRA3-2011-QC15 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.15.35 remote-as=65015 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC15 keepalive-time=1s \
    name=FIBRA1-SOB-QC15 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.15.4 \
    remote-as=65115 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC15 keepalive-time=1s \
    name=FIBRA2-SOB-QC15 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.15.20 remote-as=65115 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC15 keepalive-time=1s \
    name=FIBRA3-SOB-QC15 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.15.36 remote-as=65115 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC15 keepalive-time=1s name=\
    WIFI-SOB-QC15 out-filter=BGP-OUT-SOB remote-address=172.19.15.52 \
    remote-as=65115
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC15 keepalive-time=2s \
    name=WIFI-SE-2011-QC15 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.15.67 remote-as=65015
add in-filter=BGP-IN-WIFI-SE instance=QC15 name=WIFI-SE-SOB-QC15 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.15.68 remote-as=65115
add hold-time=3s in-filter=BGP-IN-LTE instance=QC15 keepalive-time=1s name=\
    LTE-SOB-QC15 out-filter=BGP-OUT-LTE-QC15 remote-address=172.19.15.82 \
    remote-as=65115
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC16 keepalive-time=1s \
    name=FIBRA1-2011-QC16 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.16.3 remote-as=65016 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC16 keepalive-time=1s \
    name=FIBRA2-2011-QC16 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.16.19 remote-as=65016 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC16 keepalive-time=1s \
    name=FIBRA3-2011-QC16 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.16.35 remote-as=65016 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC16 keepalive-time=1s \
    name=FIBRA1-SOB-QC16 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.16.4 \
    remote-as=65116 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC16 keepalive-time=1s \
    name=FIBRA2-SOB-QC16 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.16.20 remote-as=65116 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC16 keepalive-time=1s \
    name=FIBRA3-SOB-QC16 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.16.36 remote-as=65116 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC16 keepalive-time=1s name=\
    WIFI-SOB-QC16 out-filter=BGP-OUT-SOB remote-address=172.19.16.52 \
    remote-as=65116
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC16 keepalive-time=2s \
    name=WIFI-SE-2011-QC16 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.16.67 remote-as=65016
add in-filter=BGP-IN-WIFI-SE instance=QC16 name=WIFI-SE-SOB-QC16 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.16.68 remote-as=65116
add hold-time=3s in-filter=BGP-IN-LTE instance=QC16 keepalive-time=1s name=\
    LTE-SOB-QC16 out-filter=BGP-OUT-LTE-QC16 remote-address=172.19.16.82 \
    remote-as=65116
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC27 keepalive-time=1s \
    name=FIBRA1-2011-QC27 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.27.3 remote-as=65027 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC27 keepalive-time=1s \
    name=FIBRA2-2011-QC27 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.27.19 remote-as=65027 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC27 keepalive-time=1s \
    name=FIBRA3-2011-QC27 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.27.35 remote-as=65027 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC27 keepalive-time=1s \
    name=FIBRA1-SOB-QC27 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.27.4 \
    remote-as=65127 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC27 keepalive-time=1s \
    name=FIBRA2-SOB-QC27 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.27.20 remote-as=65127 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC27 keepalive-time=1s \
    name=FIBRA3-SOB-QC27 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.27.36 remote-as=65127 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC27 keepalive-time=1s name=\
    WIFI-SOB-QC27 out-filter=BGP-OUT-SOB remote-address=172.19.27.52 \
    remote-as=65127
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC27 keepalive-time=2s \
    name=WIFI-SE-2011-QC27 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.27.67 remote-as=65027
add in-filter=BGP-IN-WIFI-SE instance=QC27 name=WIFI-SE-SOB-QC27 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.27.68 remote-as=65127
add hold-time=3s in-filter=BGP-IN-LTE instance=QC27 keepalive-time=1s name=\
    LTE-SOB-QC27 out-filter=BGP-OUT-LTE-QC27 remote-address=172.19.27.82 \
    remote-as=65127
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC20 keepalive-time=1s \
    name=FIBRA1-2011-QC20 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.20.3 remote-as=65020 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC20 keepalive-time=1s \
    name=FIBRA2-2011-QC20 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.20.19 remote-as=65020 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC20 keepalive-time=1s \
    name=FIBRA3-2011-QC20 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.20.35 remote-as=65020 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC20 keepalive-time=1s \
    name=FIBRA1-SOB-QC20 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.20.4 \
    remote-as=65120 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC20 keepalive-time=1s \
    name=FIBRA2-SOB-QC20 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.20.20 remote-as=65120 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC20 keepalive-time=1s \
    name=FIBRA3-SOB-QC20 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.20.36 remote-as=65120 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC20 keepalive-time=1s name=\
    WIFI-SOB-QC20 out-filter=BGP-OUT-SOB remote-address=172.19.20.52 \
    remote-as=65120
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC20 keepalive-time=2s \
    name=WIFI-SE-2011-QC20 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.20.67 remote-as=65020
add in-filter=BGP-IN-WIFI-SE instance=QC20 name=WIFI-SE-SOB-QC20 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.20.68 remote-as=65120
add hold-time=3s in-filter=BGP-IN-LTE instance=QC20 keepalive-time=1s name=\
    LTE-SOB-QC20 out-filter=BGP-OUT-LTE-QC20 remote-address=172.19.20.82 \
    remote-as=65120
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC23 keepalive-time=1s \
    name=FIBRA1-2011-QC23 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.23.3 remote-as=65023 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC23 keepalive-time=1s \
    name=FIBRA2-2011-QC23 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.23.19 remote-as=65023 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC23 keepalive-time=1s \
    name=FIBRA3-2011-QC23 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.23.35 remote-as=65023 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC23 keepalive-time=1s \
    name=FIBRA1-SOB-QC23 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.23.4 \
    remote-as=65123 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC23 keepalive-time=1s \
    name=FIBRA2-SOB-QC23 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.23.20 remote-as=65123 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC23 keepalive-time=1s \
    name=FIBRA3-SOB-QC23 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.23.36 remote-as=65123 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC23 keepalive-time=1s name=\
    WIFI-SOB-QC23 out-filter=BGP-OUT-SOB remote-address=172.19.23.52 \
    remote-as=65123
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC23 keepalive-time=2s \
    name=WIFI-SE-2011-QC23 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.23.67 remote-as=65023
add in-filter=BGP-IN-WIFI-SE instance=QC23 name=WIFI-SE-SOB-QC23 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.23.68 remote-as=65123
add hold-time=3s in-filter=BGP-IN-LTE instance=QC23 keepalive-time=1s name=\
    LTE-SOB-QC23 out-filter=BGP-OUT-LTE-QC23 remote-address=172.19.23.82 \
    remote-as=65123
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC24 keepalive-time=1s \
    name=FIBRA1-2011-QC24 out-filter=BGP-OUT-FIBRA1 remote-address=\
    172.19.24.3 remote-as=65024 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC24 keepalive-time=1s \
    name=FIBRA2-2011-QC24 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.24.19 remote-as=65024 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC24 keepalive-time=1s \
    name=FIBRA3-2011-QC24 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.24.35 remote-as=65024 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA1 instance=QC24 keepalive-time=1s \
    name=FIBRA1-SOB-QC24 out-filter=BGP-OUT-FIBRA1 remote-address=172.19.24.4 \
    remote-as=65124 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA2 instance=QC24 keepalive-time=1s \
    name=FIBRA2-SOB-QC24 out-filter=BGP-OUT-FIBRA2 remote-address=\
    172.19.24.20 remote-as=65124 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-FIBRA3 instance=QC24 keepalive-time=1s \
    name=FIBRA3-SOB-QC24 out-filter=BGP-OUT-FIBRA3 remote-address=\
    172.19.24.36 remote-as=65124 use-bfd=yes
add hold-time=3s in-filter=BGP-IN-SOB instance=QC24 keepalive-time=1s name=\
    WIFI-SOB-QC24 out-filter=BGP-OUT-SOB remote-address=172.19.24.52 \
    remote-as=65124
add hold-time=10s in-filter=BGP-IN-WIFI-SE instance=QC24 keepalive-time=2s \
    name=WIFI-SE-2011-QC24 out-filter=BGP-OUT-WIFI-SE remote-address=\
    172.19.24.67 remote-as=65024
add in-filter=BGP-IN-WIFI-SE instance=QC24 name=WIFI-SE-SOB-QC24 out-filter=\
    BGP-OUT-WIFI-SE remote-address=172.19.24.68 remote-as=65124
add hold-time=3s in-filter=BGP-IN-LTE instance=QC24 keepalive-time=1s name=\
    LTE-SOB-QC24 out-filter=BGP-OUT-LTE-QC24 remote-address=172.19.24.82 \
    remote-as=65124
add hold-time=3s in-filter=BGP-IN-LTE instance=QC14 keepalive-time=1s name=\
    LTE-SOB-QC14 out-filter=BGP-OUT-LTE-QC14 remote-address=172.19.14.82 \
    remote-as=65114

################################################################################
##########   SECCIÓN: /ROUTING FILTER   ##########
################################################################################
/routing filter
# QUÉ HACE: Configura parámetros específicos en /routing filter.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add action=accept chain=BGP-IN-FIBRA1 prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=100
add action=accept chain=BGP-IN-FIBRA2 prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=90
add action=accept chain=BGP-IN-FIBRA3 prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=80
add action=accept chain=BGP-IN-SOB prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=70
add action=accept chain=BGP-IN-WIFI-SE prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=60
add action=accept chain=BGP-IN-LTE prefix=0.0.0.0/0 prefix-length=0-32 \
    set-bgp-local-pref=50
add action=accept chain=BGP-OUT-FIBRA1 prefix=0.0.0.0/0 prefix-length=0-32
add action=accept chain=BGP-OUT-FIBRA2 prefix=0.0.0.0/0 prefix-length=0-32
add action=accept chain=BGP-OUT-FIBRA3 prefix=0.0.0.0/0 prefix-length=0-32
add action=accept chain=BGP-OUT-SOB prefix=0.0.0.0/0 prefix-length=0-32
add action=accept chain=BGP-OUT-WIFI-SE prefix=0.0.0.0/0 prefix-length=0-32
add action=discard chain=BGP-OUT-LTE-QC10 prefix=!172.19.10.241
add action=discard chain=BGP-OUT-LTE-QC11 prefix=!172.19.11.241
add action=discard chain=BGP-OUT-LTE-QC12 prefix=!172.19.12.241
add action=discard chain=BGP-OUT-LTE-QC14 prefix=!172.19.14.241
add action=discard chain=BGP-OUT-LTE-QC15 prefix=!172.19.15.241
add action=discard chain=BGP-OUT-LTE-QC16 prefix=!172.19.16.241
add action=discard chain=BGP-OUT-LTE-QC17 prefix=!172.19.17.241
add action=discard chain=BGP-OUT-LTE-QC18 prefix=!172.19.18.241
add action=discard chain=BGP-OUT-LTE-QC19 prefix=!172.19.19.241
add action=discard chain=BGP-OUT-LTE-QC20 prefix=!172.19.20.241
add action=discard chain=BGP-OUT-LTE-QC21 prefix=!172.19.21.241
add action=discard chain=BGP-OUT-LTE-QC22 prefix=!172.19.22.241
add action=discard chain=BGP-OUT-LTE-QC23 prefix=!172.19.23.241
add action=discard chain=BGP-OUT-LTE-QC24 prefix=!172.19.24.241
add action=discard chain=BGP-OUT-LTE-QC25 prefix=!172.19.25.241
add action=discard chain=BGP-OUT-LTE-QC26 prefix=!172.19.26.241
add action=discard chain=BGP-OUT-LTE-QC27 prefix=!172.19.27.241
add action=discard chain=BGP-OUT-LTE-QC28 prefix=!172.19.28.241
add action=discard chain=BGP-OUT-LTE-QC29 prefix=!172.19.29.241

################################################################################
##########   SECCIÓN: /SNMP   ##########
################################################################################
/snmp
# QUÉ HACE: Configura parámetros específicos en /snmp.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set enabled=yes engine-id=QCCLOUDCORE1 src-address=172.17.1.201 \
    trap-community=snmp4otnetwork trap-version=3

################################################################################
##########   SECCIÓN: /SYSTEM CLOCK   ##########
################################################################################
/system clock
# QUÉ HACE: Configura parámetros específicos en /system clock.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set time-zone-name=Europe/Madrid

################################################################################
##########   SECCIÓN: /SYSTEM IDENTITY   ##########
################################################################################
/system identity
# QUÉ HACE: Configura parámetros específicos en /system identity.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set name=CCR_QC_1

################################################################################
##########   SECCIÓN: /SYSTEM LOGGING   ##########
################################################################################
/system logging
# QUÉ HACE: Configura parámetros específicos en /system logging.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set 0 action=LibreNMS topics=info,!firewall,!account,!bgp
set 1 action=LibreNMS topics=error,!bgp
set 2 action=LibreNMS
set 3 action=LibreNMS
add disabled=yes topics=bgp
add topics=critical
add topics=error
add topics=info
add topics=warning

################################################################################
##########   SECCIÓN: /SYSTEM NTP CLIENT   ##########
################################################################################
/system ntp client
# QUÉ HACE: Configura parámetros específicos en /system ntp client.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set enabled=yes primary-ntp=172.17.1.250

################################################################################
##########   SECCIÓN: /SYSTEM SCHEDULER   ##########
################################################################################
/system scheduler
# QUÉ HACE: Configura parámetros específicos en /system scheduler.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add disabled=yes interval=3s name=conmutarVRRP on-event="conmutarVRRP\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=1w name=backupToNAS on-event=backupToNAS policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=mar/05/2025 start-time=03:45:00
add interval=1d name=resetearPeers on-event=resetearPeers policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/29/2025 start-time=13:55:00

################################################################################
##########   SECCIÓN: /SYSTEM SCRIPT   ##########
################################################################################
/system script
# QUÉ HACE: Configura parámetros específicos en /system script.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
add dont-require-permissions=no name=conmutarVRRP owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" . 
    # Lógica interna del script: inicio de ejecución \
    ":\
# QUÉ HACE: Configura parámetros específicos en /system script.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
    if (([routing bgp peer print count-only]<190)||([interface print count-onl\
    y]<373)||([routing bgp instance print count-only]<19)||([interface bridge \
    port print count-only]<103)||([ip address print count-only]<213)||([routin\
    g bgp network print count-only]<19)||([routing filter print count-only]=0)\
    ||([ip route print count-only where static]<6)) do={interface vrrp set [fi\
    nd where priority!=90] priority=90} else={interface vrrp set [find where p\
    riority!=250] priority=250}"
add dont-require-permissions=no name=backupToNAS owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" . 
    # Lógica interna del script: inicio de ejecución \
    ":\
# QUÉ HACE: Configura parámetros específicos en /system script.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
    local ruta \"BKIdeltec/OT/QC/CORE1/\"\r\
    \n:local ano\r\
    \n:local mes\r\
    \n:local dia\r\
    \n:local mesEnTexto\r\
    \n:local arrayMeses {\r\
    \n    {num=\"01\"; text=\"jan\";}\r\
    \n    {num=\"02\"; text=\"feb\";}\r\
    \n    {num=\"03\"; text=\"mar\";}\r\
    \n    {num=\"04\"; text=\"apr\";}\r\
    \n    {num=\"05\"; text=\"may\";}\r\
    \n    {num=\"06\"; text=\"jun\";}\r\
    \n    {num=\"07\"; text=\"jul\";}\r\
    \n    {num=\"08\"; text=\"aug\";}\r\
    \n    {num=\"09\"; text=\"sep\";}\r\
    \n    {num=\"10\"; text=\"oct\";}\r\
    \n    {num=\"11\"; text=\"nov\";}\r\
    \n    {num=\"12\"; text=\"dec\";}\r\
    \n}\r\
    \n\r\
    \n\r\
    \n:local fechaActual [/system clock get date]\r\
    \n:local primerDash [:find \$fechaActual \"/\"]\r\
    \n:local segundoDash [:find \$fechaActual \"/\" (\$primerDash + 1)]\r\
    \n:set \$mes [:pick \$fechaActual 0 \$primerDash]\r\
    \n:set \$dia [:pick \$fechaActual (\$primerDash + 1) \$segundoDash]\r\
    \n:set \$ano [:pick \$fechaActual (\$segundoDash + 1) [:len \$fechaActual]\
    ]\r\
    \n\r\
    \nforeach index in=\$arrayMeses do={\r\
    \n    :local mesActual (\$index->\"text\")\r\
    \n    :if (\$mesActual = \$mes) do={\r\
    \n        :set \$mesEnTexto (\$index->\"num\")\r\
    \n    }\r\
    \n}\r\
    \n\r\
    \n:local fechaFormateada (\$ano . \"-\" . \$mesEnTexto . \"-\" . \$dia)\r\
    \n\r\
    \n:local exportacion\r\
    \n:local exportacionConRSC\r\
    \n:local exportacionConRSC\r\
    \n\r\
    \n:set \$exportacion (\$fechaFormateada . \"_\" . [/system identity get na\
    me])\r\
    \n:set \$exportacionConRSC (\$exportacion . \".rsc\")\r\
    \n:set \$exportacionConBackup (\$exportacion . \".backup\")\r\
    \n\r\
    \nsystem backup save name=\$exportacion\r\
    \nexport file=\$exportacion\r\
    \n:delay 10\r\
    \n/tool fetch mode=ftp address=172.16.1.6 user=BackupCMS password=B4ckup.3\
    72  src-path=\$exportacionConRSC  dst-path=(\$ruta . \$exportacionConRSC) \
    upload=yes\r\
    \n:delay 10\r\
    \n/tool fetch mode=ftp address=172.16.1.6 user=BackupCMS password=B4ckup.3\
    72  src-path=\$exportacionConBackup  dst-path=(\$ruta . \$exportacionConBa\
    ckup) upload=yes\r\
    \n:delay 10\r\
    \n/file remove [find name~\".rsc\"]\r\
    \n/file remove [find name~\".backup\"]"
add dont-require-permissions=no name=resetearPeers owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=("" . 
    # Lógica interna del script: inicio de ejecución \
    ":\
# QUÉ HACE: Configura parámetros específicos en /system script.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
    foreach peer in=[/routing bgp peer find] do={\r\
    \n    :local state [/routing bgp peer get \$peer state]\r\
    \n    :local disabled [/routing bgp peer get \$peer disabled]\r\
    \n    :local name [/routing bgp peer get \$peer name]\r\
    \n\r\
    \n    :if ((\$state != \"established\") && (\$disabled = false)) do={\r\
    \n        /routing bgp peer disable \$peer\r\
    \n        :log warning (\"Reseteando peer \\\"\$name\\\" \")\r\
    \n        :delay\r\
    \n        /routing bgp peer enable \$peer\r\
    \n    }\r\
    \n}\r\
    \n:log warning \"Terminado el reseteo\""

################################################################################
##########   SECCIÓN: /TOOL ROMON   ##########
################################################################################
/tool romon
# QUÉ HACE: Configura parámetros específicos en /tool romon.
# UTILIDAD: Optimiza el rendimiento o la seguridad del sistema MikroTik.
# SI FALTA: Posible degradación del servicio o configuración fuera de estándar.
set enabled=yes


########## MEJORAS Y OPTIMIZACIONES SUGERIDAS ##########
# 1. Verificar que todas las reglas de firewall tengan 'comment' para auditoría futura.
# 2. Asegurar que las interfaces no utilizadas en N4 estén deshabilitadas.
# 3. Implementar DNS estático para los dispositivos de infraestructura críticos.
# REVIEW: La IP 172.19.10.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.17.1.201 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.10.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 10.34.183.232 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.11.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.12.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.28.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.29.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.26.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.14.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.22.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.21.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.18.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.19.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.17.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.25.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.15.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.16.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.27.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.20.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.23.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.241 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.2 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.18 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.34 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.50 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.66 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.177 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.181 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.185 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.189 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.19.24.193 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 10.34.183.231 parece ser un Gateway, verificar si necesita descripción manual.
# REVIEW: La IP 172.17.1.200 parece ser un Gateway, verificar si necesita descripción manual.
