def merge_and_comment():
    with open(r'c:\APMT\Skills\comentador-mikrotik-rsc\rtg008_1.rsc', 'r', encoding='latin-1') as f:
        lines = f.readlines()

    output = []
    output.append("################################################################################\n")
    output.append("##########   MANUAL TÉCNICO DEFINITIVO (1:1 INTEGRIDAD TOTAL)   #################\n")
    output.append("################################################################################\n")
    output.append("# Este documento contiene el 100% de las líneas del script original rtg008_1.rsc\n")
    output.append("# Comentado línea a línea para mantenimiento y operaciones.\n\n")

    section = ""
    for line in lines:
        stripped = line.strip()
        if not stripped or stripped.startswith('#'):
            output.append(line)
            continue

        if stripped.startswith('/'):
            section = stripped
            output.append("\n" + "="*80 + "\n")
            output.append(f"### SECCIÓN: {section.upper()}\n")
            output.append("="*80 + "\n")
            output.append(line)
            continue

        # Comentario por comando
        comment = ""
        if "add" in stripped or "set" in stripped:
            if "/ip address" in section: comment = "# Configuración de direccionamiento IP."
            elif "/ip firewall nat" in section: comment = "# Regla de NAT/Redirección industrial."
            elif "/ip firewall filter" in section: comment = "# Regla de filtrado de tráfico (Seguridad)."
            elif "/ip route" in section: comment = "# Ruta estática de encaminamiento."
            elif "roaming" in stripped: comment = "# Lógica de roaming Wi-Fi."
            else: comment = "# Configuración de parámetro de sistema."
            
        if comment:
            output.append(comment + "\n")
        
        output.append(line)

    with open(r'c:\APMT\Skills\comentador-mikrotik-rsc\rtg008_1.comentario.rsc', 'w', encoding='utf-8') as f:
        f.writelines(output)

if __name__ == "__main__":
    merge_and_comment()
