---
name: comentador-mikrotik-rsc
description: Habilidad especializada en comentar scripts .rsc de MikroTik con explicaciones detalladas tipo manual, identificando flujos de red y dispositivos.
---

# Habilidad: comentador-mikrotik-rsc

## Goal
El objetivo de esta habilidad es transformar scripts de configuración de MikroTik (`.rsc`) en documentos comentados exhaustivamente que funcionen como un manual de instrucciones técnico y legible.

## Instructions
Cuando recibas un pedido para comentar un script `.rsc`:

1.  **Agrupación Lógica (NUEVO)**: 
    *   No comentes línea a línea si los comandos son repetitivos y del mismo contexto (ej: múltiples VLANs, múltiples IPs).
    *   Genera un bloque de comentarios explicativos **ENCIMA** del grupo de comandos.
    *   **Ejemplo**:
        ```routeros
        # QUÉ HACE: Segmentación de VLANs.
        # UTILIDAD: ...
        # SI FALTA: ...
        add interface=... vlan-id=10
        add interface=... vlan-id=20
        ```

2.  **Explicaciones Técnicas Profundas**:
    *   Para comandos de sistema críticos (`/system ntp`, `/system routerboard`, `/system identity`), DEBES explicar **qué es la tecnología**, **para qué sirve en este contexto específico** y **qué pasa si falla**.
    *   Usa la base de conocimientos (NotebookLM) si es necesario para definir conceptos como "NTP" o "RouterBOOT" con precisión.

3.  **Formato de Salida**:
    *   Mantén la integridad del código original al 100%.
    *   Usa el formato `# QUÉ HACE:`, `# UTILIDAD:`, `# SI FALTA:` para las explicaciones.
    *   El archivo de salida debe ser `.comentario.rsc`.

## Examples

### Ejemplo de Configuración de Sistema (Manual Detallado)
**Original:**
`/system ntp client set enabled=yes primary-ntp=1.2.3.4`

**Comentado:**
```routeros
# QUÉ HACE: Configura el cliente NTP (Network Time Protocol) para sincronizar el reloj.
# UTILIDAD: Mantiene la hora exacta, crucial para logs y seguridad.
# SI FALTA: Desincronización de eventos y fallo en validación de certificados.
/system ntp client set enabled=yes primary-ntp=1.2.3.4
```

### Ejemplo de Agrupación de Comandos
**Original:**
```routeros
add action=accept chain=input port=8291 protocol=tcp
add action=accept chain=input port=22 protocol=tcp
```

**Comentado:**
```routeros
# QUÉ HACE: Permite el acceso a la gestión del router (Winbox y SSH).
# UTILIDAD: Habilita la administración remota desde redes autorizadas.
# SI FALTA: Pérdida total de capacidad de gestión remota.
add action=accept chain=input port=8291 protocol=tcp
add action=accept chain=input port=22 protocol=tcp
```

# Habilidad: comentador-mikrotik-rsc

## Goal
El objetivo de esta habilidad es transformar scripts de configuración de MikroTik (`.rsc`) en documentos comentados exhaustivamente que funcionen como un manual de instrucciones. Se busca no solo describir el comando, sino explicar el "por qué" y el contexto de red (origen, destino, propósito) basándose en el análisis integral del script y la base de conocimientos disponible.

## Instructions
Cuando recibas un texto de configuración MikroTik (`.rsc`):

1.  **Análisis Global**: Lee todo el script antes de empezar a comentar para identificar nombres de interfaces, listas de direcciones (Address Lists), VLANs y rutas. Esto te permitirá saber qué dispositivo es cada IP.
2.  **Seccionado**: Divide el script en bloques lógicos usando encabezados visuales potentes, por ejemplo:
    `##########   REGLAS DE FIREWALL   ############`
    `##########   CONFIGURACIÓN DE VLAN   ############`
3.  **Comentario Detallado y Exhaustivo**:
    *   **Línea a Línea**: Debes comentar CADA línea de comando individualmente.   Cuando haya varias lineas que vayan a llevar el mismo comentario, puedes comentarlas juntas.
    *   **Propósito Atómico**: Explica para qué sirve cada parámetro (ej: qué seguridad se añade, por qué se usa ese profile, qué significa ese APN).
    *   **Contexto**: No te limites a traducir el comando. Explica: "Esta regla permite el tráfico de la Red de Antenas (192.168.10.0/24) hacia el Servidor de Control de Grúas".
    *   **Referencias Cruciales**: Si una regla usa una lista como `list=Admin_Access`, explica quiénes son los administradores según el script.
4.  **Generación de Archivo**: Devuelve el script completo conservando la sintaxis original de MikroTik, pero añade los comentarios precedidos por `#`.
5.  **Nomenclatura**: El resultado debe ser entregado bajo el mismo nombre del archivo original pero añadiendo el sufijo `.comentario.rsc`.

## Examples
### Ejemplo de comentario línea a línea
**Original:**
`add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=dynamic-keys name=RTG_AP security-profile=RTG_AP ssid=RTG_AP`

**Comentado:**
```routeros
# Se añaden los tipos de autenticación WPA-PSK y WPA2-PSK para asegurar compatibilidad y seguridad fuerte.
# Se habilita la protección de gestión (Management Protection) para evitar ataques de desautenticación.
# Se establece el modo en llaves dinámicas (dynamic-keys).
# El perfil de seguridad se denomina RTG_AP.
# Se define el SSID "RTG_AP" para que los clientes identifiquen la red inalámbrica de la grúa.
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=RTG_AP security-profile=RTG_AP ssid=RTG_AP
```

### Ejemplo de Resaltado "High-Visibility" en Scripts
**Original (/system script):**
`add name=test source=":put \"hola\""`

**Comentado (Manual Premium):**
```routeros
# QUÉ HACE: Script de prueba de consola.
add name=test source=("" . \
    # Envía el texto "hola" a la salida estándar \
    "\n:put \"hola\"")
```

## Reglas de Oro del Comentador (Manual Avanzado)

1.  **Integridad Total (REGLA MANDATORIA):** El archivo de salida debe contener el **100% de las líneas originales** del archivo `.rsc`. No se puede omitir, resumir o "limpiar" ninguna configuración.
2.  **Comentario Línea a Línea (Estilo Manual):** Cada comando (`add`, `set`, etc.) debe ir precedido por un comentario que explique:
    *   **Qué hace:** Descripción técnica de la acción y parámetros.
    *   **Utilidad/Propósito:** Por qué es necesario en esta infraestructura específica.
    *   **Consecuencia de Ausencia:** Qué pasaría si se eliminara esa línea (ej: pérdida de redundancia, fallo de monitorización, vulnerabilidad de seguridad).
3.  **Scripts Internos e Integridad Visual (High-Visibility):**
    *   Para que los comentarios internos sean legibles (resaltados en verde por el editor), se debe usar la **técnica de concatenación de strings** (`.`).
    *   **Metodología**: Cerrar comillas, añadir el comentario precedido por `#`, y reabrir comillas con el operador de punto.
    *   **Ejemplo**: `source=("" . # Comentario en VERDE \n ":put \"Hola\"")`
    *   Se deben comentar todas las líneas lógicas respetando las escapadas de MikroTik (`\n`, `\r`, `\"`).
4.  **Consistencia Visual:** Usar bloques de cabecera con `#` para separar secciones lógicas principales. Mantener un espaciado uniforme.
5.  **Terminología N4:** El nivel de gestión se denomina siempre "**N4**". Prohibido "Nivel 4" o "Level 4".
6.  **Auditoría de Bloques (REGLA DE CALIDAD):** Una vez generado el manual, se debe realizar una comparación exhaustiva 1:1 entre el original y el comentado en bloques de máximo 50 líneas. Esto garantiza que no se ha perdido ningún carácter o parámetro durante la fase de documentación.
7.  **Mejoras Sugeridas:** Al finalizar la transcripción del script original, añadir una sección de comentarios titulada `########## MEJORAS Y OPTIMIZACIONES SUGERIDAS ##########` donde se detallen potenciales mejoras técnicas detectadas durante el análisis.

## Proceso de Trabajo

1.  **Análisis Exhaustivo:** Leer el archivo línea a línea.
2.  **Generación por Bloques:** Para evitar truncamientos en archivos largos, generar el manual asegurando que no se pierde el contexto.
3.  **Auditoría Post-Generación:** Comparar visual y técnicamente el archivo original con el generado en saltos de 50 líneas para validar la integridad total.
4.  **Verificación Final:** Cotejar el número de comandos originales y su presencia exacta en el manual generado.
ciones en español para este espacio de trabajo.
*   **EVITA** explicaciones genéricas como "acepta tráfico". Sé específico sobre los dispositivos y el propósito.
*   **ENTREGA** el archivo con la extensión `.comentario.rsc`.
