#!/bin/bash

instalar_herramientas() {
    echo "Iniciando la instalación de herramientas OSINT..."

    # 1. Crear directorio base
    BASE_DIR="$HOME/osint-tools"
    if [ ! -d "$BASE_DIR" ]; then
        echo "Creando directorio base en $BASE_DIR..."
        mkdir -p "$BASE_DIR"
    else
        echo "Directorio base $BASE_DIR ya existe."
    fi

    # Guardar directorio actual y navegar al base si es necesario
    ORIGINAL_PWD=$(pwd)
    cd "$BASE_DIR" || { echo "Error al cambiar al directorio $BASE_DIR. Abortando."; return 1; }

    echo "Directorio de trabajo actual: $(pwd)"

    # 2. Instalar dependencias generales
    echo "Instalando dependencias generales..."
    echo "Instalando Git..."
    pkg install git -y
    echo "Instalando Python..."
    pkg install python -y
    echo "Asegurando pip..."
    if ! command -v pip &> /dev/null; then
        echo "pip no encontrado, intentando instalar python-pip..."
        pkg install python-pip -y
        if ! command -v pip &> /dev/null; then
            echo "No se pudo instalar pip. Por favor, instálelo manualmente."
        else
            echo "pip instalado correctamente."
        fi
    else
        echo "pip ya está disponible."
    fi
    # Actualizar pip a la última versión
    python -m pip install --upgrade pip

    # 3. Instalar TheHarvester
    echo "Verificando TheHarvester..."
    if [ ! -d "theHarvester" ]; then
        echo "Instalando TheHarvester..."
        git clone https://github.com/laramies/theHarvester.git theHarvester
        if [ -d "theHarvester" ]; then
            pushd theHarvester || { echo "Error al entrar a theHarvester"; return 1; }
            echo "Instalando requerimientos para TheHarvester..."
            python -m pip install -r requirements.txt
            popd || { echo "Error al volver del directorio de TheHarvester"; return 1; }
            echo "Instalación de TheHarvester completada."
        else
            echo "Error al clonar TheHarvester."
        fi
    else
        echo "TheHarvester ya está instalado."
    fi

    # 4. Instalar Sherlock
    echo "Verificando Sherlock..."
    if [ ! -d "sherlock" ]; then
        echo "Instalando Sherlock..."
        git clone https://github.com/sherlock-project/sherlock.git sherlock
        if [ -d "sherlock" ]; then
            pushd sherlock || { echo "Error al entrar a Sherlock"; return 1; }
            echo "Instalando requerimientos para Sherlock..."
            python -m pip install -r requirements.txt
            popd || { echo "Error al volver del directorio de Sherlock"; return 1; }
            echo "Instalación de Sherlock completada."
        else
            echo "Error al clonar Sherlock."
        fi
    else
        echo "Sherlock ya está instalado."
    fi

    # 5. Instalar Holehe
    echo "Verificando Holehe..."
    if ! command -v holehe &> /dev/null; then
        echo "Instalando Holehe..."
        python -m pip install holehe
        if command -v holehe &> /dev/null; then
            echo "Holehe instalado correctamente."
        else
            echo "Error al instalar Holehe con pip. Intente manualmente."
        fi
    else
        echo "Holehe ya está instalado."
    fi

    # 6. Instalar H8mail
    echo "Verificando H8mail..."
    if [ ! -d "h8mail" ]; then
        echo "Instalando H8mail..."
        git clone https://github.com/khast3x/h8mail.git h8mail
        if [ -d "h8mail" ]; then
            pushd h8mail || { echo "Error al entrar a h8mail"; return 1; }
            echo "Instalando requerimientos para H8mail..."
            # H8mail recomienda usar pipx o poetry, pero para Termux pip directo suele ser más sencillo.
            # Si hay problemas, se puede ajustar a pipx install h8mail o poetry install.
            python -m pip install -r requirements.txt
            # Adicionalmente, h8mail puede necesitar configuración, lo cual está fuera del alcance de la instalación básica.
            popd || { echo "Error al volver del directorio de h8mail"; return 1; }
            echo "Instalación de H8mail completada."
        else
            echo "Error al clonar H8mail."
        fi
    else
        echo "H8mail ya está instalado."
    fi

    # 7. Instalar PhoneInfoga
    echo "Verificando PhoneInfoga..."
    if [ ! -d "PhoneInfoga" ]; then
        echo "Instalando PhoneInfoga..."
        # La URL oficial puede cambiar, verificar en su repo. Usamos la común.
        git clone https://github.com/sundowndev/PhoneInfoga.git PhoneInfoga
        if [ -d "PhoneInfoga" ]; then
            pushd PhoneInfoga || { echo "Error al entrar a PhoneInfoga"; return 1; }
            echo "Instalando requerimientos para PhoneInfoga..."
            # PhoneInfoga a veces tiene problemas con la instalación directa de requirements.
            # Puede ser necesario instalar playright manualmente: playwright install
            python3 -m pip install -r requirements.txt
            # Considerar añadir playwright install si la instalación falla
            # echo "Ejecutando playwright install para PhoneInfoga (puede tardar)..."
            # playwright install
            popd || { echo "Error al volver del directorio de PhoneInfoga"; return 1; }
            echo "Instalación de PhoneInfoga completada."
        else
            echo "Error al clonar PhoneInfoga."
        fi
    else
        echo "PhoneInfoga ya está instalado."
    fi

    # Volver al directorio original
    cd "$ORIGINAL_PWD" || { echo "Error al volver al directorio original $ORIGINAL_PWD"; return 1; }
    echo "Proceso de instalación de herramientas OSINT finalizado."
    echo "Todas las herramientas se instalaron en $BASE_DIR"
}

# Para probar la función directamente (opcional, comentar si se usa como librería)
instalar_herramientas
