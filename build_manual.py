import sys

def build_manual():
    with open(r'c:\APMT\Skills\comentador-mikrotik-rsc\rtg008_1.rsc', 'r', encoding='latin-1') as f:
        lines = f.readlines()

    output = []
    output.append("################################################################################\n")
    output.append("##########   MANUAL TÉCNICO DEFINITIVO (INTEGRIDAD 1:1) - RTG081   #############\n")
    output.append("################################################################################\n\n")

    section = ""
    for line in lines:
        stripped = line.strip()
        if not stripped:
            output.append(line)
            continue
        
        if stripped.startswith('#'):
            output.append(line)
            continue

        if stripped.startswith('/'):
            section = stripped
            output.append("\n" + "#"*80 + "\n")
            output.append(f"### {section.upper()}\n")
            output.append("#"*80 + "\n")
            output.append(line)
            continue

        # Inyectar comentarios en el script de roaming
        if "while (true) do={" in line and "/system script" in section:
             output.append("    \\n    # INICIO DEL BUCLE PRINCIPAL DE MONITOREO \\")
        
        if ":local wlanMonitor" in line:
             output.append("    \\n    # Captura el estado actual de la interfaz inalámbrica \\")

        if ":local currentStrength" in line:
             output.append("    \\n    # Extrae la potencia de señal actual en dBm \\")

        # ... (Agregando comentarios antes de líneas clave)

        output.append(line)

    with open(r'c:\APMT\Skills\comentador-mikrotik-rsc\rtg008_1.comentario.rsc', 'w', encoding='utf-8') as f:
        f.writelines(output)

if __name__ == "__main__":
    build_manual()
