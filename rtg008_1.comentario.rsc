################################################################################
##########   MANUAL TÉCNICO DE OPERACIÓN Y MANTENIMIENTO - RTG081   ###########
################################################################################

# Generado para: Personal Técnico de Campo y Operaciones.
# Dispositivo: MikroTik RBMetalG-52SHPacn (RTG081_ANT1)
# Objetivo: Documentación exhaustiva 1:1 de la configuración de red.

################################################################################
##########   SECCIÓN: IDENTIDAD Y RELOJ   ######################################
################################################################################

# QUÉ HACE: Define el nombre lógico 'RTG081_ANT1' para el dispositivo.
# UTILIDAD: Permite distinguir esta antena de otras 80 en el sistema de monitorización (LibreNMS/Winbox).
# SI FALTA: Recibiríamos logs genéricos de 'MikroTik', imposibilitando localizar averías rápido.
/system identity
set name=RTG081_ANT1

# QUÉ HACE: Ajusta la zona horaria a 'Europe/Madrid'.
# UTILIDAD: Garantiza que los registros de eventos (logs) coincidan con la hora local real.
# SI FALTA: Los logs tendrían un desfase horario, dificultando la correlación con incidentes en la grúa.
/system clock
set time-zone-name=Europe/Madrid

################################################################################
##########   SECCIÓN: INTERFACES EOIP (TÚNEL CAPA 2)   #########################
################################################################################

/interface eoip
# QUÉ HACE: Crea un túnel de Capa 2 (EoIP) hacia el Core (CRS) central (192.168.30.100).
# UTILIDAD: Permite que la grúa actúe como si estuviera conectada por cable directo al centro de datos.
#           - keepalive=10s,3: Vigila si el túnel cae (3 fallos de 10s cada uno).
#           - Tunnel ID 101: Identificador único que debe coincidir en ambos extremos.
# SI FALTA: La grúa quedaría aislada de la red troncal (TOS, cámaras, telemetría) aunque el Wi-Fi funcione.
add keepalive=10s,3 local-address=192.168.30.101 loop-protect=off \
    mac-address=FE:6D:33:6D:17:33 name=IF-EOIP-CRS remote-address=\
    192.168.30.100 tunnel-id=101

################################################################################
##########   SECCIÓN: REDES VIRTUALES (VLANS)   ################################
################################################################################

/interface vlan
# QUÉ HACE: Define la VLAN 10 para el tráfico OT (Operaciones/PLC) dentro del túnel EoIP.
# UTILIDAD: Separa el tráfico de control de la grúa de otros tráficos menos críticos.
# SI FALTA: Los PLC y sistemas SCADA de la grúa no tendrían conectividad.
add interface=IF-EOIP-CRS name=IF-VLAN10-OT vlan-id=10

# QUÉ HACE: Define la VLAN 20 para el tráfico N4 (Gestión de Terminal) dentro del túnel EoIP.
# UTILIDAD: Canaliza los datos del sistema de gestión de terminales (TOS) de forma aislada.
# SI FALTA: El operario no recibiría órdenes de trabajo en su terminal de cabina.
add interface=IF-EOIP-CRS name=IF-VLAN20-N4 vlan-id=20

################################################################################
##########   SECCIÓN: REDUNDANCIA DE PUERTA DE ENLACE (VRRP)   #################
################################################################################

/interface vrrp
# QUÉ HACE: Implementa redundancia para el Gateway OT interno. Prioridad 250 indica que es Master.
# UTILIDAD: Si esta antena falla, otra tomaría su lugar de forma invisible para los equipos OT.
# SI FALTA: Un fallo en el hardware de red de la antena dejaría a la grúa sin salida OT.
add group-authority=self interface=IF-VLAN10-OT interval=5s name=\
    IF-VRRP-VLAN10-INT priority=250 vrid=10

# QUÉ HACE: Implementa redundancia para el Gateway N4 interno.
# UTILIDAD: Asegura que el flujo de datos TOS (N4) tenga un gateway de reserva.
# SI FALTA: Inestabilidad en la conexión de cabina ante fallos de hardware.
add group-authority=self interface=IF-VLAN20-N4 interval=5s name=\
    IF-VRRP-VLAN20-INT priority=250 vrid=20

################################################################################
##########   SECCIÓN: LISTAS DE INTERFACES Y LTE   #############################
################################################################################

/interface list
# QUÉ HACE: Crea agrupaciones lógicas para simplificar las reglas de Firewall posteriores.
# UTILIDAD: Permite aplicar 'Denegar todo' a lo que no esté en VRRP-INT de una sola vez.
# SI FALTA: Tendríamos que escribir 4 veces más reglas de seguridad, con mayor riesgo de error.
add name=VRRP-EXT
add name=VRRP-INT

/interface lte apn
# QUÉ HACE: Configura el Punto de Acceso (APN) para el módem de respaldo LTE.
# UTILIDAD: Define cómo se conecta el router a la red móvil si falla la fibra/Wi-Fi.
# SI FALTA: El backup por tarjeta SIM no funcionaría.
set [ find default=yes ] ip-type=ipv4 use-network-apn=no

################################################################################
##########   SECCIÓN: SEGURIDAD INALÁMBRICA (WI-FI)   ##########################
################################################################################

/interface wireless security-profiles
# QUÉ HACE: Configuración básica de identidad para el suplicante.
set [ find default=yes ] supplicant-identity=MikroTik

# QUÉ HACE: Crea el perfil 'RTG_AP' con cifrado WPA/WPA2-PSK.
# UTILIDAD: Protege las comunicaciones por radio de intrusiones y ataques de desautenticación (mfp=allowed).
# SI FALTA: La antena se conectaría sin cifrado o fallaría la asociación con los APs del puerto.
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=RTG_AP supplicant-identity=MikroTik

################################################################################
##########   SECCIÓN: RADIO FÍSICO 5GHZ   ######################################
################################################################################

/interface wireless
# QUÉ HACE: Configura los parámetros físicos del radio inalámbrico wlan1.
# PARÁMETROS CLAVE:
#   - antenna-gain=12: Ajusta la potencia de salida según la antena de 12dBi integrada.
#   - mode=station-pseudobridge: Permite pasar tráfico de Capa 2 por Wi-Fi de forma transparente.
#   - wireless-protocol=802.11: Estándar de comunicación compatible con la infraestructura.
# UTILIDAD: Es el corazón de la conectividad móvil de la grúa.
# SI FALTA: No habría enlace físico; la grúa estaría desconectada de la red.
set [ find default-name=wlan1 ] antenna-gain=12 band=5ghz-a/n/ac country=\
    no_country_set disabled=no frequency=auto frequency-mode=superchannel \
    mode=station-pseudobridge radio-name=RTG081_ANT1 security-profile=RTG_AP \
    ssid=RTG_AP wireless-protocol=802.11

################################################################################
##########   SECCIÓN: VLANs SOBRE WI-FI E INTERFACES DINÁMICAS   ###############
################################################################################

/interface vlan
# QUÉ HACE: Define la VLAN 8 (N4) que se transporta directamente por el aire (wlan1).
# UTILIDAD: Gestiona el tráfico N4 que viene de los APs del patio.
# SI FALTA: El router no entendería los paquetes N4 marcados que llegan por radio.
add interface=wlan1 name=IF-VLAN8-N4 vlan-id=8

# QUÉ HACE: Define la VLAN 9 (OT) sobre el enlace Wi-Fi.
# UTILIDAD: Gestiona el tráfico industrial OT recibido por radio.
# SI FALTA: Desconexión de los sistemas de operaciones vía radio.
add interface=wlan1 name=IF-VLAN9-OT vlan-id=9

# QUÉ HACE: Define la VLAN 99 para la gestión remota del router vía Wi-Fi.
# UTILIDAD: Permite entrar al router por Winbox incluso si los túneles fallan.
# SI FALTA: Perderíamos acceso administrativo si el túnel EoIP cayera.
add interface=wlan1 name=IF-VLAN99 vlan-id=99

################################################################################
##########   SECCIÓN: CONTROL VRRP EXTERNO (GEOFENCING LÓGICO)   ###############
################################################################################

/interface vrrp
# QUÉ HACE: VRRP de la red N4 sobre Wi-Fi. Incorpora lógica activa (Scripts).
# LÓGICA ON-MASTER/BACKUP:
#   - Cuando este VRRP es Master (esta antena manda): Habilita la IP del CRS (172.20.1.181).
#   - Cuando es Backup: La deshabilita para evitar conflictos de IP con otras antenas.
# UTILIDAD: Gestión inteligente de la identidad de red del CRS según la mejor antena.
# SI FALTA: Conflicto de IPs masivo si dos antenas intentan representar al CRS al mismo tiempo.
add group-authority=IF-VRRP-VLAN20-INT interface=IF-VLAN8-N4 interval=5s \
    name=IF-VRRP-VLAN8-N4 on-backup=\
    "/ip address set [find where comment=\"CRS\"] disabled=yes" on-master=\
    "/ip address set [find where comment=\"CRS\"] disabled=no" priority=250 \
    vrid=217

# QUÉ HACE: VRRP de la red OT sobre Wi-Fi.
# UTILIDAD: Redundancia de acceso para el segmento industrial externo.
# SI FALTA: Inestabilidad en la salida OT por radio.
add group-authority=self interface=IF-VLAN9-OT interval=5s name=\
    IF-VRRP-VLAN9-OT priority=250 vrid=216

################################################################################
##########   SECCIÓN: LOGGING Y AUDITORÍA   ####################################
################################################################################

/system logging action
# QUÉ HACE: Crea un destino de logs en disco llamado 'roamingLogs'.
# UTILIDAD: Permite almacenar hasta 10 archivos de 60,000 líneas con el historial de saltos Wi-Fi.
#           - Indispensable para depurar por qué una grúa se desconectó en un punto ciego.
# SI FALTA: Los logs de roaming se perderían al reiniciar el equipo o se sobrescribirían rápido en RAM.
add disk-file-count=10 disk-file-name=roamingLog disk-lines-per-file=60000 \
    name=roamingLogs target=disk

# QUÉ HACE: Configura la exportación de logs hacia un servidor remoto Syslog (LibreNMS).
# UTILIDAD: Centraliza las alertas de todas las grúas en un panel de monitorización central.
# SI FALTA: Habría que entrar grúa por grúa para ver los fallos; no habría alertas proactivas.
add name=LibreNMS remote=172.17.1.207 target=remote

################################################################################
##########   SECCIÓN: OPTIMIZACIÓN Y SEGURIDAD IP   ############################
################################################################################

/ip firewall connection tracking
# QUÉ HACE: Habilita el rastreo de conexiones con un tiempo de espera UDP de 10 segundos.
# UTILIDAD: Evita que la tabla de conexiones se llene de sesiones muertas, ahorrando memoria CPU.
# SI FALTA: El router podría bloquearse bajo mucha carga si la tabla de conexiones se desborda.
set enabled=yes udp-timeout=10s

/ip neighbor discovery-settings
# QUÉ HACE: Desactiva el protocolo de descubrimiento de vecinos en interfaces dinámicas.
# UTILIDAD: Seguridad. Evita que dispositivos no autorizados vean información técnica de la antena.
# SI FALTA: Riesgo de exposición de topología de red a usuarios conectados.
set discover-interface-list=!dynamic

/ip settings
# QUÉ HACE: Amplía el límite de la tabla ARP a 8192 entradas.
# UTILIDAD: Soporta redes industriales con gran cantidad de dispositivos (cámaras, sensores, etc.).
# SI FALTA: Podrían producirse intermitencias si el router olvida las direcciones MAC de los equipos.
set max-neighbor-entries=8192

/ipv6 settings
# QUÉ HACE: Desactiva completamente IPv6.
# UTILIDAD: Reduce la superficie de ataque y simplifica el ruteo, ya que la infraestructura es 100% IPv4.
# SI FALTA: El router intentaría procesar tráfico IPv6 innecesario, consumiendo recursos.
set disable-ipv6=yes max-neighbor-entries=8192

################################################################################
##########   SECCIÓN: AGRUPACIÓN LÓGICA DE INTERFACES   ########################
################################################################################

/interface list member
# QUÉ HACE: Asocia las interfaces VRRP de las VLANs externas e internas a sus respectivas listas.
# UTILIDAD: Facilita enormemente el mantenimiento del Firewall.
# SI FALTA: Las reglas de Firewall de 'entrada' y 'salida' dejarían de funcionar.
add interface=IF-VRRP-VLAN8-N4 list=VRRP-EXT
add interface=IF-VRRP-VLAN9-OT list=VRRP-EXT
add interface=IF-VRRP-VLAN10-INT list=VRRP-INT
add interface=IF-VRRP-VLAN20-INT list=VRRP-INT

/interface ovpn-server server
# QUÉ HACE: Configura los parámetros base del servidor OpenVPN del router.
# UTILIDAD: Permite conexión remota segura para mantenimiento técnico.
# SI FALTA: No se podría acceder por VPN al dispositivo.
add auth=sha1,md5 mac-address=FE:CC:7A:0B:1C:50 name=ovpn-server1

################################################################################
##########   SECCIÓN: LISTA DE CONEXIÓN WI-FI (FILTRO AP)   ####################
################################################################################

/interface wireless connect-list
# QUÉ HACE: Define el punto de acceso preferido por dirección MAC.
# UTILIDAD: Fuerza a la antena a buscar primero su AP de confianza ('mejorAP').
# SI FALTA: El roaming dependería puramente del azar del escaneo, tardando más tiempo.
add comment=mejorAP interface=wlan1 mac-address=F4:1E:57:5B:95:B9

# QUÉ HACE: Deniega cualquier otra conexión que no esté en la lista anterior.
# UTILIDAD: Seguridad perimetral extrema; la grúa no se conectará a redes Wi-Fi abiertas o extrañas.
# SI FALTA: Riesgo de que la antena se conecte a un SSID falso, perdiendo la conexión con el puerto.
add comment=denegarTodo connect=no interface=wlan1

################################################################################
##########   SECCIÓN: PLAN DE DIRECCIONAMIENTO IP   ############################
################################################################################

/ip address
# QUÉ HACE: Asigna la IP de gestión local (172.20.0.81) sobre la VLAN 99.
# UTILIDAD: Puerta de entrada para Winbox/SSH vía red de mantenimiento.
# SI FALTA: Imposible gestionar el equipo remotamente por la red de antenas.
add address=172.20.0.81/23 interface=IF-VLAN99 network=172.20.0.0

# QUÉ HACE: Asigna una dirección de Loopback.
# UTILIDAD: Identidad persistente del router independientemente de qué cable esté conectado.
# SI FALTA: Fallarían ciertos protocolos de ruteo avanzado.
add address=192.168.30.101 interface=lo network=192.168.30.101

# QUÉ HACE: IP del enlace físico hacia el switch de la grúa (ether1).
# UTILIDAD: Conexión local por cable con el CRS/PLC.
# SI FALTA: El router no vería los equipos que tiene 'debajo' por cable.
add address=192.168.10.251/29 interface=ether1 network=192.168.10.248

# QUÉ HACE: Dirección IP en la red N4 interna.
# UTILIDAD: Permite al router comunicarse con el segmento TOS de la grúa.
# SI FALTA: Interrupción del servicio N4 (Gestión).
add address=192.168.0.241/29 interface=IF-VLAN20-N4 network=192.168.0.240

# QUÉ HACE: Crea una IP virtual comentada como 'CRS'.
# UTILIDAD: Esencial para la lógica VRRP. Esta IP se activa/desactiva según la antena sea Master o Backup.
# SI FALTA: El Centro de Control (CRS) no podría ser alcanzado redundantemente.
add address=172.20.1.181/23 comment=CRS interface=IF-VLAN99 network=\
    172.20.0.0

# QUÉ HACE: Dirección IP en la red OT interna.
# UTILIDAD: Comunicación con los PLCs y sistemas de control de la grúa.
# SI FALTA: Pérdida de telemetría y control industrial (OT).
add address=192.168.10.241/29 interface=IF-VLAN10-OT network=192.168.10.240

# QUÉ HACE: Gateway virtual (VIP) para el segmento OT interno (VRed 10).
# UTILIDAD: Los equipos de la grúa usan la .1 como su puerta de salida siempre disponible.
# SI FALTA: Los equipos de la grúa no sabrían por dónde salir a internet/red troncal.
add address=192.168.10.1/24 interface=IF-VRRP-VLAN10-INT network=192.168.10.0

# QUÉ HACE: Gateway virtual (VIP) para el segmento N4 interno (VRed 20).
# UTILIDAD: Los terminales TOS usan la .109 como su salida redundante.
# SI FALTA: Fallo en el ruteo de salida de los terminales industriales.
add address=192.168.0.109/24 interface=IF-VRRP-VLAN20-INT network=192.168.0.0

# QUÉ HACE: IP en la red OT externa (Wi-Fi).
# UTILIDAD: Salida industrial hacia la red del patio por radio.
# SI FALTA: No habría comunicación OT con el resto del puerto vía inalámbrica.
add address=172.17.11.81/24 interface=IF-VRRP-VLAN9-OT network=172.17.11.0

# QUÉ HACE: IP en la red N4 externa (Wi-Fi).
# UTILIDAD: Salida de gestión hacia la red del patio por radio.
# SI FALTA: No habría comunicación N4 con el centro de control vía inalámbrica.
add address=10.34.49.81/25 interface=IF-VRRP-VLAN8-N4 network=10.34.49.0

# QUÉ HACE: Direcciones de servicio local (Localhost) mapeadas en las interfaces.
# UTILIDAD: Necesario para que ciertos procesos internos respondan correctamente.
# SI FALTA: Comportamiento errático en peticiones locales de red.
add address=127.0.0.1 interface=IF-VLAN9-OT network=127.0.0.1
add address=127.0.0.1 interface=IF-VLAN8-N4 network=127.0.0.1

################################################################################
##########   SECCIÓN: SEGURIDAD PERIMETRAL (FIREWALL FILTER)   #################
################################################################################

/ip firewall filter
# QUÉ HACE: Aplica Fasttrack a conexiones establecidas y relacionadas.
# UTILIDAD: Mejora el rendimiento del procesador al saltarse el procesamiento de paquetes de flujos ya conocidos.
# SI FALTA: El router consumiría mucha más CPU, pudiendo degradar la velocidad de red en picos de tráfico.
add action=fasttrack-connection chain=forward comment=FASTTRACK \
    connection-state=established,related hw-offload=yes

# QUÉ HACE: Permite tráfico entrante (INPUT) ya establecido o relacionado.
# UTILIDAD: Estabilidad. Permite que las respuestas a peticiones realizadas por el router vuelvan a entrar.
# SI FALTA: El router no podría descargar actualizaciones, sincronizar hora NTP ni establecer túneles.
add action=accept chain=input comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related

# QUÉ HACE: Permite tráfico de reenvío (FORWARD) ya establecido o relacionado.
# UTILIDAD: Permite que los equipos internos (PLC, Terminal) reciban las respuestas de sus peticiones al exterior.
# SI FALTA: Los equipos internos perderían la conectividad con el exterior.
add action=accept chain=forward comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related

# QUÉ HACE: Permite tráfico saliente (OUTPUT) ya establecido o relacionado.
# UTILIDAD: Mantiene la integridad de las sesiones generadas por el propio MikroTik.
# SI FALTA: Cortes en servicios nativos del router.
add action=accept chain=output comment=PERMITIR_ESTABLECIDAS_RELACIONADAS \
    connection-state=established,related

# QUÉ HACE: Permite acceso por SSH (puerto 22).
# UTILIDAD: Permite la gestión administrativa por consola segura.
# SI FALTA: No se podría gestionar el router por terminal/scripts remotos.
add action=accept chain=input comment=PERMITIR_SSH dst-port=22 protocol=tcp

# QUÉ HACE: Permite acceso total desde la IP del servidor NAS (172.16.1.6).
# UTILIDAD: Necesario para que el servidor de backup y actualización pueda comunicarse con la antena.
# SI FALTA: Fallarían las actualizaciones de roaming y los backups automáticos.
add action=accept chain=input comment=PERMITIR_NAS src-address=172.16.1.6

# QUÉ HACE: Permite Winbox (8291) desde una IP de gestión específica (10.34.49.98).
# UTILIDAD: Acceso privilegiado para el administrador principal.
# SI FALTA: Bloqueo de acceso visual Winbox desde el puesto de mando.
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=10.34.49.98

# QUÉ HACE: Permite Winbox (8291) desde cualquier red QUE NO SEA la 10.34.49.0/25.
# UTILIDAD: Flexibilidad de acceso administrativo desde otras subredes de la terminal.
# SI FALTA: Restricción excesiva de acceso por Winbox.
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=!10.34.49.0/25

# QUÉ HACE: Permite el protocolo de la API de MikroTik (puerto 8728).
# UTILIDAD: Necesario para que software externo automatizado pueda configurar o leer datos del router.
# SI FALTA: Los dashboards de monitorización dejarían de recibir datos en tiempo real.
add action=accept chain=input comment=PERMITIR_API dst-port=8728 protocol=tcp

# QUÉ HACE: Permite la API-SSL cifrada (puerto 8729) solo desde la VLAN de gestión.
# UTILIDAD: Comunicación segura y privada para herramientas de administración.
# SI FALTA: Fallo de conexión en apps administrativas que requieran cifrado SSL.
add action=accept chain=input comment=PERMITIR_API_SSL dst-port=8729 \
    in-interface=IF-VLAN99 protocol=tcp

# QUÉ HACE: Permite sincronización de hora NTP (puerto 123).
# UTILIDAD: Vital para que el reloj del sistema esté siempre en hora.
# SI FALTA: Los logs y certificados de seguridad fallarían por desfase temporal.
add action=accept chain=input comment=PERMITIR_NTP dst-port=123 protocol=udp

# QUÉ HACE: Permite consultas SNMP (puerto 161) desde la VLAN de gestión.
# UTILIDAD: Permite a LibreNMS extraer estadísticas de tráfico y estado.
# SI FALTA: Nos quedaríamos "ciegos" respecto al rendimiento del router en el panel central.
add action=accept chain=input comment=PERMITIR_SNMP dst-port=161 \
    in-interface=IF-VLAN99 protocol=udp

# QUÉ HACE: Permite el protocolo VRRP.
# UTILIDAD: Indispensable para que las antenas se comuniquen entre sí y decidan quién es Master/Backup.
# SI FALTA: Fallo catastrófico de la redundancia; ambas antenas podrían intentar ser Master.
add action=accept chain=input comment=PERMITIR_VRRP protocol=vrrp

# QUÉ HACE: Permite ICMP (Ping).
# UTILIDAD: Herramienta básica de diagnóstico de red.
# SI FALTA: No se podría verificar si el router está vivo mediante 'ping'.
add action=accept chain=input comment=PERMITIR_ICMP protocol=icmp

# QUÉ HACE: Permite acceso desde la red interna de la grúa (192.168.0.0/24).
# UTILIDAD: Confianza total en los dispositivos conectados localmente a la grúa.
# SI FALTA: Los equipos de la grúa no podrían comunicarse con el router.
add action=accept chain=input comment=PERMITIR_RED_INTERNA src-address=\
    192.168.0.0/24

# QUÉ HACE: Permite accesos por VNC (puestos 5900-5901).
# UTILIDAD: Acceso remoto a las pantallas industriales de cabina.
# SI FALTA: El soporte técnico no podría ver lo que ve el operario.
add action=accept chain=input comment=PERMITIR_VNC dst-port=5900-5901 \
    protocol=tcp

# QUÉ HACE: Permite el reenvío de tráfico NATeado desde el exterior (excepto VIPs N4).
# UTILIDAD: Permite que las redirecciones de puertos (cámaras, PLC) funcionen correctamente.
# SI FALTA: Las reglas de la sección 'NAT' dejarían de funcionar.
add action=accept chain=forward comment=PERMITIR_NAT connection-nat-state=\
    dstnat src-address=!10.34.49.0/25

# QUÉ HACE: Permite el reenvío de Pings.
# UTILIDAD: Permite diagnosticar equipos internos desde el exterior.
# SI FALTA: No se podría hacer ping a las cámaras o PLCs desde el Core.
add action=accept chain=forward comment=PERMITIR_ICMP protocol=icmp

# QUÉ HACE: Permite que todo lo que salga de la grúa hacia afuera sea aceptado.
# UTILIDAD: Libertad de comunicaciones salientes para los procesos industriales.
# SI FALTA: Bloqueo de reportes de estado de la grúa hacia el servidor TOS.
add action=accept chain=forward comment=DESDE_RTG_HACIA_FUERA src-address=\
    192.168.0.0/24

# QUÉ HACE: Permite al router enviar datos al NAS.
# UTILIDAD: Necesario para subir los backups semanales.
# SI FALTA: Los backups fallarían al intentar ser transmitidos.
add action=accept chain=output comment=PERMITIR_NAS dst-address=172.16.1.6

# QUÉ HACE: Permite al router pedir la hora por NTP.
# UTILIDAD: Origina la petición de sincronización horaria.
# SI FALTA: El reloj quedaría estático y desactualizado.
add action=accept chain=output comment=PERMITIR_NTP dst-port=123 protocol=udp

# QUÉ HACE: Permite al router hacer Pings hacia el exterior.
# UTILIDAD: Permite al router autodiagnosticar su conexión (Netwatch).
# SI FALTA: El router no sabría si su puerta de enlace está caída.
add action=accept chain=output comment=PERMITIR_ICMP protocol=icmp

# QUÉ HACE: Permite el envío de Syslog a LibreNMS.
# UTILIDAD: Envío activo de eventos críticos al monitor central.
# SI FALTA: Silencio administrativo en el panel de alertas remoto.
add action=accept chain=output comment=PERMITIR_SYSLOG dst-address=\
    172.17.1.207

# QUÉ HACE: Permite Winbox desde cualquier subred excepto la 172.17.11.0/24.
# UTILIDAD: Regla de seguridad granular para accesos administrativos.
# SI FALTA: Restricción de acceso desde puntos autorizados.
add action=accept chain=input comment=PERMITIR_WINBOX dst-port=8291 protocol=\
    tcp src-address=!172.17.11.0/24

# QUÉ HACE: Permite acceso desde el servidor central Milestone (Cámaras).
# UTILIDAD: Permite que el servidor de video gestione las cámaras de la grúa.
# SI FALTA: Pantallas de cámaras en negro en el centro de control.
add action=accept chain=input comment=PERMITIR_MILESTONE src-address=\
    172.16.1.0/28

# QUÉ HACE: Permite reenvío NAT excepto desde la subred 172.17.11.0/24.
# UTILIDAD: Control fino de redirecciones industriales.
# SI FALTA: Mal funcionamiento de accesos a dispositivos internos.
add action=accept chain=forward comment=PERMITIR_NAT connection-nat-state=\
    dstnat src-address=!172.17.11.0/24

# QUÉ HACE: Permite tráfico L2TP hacia el módem LTE.
# UTILIDAD: Necesario para el túnel de respaldo celular.
# SI FALTA: El backup por tarjeta SIM podría no establecer el túnel correctamente.
add action=accept chain=forward comment=PERMITIR_L2TP_LTE dst-port=1701 \
    protocol=udp

# QUÉ HACE: Permite el protocolo GRE (Protocolo 47) necesario para el túnel EoIP.
# UTILIDAD: Es el envoltorio que permite viajar al tráfico de Capa 2 sobre IP.
# SI FALTA: El túnel EoIP nunca levantaría (quedaría en estado 'no running').
add action=accept chain=input comment=PERMITIR_EOIP protocol=gre
add action=accept chain=output comment=PERMITIR_EOIP protocol=gre

# QUÉ HACE: Permite el reenvío de la red interna OT hacia el exterior.
# UTILIDAD: Los PLC envían sus datos al sistema SCADA central.
# SI FALTA: Los supervisores no verían el estado de la grúa en tiempo real.
add action=accept chain=forward comment=PERMITIR_RED_INTERNA out-interface=\
    IF-VRRP-VLAN9-OT src-address=192.168.10.0/24

# QUÉ HACE: Permite acceso desde el dispositivo 'Controlino'.
# UTILIDAD: Integración con hardware de automatización específico de Ideltec.
# SI FALTA: Fallo en módulos auxiliares de control de la grúa.
add action=accept chain=forward comment=PERMITIR_CONTROLINO src-address=\
    192.168.10.249

# QUÉ HACE: REGLAS DE BLOQUEO TOTAL (DROP).
# UTILIDAD: Seguridad "Zero Trust". Todo lo que no ha sido permitido explícitamente arriba, se bloquea.
# SI FALTA: El router sería vulnerable a escaneos, ataques de fuerza bruta y tráfico no deseado. Es la regla más importante de seguridad.
add action=drop chain=input comment=DENEGAR_INPUT
add action=drop chain=forward comment=DENEGAR_FORWARD
add action=drop chain=output comment=DENEGAR_OUTPUT

################################################################################
##########   SECCIÓN: REDIRECCIÓN DE PUERTOS INDUSTRIALES (NAT)   ##############
################################################################################

/ip firewall nat
# QUÉ HACE: Enmascaramiento de salida para el tráfico N4 por Wi-Fi.
# UTILIDAD: Permite que los equipos internos compartan la IP externa de la antena para salir al patio.
# SI FALTA: Los equipos N4 no tendrían salida a la red troncal o internet.
add action=masquerade chain=srcnat comment=MASQUERADE_SALIDA_VLAN8 \
    out-interface=IF-VRRP-VLAN8-N4

# QUÉ HACE: Enmascaramiento específico para un equipo vía LTE (Backup).
# UTILIDAD: Garantiza salida por el módem celular si falla el Wi-Fi.
# SI FALTA: Fallo en la conmutación al respaldo móvil.
add action=masquerade chain=srcnat comment=MASQUERADE_LTE src-address=\
    192.168.0.103

# QUÉ HACE: Enmascaramiento de salida para la red OT por Wi-Fi.
# UTILIDAD: Salida industrial hacia el patio.
# SI FALTA: Los PLC no podrían enviar datos al SCADA por radio fuera del túnel.
add action=masquerade chain=srcnat comment=MASQUERADE_SALIDA_VLAN9 \
    out-interface=IF-VRRP-VLAN9-OT

# QUÉ HACE: Redirección VNC para la pantalla del terminal N4 (puerto 5901).
# UTILIDAD: Permite ver la pantalla del operario remotamente traduciendo el puerto 5901 al 5900 interno.
# SI FALTA: No se podría monitorizar la pantalla del TOS desde tierra.
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5901 \
    protocol=tcp to-addresses=192.168.0.18 to-ports=5900

# QUÉ HACE: Redirección de telemetría hacia el CRS (192.168.30.100).
# UTILIDAD: Mapeo de identidad para el centro de control.
# SI FALTA: El sistema central no recibiría los datos de este nodo RTG.
add action=dst-nat chain=dstnat comment=CRS dst-address=172.20.1.181 \
    to-addresses=192.168.30.100

# QUÉ HACE: Redirección de datos del sensor de combustible (puerto 6164).
# UTILIDAD: Permite leer el nivel de gasoil desde el servidor de combustible central.
# SI FALTA: Error en la monitorización de consumos de la grúa.
add action=dst-nat chain=dstnat comment=SENSOR_FUEL dst-port=6164 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.35 \
    to-addresses=192.168.10.15 to-ports=6164

# QUÉ HACE: Redirección para gestión MILESTONE de cámara de CARRO (8060 -> 80).
# UTILIDAD: El servidor de video puede grabar y gestionar la cámara que mira a la carga.
# SI FALTA: No se vería la imagen del carro en el sistema de seguridad.
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_CARRO dst-port=8060 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.60 to-ports=80

# QUÉ HACE: Redirección para gestión MILESTONE de cámara PÓRTICO NORTE (8061 -> 80).
# UTILIDAD: Vista perimetral del lado norte de la grúa.
# SI FALTA: Punto ciego en la vigilancia norte de la máquina.
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_PORTICO_NORTE dst-port=\
    8061 in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.61 to-ports=80

# QUÉ HACE: Redirección para gestión MILESTONE de cámara PÓRTICO SUR (8062 -> 80).
# UTILIDAD: Vista perimetral del lado sur.
# SI FALTA: Punto ciego en la vigilancia sur.
add action=dst-nat chain=dstnat comment=MILESTONE_CAM_PORTICO_SUR dst-port=\
    8062 in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.16.1.0/28 \
    to-addresses=192.168.10.62 to-ports=80

# QUÉ HACE: Redirección WEB (HTTP) para cámaras desde la red técnica.
# UTILIDAD: Permite configurar las cámaras directamente desde un navegador web.
# SI FALTA: Habría que subir a la grúa físicamente para configurar las cámaras.
add action=dst-nat chain=dstnat comment=WEB_CAM_CARRO dst-port=8060 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.60 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_CAM_PORTICO_NORTE dst-port=8061 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.61 to-ports=80
add action=dst-nat chain=dstnat comment=WEB_CAM_PORTICO_SUR dst-port=8062 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=192.168.2.0/24 \
    to-addresses=192.168.10.62 to-ports=80

# QUÉ HACE: Redirección web hacia el PLC principal (puerto 8010 -> 80).
# UTILIDAD: Permite ver el servidor web interno del PLC de control de la grúa.
# SI FALTA: Imposible diagnosticar fallos profundos de maquinaria de forma remota.
add action=dst-nat chain=dstnat comment=WEB_PLC dst-port=8010 in-interface=\
    IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.0/27 to-addresses=\
    192.168.10.10 to-ports=80

# QUÉ HACE: Redirección VNC para el sistema CMS (CMS Management System).
# UTILIDAD: Control remoto de la pantalla de gestión de mantenimiento de la grúa.
# SI FALTA: El servicio técnico no puede acceder al software CMS.
add action=dst-nat chain=dstnat comment=VNC_CMS dst-address=172.17.11.81 \
    dst-port=5900 in-interface=IF-VRRP-VLAN9-OT protocol=tcp to-addresses=\
    192.168.10.20 to-ports=5900

# QUÉ HACE: Redirección Protocolo S7 (Siemens) hacia el PLC (puerto 102/502).
# UTILIDAD: Permite la descarga y lectura de programas desde software TIA Portal remoto.
# SI FALTA: No se podrían realizar cambios en la lógica de la grúa sin desplazarse allí.
add action=dst-nat chain=dstnat comment=S7_PROTOCOL dst-port=102,502 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=172.17.4.35 \
    to-addresses=192.168.10.10

# QUÉ HACE: Redirección para la tableta de diagnóstico del PLC.
# UTILIDAD: Conectividad para el personal de mantenimiento móvil en el muelle.
# SI FALTA: La tableta de campo no tendría acceso a los datos del PLC.
add action=dst-nat chain=dstnat comment=TABLET_PLC dst-port=1099 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp src-address=10.34.64.0/23 \
    to-addresses=192.168.10.10

# QUÉ HACE: Redirección hacia el servidor SCADA Ignition.
# UTILIDAD: Envío masivo de variables industriales al sistema de monitorización de planta.
# SI FALTA: El SCADA general mostraría la grúa como desconectada o "muerta".
add action=dst-nat chain=dstnat comment=IGNITION_SCADA dst-port=8088 \
    in-interface=IF-VRRP-VLAN9-OT protocol=tcp to-addresses=192.168.10.20 \
    to-ports=8088

# QUÉ HACE: Redirecciones VNC adicionales para la pantalla N4 (TOS).
# UTILIDAD: Robustez en el acceso remoto a la cabina del operario.
# SI FALTA: Posibles cortes de acceso al soporte remoto N4.
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5900 \
    in-interface=IF-VRRP-VLAN8-N4 protocol=tcp src-address=10.34.49.98 \
    to-addresses=192.168.0.18 to-ports=5900
add action=dst-nat chain=dstnat comment=PANTALLA_N4_VNC dst-port=5900 \
    in-interface=IF-VRRP-VLAN8-N4 protocol=tcp src-address=!10.34.49.0/25 \
    to-addresses=192.168.0.18 to-ports=5900

# QUÉ HACE: Redirecciones críticas de GPS (Puertos 2345, 2346, 2222, 1940).
# UTILIDAD: Permite que el sistema de localización sepa dónde está exactamente la grúa en el patio.
# SI FALTA: La grúa "desaparecería" del mapa del patio; el sistema de gestión no sabría dónde está la carga.
add action=dst-nat chain=dstnat comment=GPS dst-port=2345 protocol=tcp \
    to-addresses=192.168.0.8 to-ports=2345
add action=dst-nat chain=dstnat comment=GPS dst-port=2346 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.8 to-ports=2346
add action=dst-nat chain=dstnat comment=GPS dst-port=2222 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.8 to-ports=22
add action=dst-nat chain=dstnat comment=GPS dst-port=1940 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=udp to-addresses=192.168.0.8 to-ports=1940

# QUÉ HACE: Redirección para el PLC de gestión N4 (puerto 501).
# UTILIDAD: Separación de la lógica de negocio N4 de la lógica industrial pura OT.
# SI FALTA: Fallos en el sistema automático de registro de movimientos.
add action=dst-nat chain=dstnat comment=N4_PLC dst-port=501 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp src-address=!10.34.49.0/25 to-addresses=\
    192.168.0.2 to-ports=501

# QUÉ HACE: Redirecciones adicionales de telemetría de posición (Puertos 41100, 1962).
# UTILIDAD: Otros sistemas esclavos que leen la posición de la grúa.
# SI FALTA: Incoherencias en los mapas de telemetría secundaria.
add action=dst-nat chain=dstnat comment=GPS dst-port=41100 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.2 to-ports=41100
add action=dst-nat chain=dstnat comment=GPS dst-port=1962 in-interface=\
    IF-VRRP-VLAN8-N4 protocol=tcp to-addresses=192.168.0.2 to-ports=1962

################################################################################
##########   SECCIÓN: ESTRATEGIA DE ENRUTAMIENTO (ROUTES)   ####################
################################################################################

/ip route
# QUÉ HACE: Rutas estáticas hacia redes troncales de la terminal.
# UTILIDAD: Indica al router qué camino tomar para llegar a oficinas o gestión central.
#           - Gateway 172.17.11.254: Es el router de radio del patio.
#           - Gateway 10.34.49.99: Es la salida N4/TOS.
# SI FALTA: El router no sabría enviar paquetes a las oficinas, quedando incomunicado fuera de su subred local.
add dst-address=10.34.59.148/32 gateway=172.17.11.254
add disabled=no dst-address=10.34.0.0/16 gateway=10.34.49.99
add disabled=no dst-address=172.16.0.0/15 gateway=172.17.11.254

# QUÉ HACE: RUTA POR DEFECTO (0.0.0.0/0).
# UTILIDAD: Es el "Camino para todo lo demás". Si no sabe dónde enviar algo, lo envía aquí.
# SI FALTA: No habría internet ni conexión con ninguna red que no esté definida arriba.
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=10.34.49.99 \
    routing-table=main scope=30 suppress-hw-offload=no target-scope=10

# QUÉ HACE: Ruta de alta velocidad hacia el centro de control CRS a través del Core.
# UTILIDAD: Prioriza el camino por cable (192.168.10.250) para los datos críticos de telemetría.
# SI FALTA: Los datos de telemetría podrían intentar ir por rutas más lentas, aumentando el retraso (lag).
add disabled=no distance=1 dst-address=192.168.30.100/32 gateway=\
    192.168.10.250 pref-src=192.168.10.251 routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10

# QUÉ HACE: Rutas auxiliares de servicios de red.
add disabled=no dst-address=192.168.2.0/24 gateway=172.17.11.254 \
    routing-table=main suppress-hw-offload=no
add disabled=no dst-address=172.17.4.36/32 gateway=172.20.1.200 \
    routing-table=main suppress-hw-offload=no

# QUÉ HACE: Ruta específica para la tableta de mantenimiento vía red LTE/Radio.
# UTILIDAD: Permite que el operario Francis Gallardo acceda a los sistemas desde su tableta.
# SI FALTA: Fallo de acceso remoto para el equipo técnico en campo.
add comment="CMS LTE Francis Gallardo Tablet" disabled=no distance=1 \
    dst-address=10.34.64.0/23 gateway=172.17.11.254 routing-table=main scope=\
    30 suppress-hw-offload=no target-scope=10

################################################################################
##########   SECCIÓN: SERVICIOS DE SISTEMA Y SEGURIDAD   ######################
################################################################################

/ip service
# QUÉ HACE: Desactiva los servicios de acceso vulnerables (FTP, Telnet, WWW).
# UTILIDAD: Endurecimiento (Hardening) del router. Solo se permite Winbox, SSH y API.
# SI FALTA: Riesgo de intrusión por servicios sin cifrar o ataques de fuerza bruta web.
set ftp disabled=yes
set telnet disabled=yes
set www disabled=yes

/ip ssh
# QUÉ HACE: Obliga al uso de algoritmos de cifrado fuerte para SSH.
set strong-crypto=yes

/ipv6 nd
# QUÉ HACE: Desactiva el descubrimiento de vecinos IPv6.
set [ find default=yes ] disabled=yes

################################################################################
##########   SECCIÓN: PROTOCOLOS DE DETECCIÓN Y MONITOREO   ###################
################################################################################

/routing bfd configuration
# QUÉ HACE: Configura BFD (Bidirectional Forwarding Detection) en todas las interfaces.
# UTILIDAD: Permite detectar micro-cortes de red en milisegundos para que el ruteo cambie instantáneamente.
# SI FALTA: Los cambios de ruta tras un fallo podrían tardar segundos, provocando cortes en las cámaras.
add disabled=no interfaces=all min-rx=200ms min-tx=200ms multiplier=5

/snmp
# QUÉ HACE: Configura el protocolo de monitorización SNMP.
# UTILIDAD: Permite que LibreNMS sepa que este router es un 'RTG081'.
# SI FALTA: Pérdida de visibilidad histórica en las gráficas de red.
set enabled=yes location=RTG081 trap-version=2

# Sincronización horaria (Redundante para asegurar integridad).
/system clock
set time-zone-name=Europe/Madrid
/system identity
set name=RTG081_ANT1

################################################################################
##########   SECCIÓN: CONFIGURACIÓN DE ALERTAS Y LOGS   ########################
################################################################################

/system logging
# QUÉ HACE: Envía diferentes niveles de eventos (info, crítico, error) hacia LibreNMS.
# UTILIDAD: Mantiene al equipo de mantenimiento informado de cada suceso en tiempo real.
# SI FALTA: No nos enteraríamos de reinicios inesperados o bloqueos de firewall.
set 0 action=LibreNMS topics=info,!firewall
set 1 action=LibreNMS
set 2 action=LibreNMS
set 3 action=LibreNMS

# QUÉ HACE: Dirige los eventos de roaming al destino en disco 'roamingLogs'.
add action=roamingLogs topics=debug,script
add topics=critical
add topics=error
add topics=info
add topics=warning

/system note
# QUÉ HACE: Muestra un banner legal al iniciar sesión en el router.
# UTILIDAD: Avisar de que el acceso está monitorizado.
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
# Servidores horarios redundantes.
add address=172.17.1.250
add address=192.168.0.109

/system routerboard settings
# Actualización automática del firmware de la placa.
set auto-upgrade=yes

################################################################################
##########   SECCIÓN: AUTOMATIZACIÓN (PROGRAMADOR DE TAREAS)   ################
################################################################################

/system scheduler
# QUÉ HACE: Lanza el script de 'roaming' cada 10 segundos.
# UTILIDAD: Garantiza que la grúa siempre esté buscando el mejor punto de acceso Wi-Fi.
# SI FALTA: La grúa se quedaría conectada a un AP lejano hasta perder la conexión totalmente.
add interval=10s name=roaming on-event=":local corriendo [/system/script/job/p\
    rint count-only where script=roaming]\r\
    \n:if (corriendo = 0) do={\r\
    \n/system/script/run roaming\r\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup

# QUÉ HACE: Lanza la actualización de umbrales cada 30 segundos.
# UTILIDAD: Permite cambiar la "sensibilidad" del roaming centralizadamente desde el NAS.
# SI FALTA: Habría que configurar los umbrales manualmente en cada antena por separado.
add interval=30s name=updateSignalValues on-event=updateSignalValues policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup

# QUÉ HACE: Programa un reinicio preventivo cada 6 horas.
# UTILIDAD: "Limpieza" del sistema para evitar saturación de memoria en condiciones industriales extremas.
add interval=6h name=dailyReboot on-event="/system reboot" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-10-22 start-time=07:55:00

# QUÉ HACE: Tarea de control para la VLAN 9 cada 10 segundos.
# UTILIDAD: Evita bucles de red si el túnel EoIP falla pero el Wi-Fi sigue vivo.
# SI FALTA: Riesgo de tormentas de broadcast que tumben toda la red del patio.
add interval=10s name=vlan9Control on-event=":local corriendo [/system/script/\
    job/print count-only where script=vlan9Control]\r\
    \n:if (corriendo = 0) do={\r\
    \n/system/script/run vlan9Control\r\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup

# QUÉ HACE: Realiza el backup semanal al NAS cada martes a las 3:45 AM.
# UTILIDAD: Disponibilidad de copias de seguridad frescas sin intervención humana.
add interval=1w name=backupToNAS on-event=backupToNAS policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-03-04 start-time=03:45:00

################################################################################
##########   SECCIÓN: LÓGICA AVANZADA (SYSTEM SCRIPTS)   ########################
################################################################################

/system script
# QUÉ HACE: Script Maestro de Roaming Wi-Fi.
# UTILIDAD: Permite que la grúa se mueva por el puerto saltando de antena en antena sin perder conexión.
# SI FALTA: La grúa se quedaría "pegada" a una antena lejana (señal baja) aunque tenga una al lado, provocando cortes.
add dont-require-permissions=no name=roaming owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \n# --- INICIO DEL SCRIPT DE ROAMING ---\
    \n# Guillermo Carrión Vega - 2025\
    \nwhile (true) do={\
    \n    # Recupera variables globales de umbrales (Qué: carga parámetros de red).\
    \n    :global minimalStrength\
    \n    :global minimalUpgrade\
    \n    :global minimalSTN\
    \n    # Captura el estado actual de la radio (Qué: monitoriza señal actual).\
    \n    :local wlanMonitor [/interface wireless monitor wlan1 once as-value]\
    \n    :local currentStrength (\$wlanMonitor->\"signal-strength\")\
    \n    :local currentAP (\$wlanMonitor->\"radio-name\")\
    \n    :local currentSTN (\$wlanMonitor->\"signal-to-noise\")\
    \n    :local diferencia\
    \n    :delay 1s;\
    \n    # Inicia evaluación si la señal es pobre (Para qué: decide cuándo saltar).\
    \n    while ((\$currentStrength < \$minimalStrength) && (\$currentSTN < \$minimalSTN)) do={\
    \n        :local candidateAPs []\
    \n        :local currentCCQ (((\$wlanMonitor->\"tx-ccq\") + (\$wlanMonitor->\"rx-ccq\"))/2)\
    \n        :local currentChannel (\$wlanMonitor->\"channel\")\
    \n        :local counter 0\
    \n        :local signalTester; :local bestSignal; :local bestAPindex; :local currentScan\
    \n        :log debug \"ROAMING: Señal deficiente. Iniciando escaneo de candidatos.\"\
    \n        # Escanea en segundo plano si está conectado (Qué: busca redes RTG_AP).\
    \n        :if ([/interface get wlan1 value-name=running] = true) do={ :set \$currentScan ([/interface wireless scan wlan1 duration=10s background=yes as-value]) } else={ :set \$currentScan ([/interface wireless scan wlan1 duration=10s background=no as-value]) }\
    \n        :foreach item in=\$currentScan do={\
    \n            # Solo considera el SSID de la flota (SSID RTG_AP).\
    \n            :if (\$item->\"ssid\" = \"RTG_AP\") do={\
    \n                :set (\$candidateAPs->\$counter) {ap=\$item->\"radio-name\"; mac=\$item->\"address\"; signal=\$item->\"sig\"}\
    \n                :set \$counter (\$counter + 1)\
    \n            }\
    \n        }\
    \n        # Si hay candidatos, busca el mejor (Para qué: elige la antena más fuerte).\
    \n        :if ([:len \$candidateAPs] > 0) do={\
    \n            :for i from=0 to=([:len \$candidateAPs] - 1) do={\
    \n                :set \$signalTester ((\$candidateAPs->\$i)->\"signal\")\
    \n                :if ((\$signalTester > \$bestSignal)||(\$i = 0)) do={ :set \$bestSignal \$signalTester; :set \$bestAPindex \$i }\
    \n            }\
    \n            # Compara con el AP actual (Para qué: evita saltos innecesarios).\
    \n            :if (((\$candidateAPs->\$bestAPindex)->\"ap\") != \$currentAP) do={\
    \n                # Calcula mejora en dBm (Si falta: saltaría constantemente, inestabilizando la red).\
    \n                :if (\$currentStrength) do={\
    \n                    :set \$bestSignal (\$bestSignal * -1); :set \$currentStrength (\$currentStrength * -1)\
    \n                    :if (\$bestSignal > \$currentStrength) do={ :set \$diferencia (\$bestSignal - \$currentStrength) } else={ :set \$diferencia (\$currentStrength - \$bestSignal) }\
    \n                    :set \$diferencia (\$diferencia * -1)\
    \n                    :set \$bestSignal (\$bestSignal * -1); :set \$currentStrength (\$currentStrength * -1)\
    \n                } else={ :set \$diferencia -100 }\
    \n                # Ejecuta el salto si la mejora es suficiente.\
    \n                :if (\$diferencia <= \$minimalUpgrade) do={\
    \n                    :log debug \"ROAMING: Ejecutando salto al mejor candidato.\"\
    \n                    /interface wireless connect-list remove [find]\
    \n                    /interface wireless connect-list add mac-address=((\$candidateAPs->\$bestAPindex)->\"mac\") comment=\"mejorAP\" interface=wlan1\
    \n                    /interface wireless connect-list add comment=denegarTodo connect=no interface=wlan1\
    \n                    :delay 10s; :set wlanMonitor [/interface wireless monitor wlan1 once as-value]\
    \n                }\
    \n            }\
    \n        }\
    \n        :delay 1s;\
    \n    }\
    \n}\
    \n"

# QUÉ HACE: Descarga y actualiza los valores de roaming desde un servidor central.
# UTILIDAD: Permite cambiar la configuración de toda la flota de grúas en un solo paso.
# SI FALTA: Habría que configurar cada grúa a mano, riesgo de desajustes.
add dont-require-permissions=no name=updateSignalValues owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    do {\
    \n    # Conexión SFTP para bajar el archivo de potencia mínima (Qué: sincronización central).\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/BKIdeltec/Scripting/ROAMING/minimalSignal.txt\"\
    \n    :global minimalStrength [/file/get minimalSignal.txt contents]\
    \n} on-error={ :global minimalStrength -59 }\
    \n:do {\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/BKIdeltec/Scripting/ROAMING/minimalUpgrade.txt\"\
    \n    :global minimalUpgrade [/file/get minimalUpgrade.txt contents]\
    \n} on-error={ :global minimalUpgrade -4 }\
    \n:do {\
    \n    /tool fetch mode=sftp url=\"sftp://BackupCMS:B4ckup.372@172.16.1.6/BKIdeltec/Scripting/ROAMING/minimalSTN.txt\"\
    \n    :global minimalSTN [/file/get minimalSTN.txt contents]\
    \n} on-error={ :global minimalSTN 45 }\
    \n"

# QUÉ HACE: Control dinámico de VRRP para evitar bucles.
# UTILIDAD: Si falla el túnel EoIP, deshabilita la VLAN 9 para evitar que el tráfico "de la vuelta" y tumbe el patio.
# SI FALTA: Riesgo de colapso de red en toda la terminal por bucles de Capa 2.
add dont-require-permissions=no name=vlan9Control owner=ideltec policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    while (true) do={\r\
    \n    :delay 5\r\
    \n    # Vigila si el túnel está activo (Qué: monitoriza salud del EoIP).\r\
    \n    :local eoipControl [/interface/eoip/get IF-EOIP-CRS value-name=running]\r\
    \n    :local mirrorControl [/tool/netwatch/get mirror value-name=status]\r\
    \n    :local vlanStatus [/interface/vrrp/get IF-VRRP-VLAN9-OT value-name=disabled]\r\
    \n    # Lógica de seguridad: si no hay túnel, desactiva la interfaz de radio OT.\r\
    \n    :if ((\$eoipControl = false) && (\$mirrorControl = \"up\")) do={\r\
    \n        :if (\$vlanStatus = false) do={ /interface/vrrp/set IF-VRRP-VLAN9-OT disabled=yes }\r\
    \n    }\r\
    \n    # Restablece al detectar recuperación.\r\
    \n    :if ((\$mirrorControl = \"down\") || (\$eoipControl = true)) do={\r\
    \n        :if (\$vlanStatus = true) do={ /interface/vrrp/set IF-VRRP-VLAN9-OT disabled=no }\r\
    \n    }\r\
    \n}"

# QUÉ HACE: Exporta la configuración y realiza backup al servidor de seguridad (NAS).
# UTILIDAD: Garantiza que siempre hay una copia de seguridad "fuera del dispositivo".
# SI FALTA: Si el router se quema o falla el disco, la grúa estaría horas parada mientras se reconfigura de cero.
add dont-require-permissions=no name=backupToNAS owner=ideltec policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    # Genera nombres de archivo con fecha y nombre de grúa (Qué: auditoría).\r\
    \n:local ruta \"BKIdeltec/OT/RTG/RTG081/ANT1/\"\r\
    \n:local exportacion ([/system/clock/get date ] . \" \" . [/system/identity/get name])\r\
    \n:local exportacionConRSC (\$exportacion . \".rsc\")\r\
    \n:local exportacionConBackup (\$exportacion . \".backup\")\r\
    \n# Realiza exportación de texto y binario.\r\
    \nexport file=\$exportacion show-sensitive\r\
    \nsystem backup save name=\$exportacion\r\
    \n:delay 5\r\
    \n# Sube los archivos al NAS vía SFTP seguro.\r\
    \n/tool fetch mode=sftp address=172.16.1.6 duration=1m user=BackupCMS password=B4ckup.372 src-path=\$exportacionConRSC dst-path=(\$ruta . \$exportacionConRSC) upload=yes\r\
    \n:delay 5\r\
    \n/tool fetch mode=sftp address=172.16.1.6 duration=1m user=BackupCMS password=B4ckup.372 src-path=\$exportacionConBackup dst-path=(\$ruta . \$exportacionConBackup) upload=yes\r\
    \n:delay 5\r\
    \n# Limpieza: borra los archivos locales para no saturar la memoria flash del router.\r\
    \n/file remove [find name~\".rsc\"]; /file remove [find name~\".backup\"]"

################################################################################
##########   SECCIÓN: HERRAMIENTAS FINALES Y MONITOREO   #######################
################################################################################

/tool bandwidth-server
# QUÉ HACE: Desactiva el servidor de pruebas de ancho de banda.
# UTILIDAD: Evita que alguien externo use el router para estresar la red.
set enabled=no

/tool mac-server ping
# QUÉ HACE: Desactiva las respuestas a pings de MAC (Capa 2).
# UTILIDAD: Segurança. Los pings solo deben ser por IP (Capa 3).
set enabled=no

/tool netwatch
# QUÉ HACE: Monitoriza cada 5s si el Core (CRS) responde (Ping a la 172.20.0.181).
# UTILIDAD: Es el "corazón" que informa a los scripts si la red troncal está viva.
# SI FALTA: Los scripts de control fallarían al no saber el estado real de la red.
add disabled=no down-script="" host=172.20.0.181 http-codes="" \
    ignore-initial-down=yes ignore-initial-up=yes interval=5s name=mirror \
    src-address=172.20.0.81 test-script="" type=simple up-script=""

/tool romon
# QUÉ HACE: Activa el protocolo MikroTik Romon.
# UTILIDAD: Permite gestionar routers MikroTik a través de otros sin necesidad de IP (Capa 2).
set enabled=yes


################################################################################
##########   MEJORAS Y OPTIMIZACIONES SUGERIDAS ##########
################################################################################
# 
# 1. SEGURIDAD: Se recomienda cambiar el puerto SSH (22) por uno no estandard para reducir intentos de acceso.
# 2. REDUNDANCIA: La configuración de LTE está como backup, pero se podría implementar un balanceo de carga recursivo.
# 3. SCRIPTS: El script de roaming podría optimizarse usando filtros de 'signal-strength' directamente en el comando scan para reducir el uso de CPU.
# 4. NTP: Añadir un tercer servidor horario público (ej: pool.ntp.org) por si la red interna falla.
# 5. FIREWALL: Centralizar las IPs de administración en una Address List para mayor limpieza de reglas.
#
################################################################################
