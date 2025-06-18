# Suite de Instalación Todo-en-Uno para Termux

Bienvenido a la Suite de Instalación Todo-en-Uno para Termux. Este proyecto facilita la configuración de un entorno de desarrollo básico (Python, Git) y la instalación opcional de un conjunto de herramientas OSINT.

## Instalación Rápida (Guía Paso a Paso)

Sigue estos pasos para instalar la suite en Termux:

1.  **Abre la aplicación Termux:**
    *   Busca el ícono de Termux en tu dispositivo Android y tócalo para abrir la aplicación. Verás una pantalla de terminal negra o oscura.

2.  **Copia y Pega el Comando de Instalación:**
    *   Elige **uno** de los siguientes comandos. El primero usa `curl` y el segundo usa `wget`. Ambos hacen lo mismo: descargan y ejecutan el script de configuración.
    *   **Mantén presionado** sobre el bloque de código del comando que elijas, luego selecciona **Copiar**.

    Comando usando `curl`:
    ```bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/USUARIO/NOMBRE_REPO/main/setup_suite.sh)"
    ```

    Comando usando `wget`:
    ```bash
    bash -c "$(wget -qO- https://raw.githubusercontent.com/USUARIO/NOMBRE_REPO/main/setup_suite.sh)"
    ```

    **Nota Importante:**
    *   Deberás reemplazar `USUARIO/NOMBRE_REPO/main` en el comando que copies con la URL real de **este** repositorio y la rama correcta (generalmente `main` o `master`) donde se encuentra el archivo `setup_suite.sh`. Por ejemplo, si tu nombre de usuario en GitHub es `MiUsuario` y el nombre de tu repositorio es `MiSuiteTermux`, el enlace sería algo como `https://raw.githubusercontent.com/MiUsuario/MiSuiteTermux/main/setup_suite.sh`.

3.  **Pega el Comando en Termux y Ejecuta:**
    *   Una vez copiado el comando, vuelve a Termux.
    *   **Mantén presionado** en cualquier parte de la pantalla de la terminal dentro de Termux y selecciona **Pegar** (Paste).
    *   El comando aparecerá escrito en la línea de la terminal.
    *   Presiona la tecla **Enter** en el teclado de tu pantalla.

4.  **Sigue las Instrucciones del Script:**
    *   El script `setup_suite.sh` comenzará a ejecutarse. Te hará algunas preguntas, como si deseas eliminar un directorio existente o si quieres instalar las herramientas OSINT opcionales. Lee los mensajes y responde según tus preferencias (generalmente 's' para sí o 'N' para no, seguido de Enter).

---
*(El resto del README.md continúa abajo de esta sección)*
---

## ¿Qué Hace el Script de Configuración?

El script `setup_suite.sh` automatizará los siguientes pasos:
1.  **Asegura Git:** Verifica e instala `git` si no está presente.
2.  **Clona el Repositorio:** Descarga los archivos necesarios de este repositorio a un directorio llamado `termux_suite_files` en tu carpeta de inicio (`~`).
3.  **Ejecuta la Instalación Básica:** Corre el script `install.sh` que se encuentra dentro del repositorio. Este script:
    *   Actualiza los paquetes de Termux.
    *   Instala Python.
    *   Instala (o confirma la instalación de) Git.
    *   Crea un directorio de proyecto llamado `my_project` en `~/my_project`.
4.  **Pregunta por Herramientas OSINT:** Te consultará si deseas instalar el paquete de herramientas OSINT.
5.  **Instala Herramientas OSINT (Opcional):** Si aceptas, ejecutará el script `instalar_herramientas.sh`, que instala TheHarvester, Sherlock, Holehe, H8mail y PhoneInfoga en el directorio `~/osint-tools`.

## Archivos del Repositorio

Este repositorio contiene los siguientes scripts principales:
*   `setup_suite.sh`: El script de arranque que orquesta toda la instalación (descrito arriba).
*   `install.sh`: Realiza la configuración básica del entorno.
*   `instalar_herramientas.sh`: Instala las herramientas OSINT opcionales.

## Uso Posterior

*   **Entorno Básico:** Después de la instalación, tendrás Python y Git listos. El directorio `~/my_project` está disponible para tus proyectos.
*   **Herramientas OSINT:** Si las instalaste, se encontrarán en `~/osint-tools`. Cada herramienta tiene su propio subdirectorio allí.

## Contribuir

Si deseas contribuir, tienes sugerencias o encuentras algún problema, por favor abre un "issue" o envía un "pull request" en el repositorio de GitHub.

## Licencia

Este proyecto se distribuye bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.
