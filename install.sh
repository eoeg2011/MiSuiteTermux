#!/bin/bash

echo "Iniciando la configuración del entorno y la instalación del proyecto..."

# Actualizar y mejorar los paquetes de Termux
echo "Actualizando paquetes de Termux..."
pkg update -y
echo "Actualización completada."

echo "Mejorando paquetes instalados..."
pkg upgrade -y
echo "Mejora completada."

# Instalar Python
echo "Instalando Python..."
pkg install python -y
echo "Python instalado."

# Instalar Git
echo "Instalando Git..."
pkg install git -y
echo "Git instalado."

# Crear el directorio del proyecto
PROJECT_DIR="$HOME/my_project"
echo "Creando el directorio del proyecto en $PROJECT_DIR..."
if mkdir -p "$PROJECT_DIR"; then
    echo "Directorio $PROJECT_DIR creado exitosamente."
else
    echo "Error al crear el directorio $PROJECT_DIR. Puede que ya exista o falten permisos."
fi

echo ""
echo "---------------------------------------------------------------------"
echo "¡Instalación y configuración completadas!"
echo "Navegue al directorio del proyecto usando: cd $PROJECT_DIR"
echo "Si desea instalar herramientas OSINT adicionales, puede ejecutar:"
echo "1. chmod +x instalar_herramientas.sh"
echo "2. ./instalar_herramientas.sh (y luego llamar a la función instalar_herramientas)"
echo "   o source ./instalar_herramientas.sh && instalar_herramientas"
echo "---------------------------------------------------------------------"

# Hacer el script ejecutable (a sí mismo, aunque esto usualmente se hace desde fuera)
# chmod +x install.sh
# chmod +x instalar_herramientas.sh # También hacemos el otro ejecutable por conveniencia
# Lo anterior es más para información, el usuario lo haría externamente.
# El shebang #!/bin/bash ya indica que es un script bash.
# El permiso de ejecución se da con 'chmod +x script.sh' en la terminal.
