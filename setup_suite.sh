#!/bin/bash

echo "================================================"
echo "Bienvenido al Script de Configuración de la Suite"
echo "================================================"
echo ""

# 2. Asegurar que Git esté instalado
echo "Asegurando que Git esté instalado..."
pkg install git -y
echo "Comprobación de Git finalizada."
echo ""

# 3. Definir Variables del Repositorio
REPO_URL="https://github.com/eoeg2011/MiSuiteTermux.git" # Placeholder
REPO_DIR_NAME="termux_suite_files" # Nombre del directorio donde se clonará
REPO_FULL_PATH="$HOME/$REPO_DIR_NAME"

echo "Configuración del repositorio:"
echo "URL: $REPO_URL"
echo "Directorio de destino: $REPO_FULL_PATH"
echo ""

# 4. Manejar Directorio de Repositorio Existente
clone_repo=true
if [ -d "$REPO_FULL_PATH" ]; then
    echo "El directorio $REPO_FULL_PATH ya existe."
    read -p "¿Desea eliminarlo y volver a clonar? (s/N): " choice
    case "$choice" in
      s|S )
        echo "Eliminando el directorio existente $REPO_FULL_PATH..."
        rm -rf "$REPO_FULL_PATH"
        if [ $? -ne 0 ]; then
            echo "Error: No se pudo eliminar el directorio $REPO_FULL_PATH."
            echo "Por favor, elimínelo manualmente e intente de nuevo."
            exit 1
        fi
        echo "Directorio eliminado."
        clone_repo=true
        ;;
      * )
        echo "Se intentará usar el directorio existente $REPO_FULL_PATH."
        clone_repo=false
        ;;
    esac
else
    clone_repo=true # No existe, entonces clonar
fi
echo ""

# 5. Clonar el Repositorio
if [ "$clone_repo" = true ]; then
    echo "Clonando el repositorio de la suite desde $REPO_URL..."
    git clone "$REPO_URL" "$REPO_FULL_PATH"
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo clonar el repositorio desde $REPO_URL."
        echo "Verifique la URL y su conexión a internet."
        exit 1
    fi
    echo "Repositorio clonado exitosamente en $REPO_FULL_PATH."
else
    echo "Usando el directorio existente $REPO_FULL_PATH. Saltando clonación."
fi
echo ""

# 6. Navegar al Directorio del Repositorio
echo "Cambiando al directorio del repositorio: $REPO_FULL_PATH..."
cd "$REPO_FULL_PATH"
if [ $? -ne 0 ]; then
    echo "Error: No se pudo cambiar al directorio $REPO_FULL_PATH."
    echo "Asegúrese de que el repositorio fue clonado correctamente o que el directorio existe."
    exit 1
fi
echo "Directorio actual: $(pwd)"
echo ""

# 7. Hacer Scripts Ejecutables
echo "Haciendo scripts principales ejecutables..."
if [ -f "install.sh" ]; then
    chmod +x install.sh
    echo "install.sh ahora es ejecutable."
else
    echo "Advertencia: No se encontró install.sh en el directorio del repositorio."
fi

if [ -f "instalar_herramientas.sh" ]; then
    chmod +x instalar_herramientas.sh
    echo "instalar_herramientas.sh ahora es ejecutable."
else
    echo "Advertencia: No se encontró instalar_herramientas.sh en el directorio del repositorio."
fi
echo ""

# 8. Ejecutar Instalación Básica
echo "Ejecutando el script de instalación básica (install.sh)..."
if [ -f "install.sh" ]; then
    ./install.sh
    echo "Script de instalación básica completado."
else
    echo "Error: No se pudo ejecutar install.sh porque no se encontró."
    echo "La configuración no puede continuar."
    exit 1
fi
echo ""

# 9. Preguntar por Instalación de Herramientas OSINT
read -p "¿Desea instalar las herramientas OSINT adicionales? (s/N): " osint_choice

# 10. Ejecutar Instalación de Herramientas OSINT (si se solicita)
case "$osint_choice" in
  s|S )
    echo "Ejecutando el script de instalación de herramientas OSINT (instalar_herramientas.sh)..."
    if [ -f "instalar_herramientas.sh" ]; then
        bash ./instalar_herramientas.sh # Se ejecuta directamente y llama a su función interna
        echo "Script de instalación de herramientas OSINT completado."
    else
        echo "Advertencia: No se pudo ejecutar instalar_herramientas.sh porque no se encontró."
    fi
    ;;
  * )
    echo "Se omitió la instalación de herramientas OSINT adicionales."
    ;;
esac
echo ""

# 11. Mensaje de Finalización
echo "================================================"
echo "¡Configuración de la suite completada!"
echo "Revise los mensajes anteriores para cualquier error o advertencia."
echo "El entorno básico debería estar configurado."
echo "Si instaló herramientas OSINT, estas deberían estar en $HOME/osint-tools."
echo "El directorio del proyecto base creado por install.sh es $HOME/my_project."
echo "Los scripts de la suite están en $REPO_FULL_PATH."
echo "================================================"

exit 0
