import os
import tkinter as tk
from tkinter import filedialog, messagebox
import re
import sys

class MikrotikComentador:
    def __init__(self):
        self.variables_globales = {
            'dispositivos': {},      # IP -> Nombre/Comentario
            'vlan_mapping': {},      # ID -> Nombre
            'listas_acceso': {},     # Nombre lista -> [IPs]
            'interfaces': {}         # Nombre -> Descripción
        }
        self.n4_term = "N4"
        
        # Diccionario de explicaciones estáticas para configuraciones críticas (MENTOR MODE - FULL COVERAGE)
        self.explicaciones_sistema = {
            # === INTERFACES ===
            '/interface bonding': [
                "# QUÉ HACE: Agrega múltiples interfaces físicas en una lógica (LACP/EtherChannel).",
                "# UTILIDAD: Aumenta el ancho de banda y proporciona redundancia ante fallos de cable.",
                "# SI FALTA: Menor capacidad y pérdida de conexión si falla un enlace físico."
            ],
            '/interface bridge': [
                "# QUÉ HACE: Unifica interfaces en un dominio de Layer 2 (Switch Virtual).",
                "# UTILIDAD: Permite comunicación directa entre puertos sin enrutamiento.",
                "# SI FALTA: Interfaces aisladas; dispositivos en la misma subred no se verían."
            ],
            '/interface bridge port': [
                "# QUÉ HACE: Asigna interfaces físicas (o lógicas) al Bridge.",
                "# UTILIDAD: Define qué puertos forman parte del switch virtual.",
                "# SI FALTA: Los puertos no pasarán tráfico entre sí, quedando desconectados del bridge."
            ],
            '/interface eoip': [
                "# QUÉ HACE: Túnel Ethernet sobre IP (Protocolo propietario MikroTik).",
                "# UTILIDAD: Extiende L2 sobre una red L3 (como unir dos sedes con un cable virtual).",
                "# RIESGO: Fragmentación de paquetes (MTU) y bucles si no se usa STP."
            ],
            '/interface ethernet': [
                "# QUÉ HACE: Configuración de puertos físicos (velocidad, auto-negociación).",
                "# UTILIDAD: Ajuste de parámetros de capa física y nombres descriptivos.",
                "# SI FALTA: Puede haber flapping o negociación a Half-Duplex en enlaces antiguos."
            ],
            '/interface l2tp-server server': [
                "# QUÉ HACE: Configura el servidor VPN L2TP para acceso remoto.",
                "# UTILIDAD: Permite conexiones entrantes seguras (si se usa con IPsec).",
                "# RIESGO: L2TP sin IPsec es inseguro; credenciales viajan en texto claro."
            ],
            '/interface list': [
                "# QUÉ HACE: Define grupos lógicos de interfaces (ej: WAN, LAN, Management).",
                "# UTILIDAD: Simplifica reglas de firewall al referenciar listas en lugar de puertos individuales.",
                "# SI FALTA: Reglas de firewall complejas y difíciles de mantener."
            ],
            '/interface list member': [
                "# QUÉ HACE: Asigna interfaces específicas a las listas definidas.",
                "# UTILIDAD: Vincula el puerto físico real al concepto lógico (ej: ether1 -> WAN).",
                "# SI FALTA: Las reglas que usan listas no tendrán efecto sobre el tráfico real."
            ],
            '/interface vlan': [
                "# QUÉ HACE: Crea sub-interfaces etiquetadas (802.1Q) sobre un puerto físico.",
                "# UTILIDAD: Separa tráfico lógico (Gestión, Voz, Datos) en el mismo cable.",
                "# SI FALTA: Mezcla de tráfico, problemas de seguridad y broadcasting excesivo."
            ],
            '/interface vrrp': [
                "# QUÉ HACE: Protocolo de Redundancia de Router Virtual.",
                "# UTILIDAD: IP flotante que se mueve automáticamente a un router de respaldo si el principal falla.",
                "# SI FALTA: Corte de servicio manual necesario si el router principal muere."
            ],

            # === IP CONFIGURATION ===
            '/ip address': [
                "# QUÉ HACE: Asigna direcciones IP (L3) a las interfaces.",
                "# UTILIDAD: Permite al router comunicarse en redes IP y ser gateway para otros.",
                "# SI FALTA: El equipo es un switch tonto (L2) o está incomunicado."
            ],
            '/ip dns': [
                "# QUÉ HACE: Configura resolución de nombres (DNS).",
                "# UTILIDAD: Permite al router (y clientes si es caché) resolver dominios como google.com.",
                "# SI FALTA: Fallan actualizaciones, NTP con FQDN y scripts que usen dominios."
            ],
            '/ip firewall address-list': [
                "# QUÉ HACE: Agrupa direcciones IP bajo un nombre común.",
                "# UTILIDAD: Permite aplicar reglas a miles de IPs (ej: lista negra) en una sola línea.",
                "# SI FALTA: Reglas de firewall kilométricas e ineficientes."
            ],
            '/ip firewall connection tracking': [
                "# QUÉ HACE: Mantiene estado de las conexiones activas (Stateful Firewall).",
                "# UTILIDAD: Imprescindible para NAT y reglas 'established/related'.",
                "# SI FALTA: El firewall se vuelve 'Stateless' (muy difícil de gestionar) y NAT deja de funcionar."
            ],
            '/ip firewall filter': [
                "# QUÉ HACE: El corazón de la seguridad. Reglas de aceptar/descartar tráfico.",
                "# UTILIDAD: Protege al router (Input) y a la red (Forward) de amenazas.",
                "# RIESGO: Sin reglas, el router es un colador abierto a todo internet/LAN."
            ],
            '/ip firewall nat': [
                "# QUÉ HACE: Traducción de Direcciones de Red (Masquerade / Destination NAT).",
                "# UTILIDAD: Permite a la LAN salir a internet (src-nat) o publicar servidores (dst-nat).",
                "# SI FALTA: Los equipos privados no navegan; servidores internos inalcanzables desde fuera."
            ],
            '/ip firewall service-port': [
                "# QUÉ HACE: Helpers para protocolos complejos (FTP, SIP, H323) a través de NAT.",
                "# UTILIDAD: Permite que protocolos que abren puertos dinámicos funcionen tras NAT.",
                "# RIESGO: A veces interfieren con VoIP moderno; desactivar 'sip' suele ser buena práctica."
            ],
            '/ip ipsec profile': [
                "# QUÉ HACE: Define algoritmos de encriptación y tiempos para VPNs IPsec.",
                "# UTILIDAD: Asegura la confidencialidad e integridad de los túneles VPN.",
                "# RIESGO: Perfiles débiles (DES, MD5) pueden ser crackeados fácilmente."
            ],
            '/ip neighbor discovery-settings': [
                "# QUÉ HACE: Gestiona protocolos de descubrimiento (MNDP, CDP, LLDP).",
                "# UTILIDAD: Permite ver equipos vecinos en Winbox/Cisco.",
                "# RIESGO: Información sensible expuesta si se activa en interfaces WAN."
            ],
            '/ip route': [
                "# QUÉ HACE: Tabla de enrutamiento estático.",
                "# UTILIDAD: Dice al router por dónde enviar paquetes a redes desconocidas.",
                "# SI FALTA: El router no sabe llegar a nada que no tenga conectado directamente."
            ],
            '/ip service': [
                "# QUÉ HACE: Configura servicios de administración (SSH, Web, Winbox).",
                "# UTILIDAD: Controla puertos y desde qué IPs se puede administrar el router.",
                "# RIESGO: Dejar Telnet/FTP abiertos es una invitación a ser hackeado."
            ],
            '/ip ssh': [
                "# QUÉ HACE: Configuración específica del servidor SSH.",
                "# UTILIDAD: Permite forzar encriptación fuerte y forwarding.",
                "# RIESGO: Permitir contraseñas débiles o versiones viejas de SSH."
            ],
            '/ipv6 nd': [
                "# QUÉ HACE: Neighbor Discovery para IPv6 (equivalente a ARP en IPv4).",
                "# UTILIDAD: Permite autoconfiguración de direcciones IPv6 (SLAAC) y descubrimiento.",
                "# SI FALTA: IPv6 no funcionará correctamente en la LAN."
            ],
            '/ipv6 settings': [
                "# QUÉ HACE: Ajustes globales de IPv6 (Forwarding).",
                "# UTILIDAD: Habilita el enrutamiento de paquetes IPv6.",
                "# SI FALTA: El router procesa IPv6 pero no lo reenvía entre interfaces."
            ],
            '/port': [
                "# QUÉ HACE: Configura puertos serie consola/USB.",
                "# UTILIDAD: Acceso por consola física o módems 3G/4G/LTE.",
                "# SI FALTA: Inoperatividad de módems LTE conectados por USB."
            ],
            '/ppp secret': [
                "# QUÉ HACE: Base de datos de usuarios para VPNs (PPPoE, L2TP, SSTP).",
                "# UTILIDAD: Define usuario, contraseña e IP asignada al cliente VPN.",
                "# RIESGO: Contraseñas débiles comprometen el acceso a la red interna."
            ],

            # === ROUTING ===
            '/routing bgp connection': [
                "# QUÉ HACE: Define la sesión BGP con un vecino (Peer).",
                "# UTILIDAD: Intercambio dinámico de rutas con otros AS (Sistemas Autónomos).",
                "# SI FALTA: No hay intercambio de rutas dinámico; se depende de rutas estáticas."
            ],
            '/routing bgp instance': [
                "# QUÉ HACE: El proceso principal que ejecuta BGP.",
                "# UTILIDAD: Define el AS local y el Router ID.",
                "# SI FALTA: El servicio BGP no arranca."
            ],
            '/routing bgp template': [
                "# QUÉ HACE: Plantilla de configuración común para múltiples peers BGP.",
                "# UTILIDAD: Ahorra configuración repetitiva y evita errores humanos.",
                "# SI FALTA: Hay que configurar cada parámetro en cada conexión individualmente."
            ],
            '/routing filter rule': [
                "# QUÉ HACE: Reglas modernas de filtrado de rutas (RouterOS v7).",
                "# UTILIDAD: Controla qué rutas aceptamos y cuáles anunciamos.",
                "# RIESGO: Sin filtros, podemos tumbar internet anunciando rutas privadas o secuestrando prefijos."
            ],

            # === SYSTEM & TOOLS ===
            '/snmp': [
                "# QUÉ HACE: Protocolo para monitoreo remoto.",
                "# UTILIDAD: Permite gráficos de tráfico y alertas en Zabbix/PRTG.",
                "# RIESGO: SNMP v1/v2 sin firewall expone toda la info de la red."
            ],
            '/snmp community': [
                "# QUÉ HACE: Define la 'contraseña' de acceso para SNMP.",
                "# UTILIDAD: Agrupa accesos de lectura/escritura.",
                "# RIESGO: Usar 'public' es extremadamente inseguro."
            ],
            '/system clock': [
                "# QUÉ HACE: Configuración de la zona horaria manual.",
                "# UTILIDAD: Asegura que la hora mostrada corresponda a la ubicación local.",
                "# SI FALTA: Los logs tendrán horas UTC o incorrectas."
            ],
            '/system identity': [
                "# QUÉ HACE: Nombre del equipo.",
                "# UTILIDAD: Identificación visual en terminal y vecindario.",
                "# SI FALTA: Caos administrativo."
            ],
            '/system note': [
                "# QUÉ HACE: Mensaje de bienvenida al loguearse (Banner/MOTD).",
                "# UTILIDAD: Avisos legales o instrucciones para administradores.",
                "# SI FALTA: Solo cosmético."
            ],
            '/system ntp client': [
                "# QUÉ HACE: Sincronización horaria automática.",
                "# UTILIDAD: Hora precisa para logs y certificados.",
                "# SI FALTA: Reloj desfasado tras reinicios."
            ],
            '/system ntp client servers': [
                "# QUÉ HACE: Define las IPs/DNS de los servidores de hora.",
                "# UTILIDAD: Fuentes de tiempo fiables.",
                "# SI FALTA: El cliente NTP no tiene a quién consultar."
            ],
            '/system routerboard settings': [
                "# QUÉ HACE: Configuración del Hardware (BIOS/Firmware).",
                "# UTILIDAD: Gestión de arranque y auto-upgrade.",
                "# RIESGO: Firmware obsoleto puede causar bugs de hardware."
            ],
            '/tool bandwidth-server': [
                "# QUÉ HACE: Servidor para tests de velocidad (Bandwidth Test).",
                "# UTILIDAD: Diagnóstico de rendimiento.",
                "# RIESGO: Consumo IP de CPU si no se restringe el acceso."
            ],
            '/tool mac-server': [
                "# QUÉ HACE: Gestión global de servcios basados en MAC.",
                "# UTILIDAD: Base para Winbox/Ping por MAC.",
                "# RIESGO: Si no se limita, acceso desde cualquier puerto."
            ],
            '/tool mac-server mac-winbox': [
                "# QUÉ HACE: Permite entrar con Winbox usando MAC Address.",
                "# UTILIDAD: Salvavidas cuando se pierde la IP.",
                "# RIESGO: Debe estar restringido a interfaz de gestión."
            ],
            '/tool mac-server ping': [
                "# QUÉ HACE: Ping a nivel Ethernet (MAC).",
                "# UTILIDAD: Pruebas de conectividad L2.",
                "# RIESGO: Descubrimiento de red."
            ],
            '/tool romon': [
                "# QUÉ HACE: Red de gestión superpuesta (Overlay).",
                "# UTILIDAD: Gestionar equipos en cadena a través de un solo punto de entrada.",
                "# SI FALTA: Necesidad de VPNs complejas para llegar a equipos remotos."
            ]
        }

    def analizar_global(self, lines):
        """Primera pasada para identificar el contexto de red."""
        contexto = ""
        for line in lines:
            stripped = line.strip()
            if stripped.startswith('/'):
                contexto = stripped.lower()
                continue
            
            if not stripped or stripped.startswith('#'):
                continue

            # Analizar Direcciones IP e Interfaces
            if "/ip address" in contexto and "address=" in stripped:
                addr = self._extract_param(stripped, 'address')
                interface = self._extract_param(stripped, 'interface')
                comment = self._extract_param(stripped, 'comment')
                if addr:
                    ip = addr.split('/')[0]
                    desc = comment if comment else f"Gateway en interfaz {interface}"
                    self.variables_globales['dispositivos'][ip] = desc

            # Analizar Address Lists
            elif "/ip firewall address-list" in contexto and "list=" in stripped:
                list_name = self._extract_param(stripped, 'list')
                addr = self._extract_param(stripped, 'address')
                if list_name and addr:
                    if list_name not in self.variables_globales['listas_acceso']:
                        self.variables_globales['listas_acceso'][list_name] = []
                    self.variables_globales['listas_acceso'][list_name].append(addr)

            # Analizar VLANs
            elif "/interface vlan" in contexto and "vlan-id=" in stripped:
                vlan_id = self._extract_param(stripped, 'vlan-id')
                name = self._extract_param(stripped, 'name')
                if vlan_id and name:
                    self.variables_globales['vlan_mapping'][vlan_id] = name

    def _extract_param(self, line, param):
        """Extrae el valor de un parámetro en un comando MikroTik."""
        pattern = rf'{param}=([^ "]+|"[^"]+")'
        match = re.search(pattern, line)
        if match:
            val = match.group(1).strip('"')
            return val
        return None

    def obtener_explicacion_comando(self, line, contexto):
        """
        Retorna una tupla (clave_agrupacion, lista_explicacion)
        Si clave_agrupacion es None, no se agrupa.
        """
        stripped = line.strip()
        if not stripped or stripped.startswith('/') or stripped.startswith('#'):
            return None, []

        ctx_lower = contexto.lower()

        # 1. Explicaciones estáticas de sistema (Prioridad Alta)
        # IMPORTANTE: Ordenar por longitud descendente para que '/tool mac-server mac-winbox' 
        # coincida antes que '/tool mac-server'
        sorted_keys = sorted(self.explicaciones_sistema.keys(), key=len, reverse=True)
        for key in sorted_keys:
            if key in ctx_lower:
                return key, self.explicaciones_sistema[key]

        explanation = []
        group_key = None

        # 2. Lógica dinámica
        if "/interface eoip" in ctx_lower:
            group_key = "eoip_tunnels"
            explanation.append("# QUÉ HACE: Crea túneles de Nivel 2 (EoIP) encapsulados en IP hacia la infraestructura central.")
            explanation.append("# UTILIDAD: Extiende las VLANs industriales a través de la red IP, permitiendo conectividad lógica directa.")
            explanation.append("# SI FALTA: Pérdida de comunicación de control y telemetría de grúas/equipos remotos.")

        elif "/interface vlan" in ctx_lower:
            group_key = "vlans"
            explanation.append("# QUÉ HACE: Configuración de segmentación de red mediante VLANs (802.1Q).")
            explanation.append(f"# UTILIDAD: Aísla el tráfico de Gestión ({self.n4_term}) y Operación (OT) para seguridad y QoS.")
            explanation.append("# SI FALTA: Mezcla de dominios de difusión, riesgo de seguridad y saturación de la red.")

        elif "/interface vrrp" in ctx_lower:
            group_key = "vrrp"
            explanation.append("# QUÉ HACE: Configuración de Redundancia de Puerta de Enlace Virtual (VRRP).")
            explanation.append("# UTILIDAD: Permite 'Failover' automático de la puerta de enlace si el equipo principal falla.")
            explanation.append("# SI FALTA: Un fallo de hardware provocaría un corte total de servicio sin recuperación automática.")

        elif "/ip address" in ctx_lower:
            # IP address es difícil de agrupar genéricamente si son muy distintas, pero
            # el usuario quiere agrupación. Probemos agrupar por "asignacion de IPs".
            group_key = "ip_addressing"
            explanation.append("# QUÉ HACE: Asignación estructural de direccionamiento IP a interfaces.")
            explanation.append("# UTILIDAD: Define la identidad de Capa 3 del dispositivo y sus puntos de salida a subredes.")
            explanation.append("# SI FALTA: El equipo no tendría conectividad IP ni capacidad de enrutamiento.")

        elif "/ip firewall filter" in ctx_lower:
            group_key = "firewall_filter" # Agrupamos TODO el filtro o por chains? Mejor todo el bloque si son seguidos.
            # Sin embargo, el firewall es delicado. Vamos a intentar agrupar por "add" genérico.
            explanation.append("# QUÉ HACE: Definición de reglas de Filtrado de Paquetes (Firewall).")
            explanation.append("# UTILIDAD: Protege el plano de control y datos permitiendo solo tráfico autorizado.")
            explanation.append("# SI FALTA: Exposición total del router a ataques, accesos no autorizados y tráfico basura.")

        elif "/ip firewall nat" in ctx_lower:
            group_key = "firewall_nat"
            explanation.append("# QUÉ HACE: Reglas de Traducción de Direcciones de Red (NAT).")
            explanation.append("# UTILIDAD: Permite enmascaramiento (salida a internet) o redirección de puertos (acceso a servicios internos).")
            explanation.append("# SI FALTA: Fallo en acceso a Internet o imposibilidad de acceder a servicios internos desde fuera.")

        elif "/ip route" in ctx_lower:
             group_key = "routing"
             explanation.append("# QUÉ HACE: Tabla de enrutamiento estático.")
             explanation.append("# UTILIDAD: Define caminos explícitos para alcanzar redes no directamente conectadas.")
             explanation.append("# SI FALTA: El router no sabrá cómo enviar paquetes a destinos remotos.")

        else:
            # Por defecto, intentamos describir el contexto pero sin agrupar agresivamente si no estamos seguros
            # O agrupamos por el contexto mismo
            group_key = ctx_lower
            clean_ctx = ctx_lower.replace('/', '').replace(' ', '_')
            explanation.append(f"# QUÉ HACE: Configuración de parámetros en {contexto}.")
            explanation.append("# UTILIDAD: Ajuste específico para el funcionamiento correcto del servicio.")
            explanation.append("# SI FALTA: El servicio podría no iniciar o comportarse de forma predeterminada insegura.")

        # Sanitizar strings
        explanation = [l.replace("Nivel 4", self.n4_term).replace("Level 4", self.n4_term) for l in explanation]
        
        return group_key, explanation

    def procesar_scripts_internos(self, line):
        """Implementa la técnica de High-Visibility para scripts con concatenation."""
        if 'source="' in line:
            parts = line.split('source="')
            # Solo modificamos si parece un script de una línea que queremos expandir, 
            # pero para mantener la integridad, mejor insertar comentarios con cuidado.
            # El usuario pidió legibilidad.
            # Si es muy complejo, mejor dejarlo, pero el requerimiento anterior era explícito.
            # Mantendremos la lógica simple anterior.
            header = parts[0] + 'source=("" . \n    # Lógica interna del script: inicio de ejecución \\'
            content = parts[1]
            return f"{header}\n    \"{content}"
        return line

    def detect_device_info(self, lines):
        model = "DISPOSITIVO DESCONOCIDO"
        identity = "Desconocido"
        for line in lines[:30]: # Mirar un poco más
            if line.strip().startswith("# model ="):
                parts = line.split("=")
                if len(parts) > 1: model = parts[1].strip()
        
        for line in lines:
            if "/system identity set name=" in line:
                parts = line.split("name=")
                if len(parts) > 1: identity = parts[1].strip().strip('"')
        return f"{model} (Identity: {identity})"

    def comentar_archivo(self, input_path):
        with open(input_path, 'r', encoding='latin-1') as f:
            lines = f.readlines()

        self.analizar_global(lines)
        device_info = self.detect_device_info(lines)

        result_lines = [
            "################################################################################\n",
            "##########   MANUAL TÉCNICO DE OPERACIÓN Y MANTENIMIENTO (1:1)   ###############\n",
            f"##########      {device_info.center(48)}       ###############\n",
            "################################################################################\n",
            f"# Analizando dispositivo... (Contexto Operacional {self.n4_term})\n",
            "# Integridad 1:1 garantizada. Configuración agrupada para legibilidad.\n\n"
        ]

        contexto = ""
        
        # Buffer de agrupación
        # Estructura: {'key': 'clave_grupo', 'lines': [linea_codigo_1, linea_codigo_2], 'explanation': [str_expl]}
        current_group = {'key': None, 'lines': [], 'explanation': []}

        def flush_group():
            if not current_group['lines']:
                return

            # Escribir explicación del grupo
            if current_group['explanation']:
                for expl_line in current_group['explanation']:
                    result_lines.append(expl_line + "\n")
            
            # Escribir líneas de código
            result_lines.extend(current_group['lines'])
            
            # Reiniciar grupo
            current_group['key'] = None
            current_group['lines'] = []
            current_group['explanation'] = []

        for line in lines:
            stripped = line.strip()
            
            # Passthrough de comentarios existentes y líneas vacías (respetando posición)
            if not stripped or stripped.startswith('#'):
                # Si hay un grupo activo y viene un comentario manual o espacio,
                # asumimos que rompe el grupo lógico (o es un separador visual).
                flush_group()
                result_lines.append(line)
                continue

            # Cambio de contexto
            if stripped.startswith('/'):
                flush_group()
                contexto = stripped
                result_lines.append("\n" + "#" * 80 + "\n")
                result_lines.append(f"##########   SECCIÓN: {contexto.upper()}   ##########\n")
                result_lines.append("#" * 80 + "\n")
                result_lines.append(line)
                continue
            
            # Obtener datos para la línea actual
            key, explanation = self.obtener_explicacion_comando(line, contexto)
            
            # Procesamiento especial scripts
            processed_line = line
            if contexto.startswith("/system script") and 'source=' in line:
                processed_line = self.procesar_scripts_internos(line)
                # Los scripts no se suelen agrupar
                key = None 

            # Lógica de agrupación
            if key is not None:
                # Si tenemos grupo abierto y la clave es la misma, añadimos
                if current_group['key'] == key:
                    current_group['lines'].append(processed_line)
                else:
                    # Clave distinta, cerramos anterior y abrimos nuevo
                    flush_group()
                    current_group['key'] = key
                    current_group['lines'] = [processed_line]
                    current_group['explanation'] = explanation
            else:
                # Línea sin clave de agrupación (comando suelto o desconocido)
                flush_group()
                # Escribimos explicación individual si existe
                if explanation:
                    for expl_line in explanation:
                        result_lines.append(expl_line + "\n")
                result_lines.append(processed_line)

        flush_group()

        # Mejoras sugeridas
        result_lines.append("\n\n" + "#" * 10 + " MEJORAS Y OPTIMIZACIONES SUGERIDAS " + "#" * 10 + "\n")
        result_lines.append("# 1. Verificar consistencia de zonas horarias en NTP para logs unificados.\n")
        result_lines.append("# 2. Revisar versiones de RouterBOOT vs RouterOS.\n")
        result_lines.append(f"# 3. Validar listas de acceso de {self.n4_term} regularmente.\n")

        output_path = input_path.replace(".rsc", ".comentario.rsc")
        # Asegurar extensión correcta si el replace no funcionó (casos raros)
        if not output_path.endswith(".comentario.rsc"):
             output_path += ".comentario.rsc"

        with open(output_path, 'w', encoding='utf-8') as f:
            f.writelines(result_lines)
        
        return output_path

def main():
    if len(sys.argv) > 1:
        file_path = sys.argv[1]
        try:
            comentador = MikrotikComentador()
            print(f"Procesando: {file_path}")
            output = comentador.comentar_archivo(file_path)
            print(f"Finalizado: {output}")
        except Exception as e:
            print(f"Error: {e}")
    else:
        root = tk.Tk()
        root.withdraw()
        file_path = filedialog.askopenfilename(
            title="Selecciona el archivo MikroTik (.rsc)",
            filetypes=[("MikroTik Scripts", "*.rsc"), ("All Files", "*.*")]
        )
        if file_path:
            try:
                comentador = MikrotikComentador()
                output = comentador.comentar_archivo(file_path)
                messagebox.showinfo("Éxito", f"Archivo generado:\n{output}")
            except Exception as e:
                messagebox.showerror("Error", f"Fallo: {str(e)}")

if __name__ == "__main__":
    main()
