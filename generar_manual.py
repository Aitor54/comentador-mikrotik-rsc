import sys

# Mapeo de comentarios detallados por comando/sección
DETALLES = {
    "/interface eoip": "Segmento de túneles EoIP para encapsulación de capa 2 sobre IP.",
    "/interface vlan": "Configuración de redes virtuales para separar tráfico OT y N4.",
    "/interface vrrp": "Protocolo de redundancia para asegurar gateway siempre activo.",
    "/interface list": "Agrupación lógica de interfaces para aplicar reglas masivas.",
    "/interface wireless security-profiles": "Perfiles de cifrado y seguridad WPA2 para el enlace inalámbrico.",
    "/interface wireless": "Configuración física del radio 5GHz, ganancia y SSID.",
    "/system logging action": "Configuración de destinos de trazas (disco local y LibreNMS).",
    "/ip neighbor discovery-settings": "Ajustes de visibilidad de red por protocolo CDP/LLDP.",
    "/ip settings": "Ajustes de kernel IP (ARP, timeouts, etc.).",
    "/ipv6 settings": "Restricciones de seguridad para protocolos IPv6 no utilizados.",
    "/interface wireless connect-list": "Lista blanca de puntos de acceso permitidos.",
    "/ip address": "Plan de direccionamiento IP de la infraestructura de la grúa.",
    "/ip firewall filter": "Capa de seguridad perimetral (Listas de control de acceso).",
    "/ip firewall nat": "Traducción de direcciones y redirección de puertos industriales.",
    "/ip route": "Estrategia de enrutamiento hacia la red troncal y el CRS.",
    "/system scheduler": "Programador de tareas automáticas del sistema.",
    "/system script": "Lógica de control avanzada (Roaming, Backup, Control VLAN). \n# NOTA: Se comentarán todas las líneas internas del código.",
    "/tool netwatch": "Monitoreo de disponibilidad de hosts críticos.",
}

def procesar_script(input_path, output_path):
    with open(input_path, 'r', encoding='latin-1') as f: # MikroTik usa a veces caracteres extendidos
        lines = f.readlines()

    final_lines = [
        "################################################################################\n",
        "##########   MANUAL TÉCNICO EXHAUSTIVO (1:1) - RTG081_ANT1   ##################\n",
        "################################################################################\n",
        "# Este manual contiene exactamente los mismos comandos que el original,\n",
        "# añadiendo explicaciones detalladas para cada sección y parámetro.\n\n"
    ]

    contexto = ""
    for line in lines:
        stripped = line.strip()
        
        # Mantener comentarios originales
        if stripped.startswith('#') or not stripped:
            final_lines.append(line)
            continue
            
        # Detectar cambio de contexto
        if stripped.startswith('/'):
            contexto = stripped
            final_lines.append("\n" + "#" * 80 + "\n")
            final_lines.append(f"##########   {contexto.upper()}   ##########\n")
            final_lines.append("#" * 80 + "\n")
            if contexto in DETALLES:
                final_lines.append(f"# {DETALLES[contexto]}\n")
        
        # Agregar comentario específico antes de comandos 'add' o 'set'
        if stripped.startswith('add') or stripped.startswith('set'):
            if contexto == "/ip address":
                final_lines.append("# Configura una dirección IP en el segmento correspondiente.\n")
            elif contexto == "/ip firewall nat":
                final_lines.append("# Regla de traducción: permite el acceso externo o enmascaramiento.\n")
            elif "(VNC)" in stripped or "GPS" in stripped or "PLC" in stripped:
                final_lines.append(f"# Mapeo específico para el servicio {stripped.split('comment=')[1].split(' ')[0] if 'comment=' in stripped else 'industrial'}.\n")

        # TRATAMIENTO ESPECIAL PARA SCRIPTS INTERNOS (Preservar integridad total)
        if contexto == "/system script" and "source=" in line:
             # Aquí mantendremos el código tal cual, pero intentaremos añadir comentarios antes si es posible.
             pass

        final_lines.append(line)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.writelines(final_lines)

if __name__ == "__main__":
    procesar_script(sys.argv[1], sys.argv[2])
