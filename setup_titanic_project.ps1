# =====================================================================
# Script de configuración inicial del proyecto Titanic - Kaggle
# Autor: Alfredo Aponte
# Fecha: (se genera dinámicamente)
# =====================================================================

# Cambiar al directorio del proyecto
Set-Location "C:\Proyectos\Titanic"

# Crear carpetas del proyecto
$folders = "data", "notebooks", "scripts", "results", "checkpoints", "images", "backups"
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Output "Carpeta creada: $folder"
    }
}

# Crear entorno virtual
if (-not (Test-Path "venv")) {
    python -m venv venv
    Write-Output "Entorno virtual creado."
} else {
    Write-Output "El entorno virtual ya existe."
}

# Activar entorno virtual
& ".\venv\Scripts\Activate.ps1"
Write-Output "Entorno virtual activado."

# Instalar paquetes requeridos
pip install pandas numpy matplotlib seaborn scikit-learn jupyter kaggle

# Crear requirements.txt
@"
pandas==1.5.3
numpy==1.24.3
matplotlib==3.7.1
seaborn==0.12.2
scikit-learn==1.2.2
jupyter==1.0.0
kaggle==1.5.13
"@ | Set-Content -Encoding UTF8 "requirements.txt"
Write-Output "Archivo requirements.txt creado."

# Crear .gitignore
@"
venv/
__pycache__/
.ipynb_checkpoints/
*.zip
kaggle.json
"@ | Set-Content -Encoding UTF8 ".gitignore"
Write-Output "Archivo .gitignore creado."

# Crear README.md básico
@"
# Proyecto Titanic - Kaggle

Este proyecto busca analizar los datos del Titanic y generar modelos predictivos, siguiendo buenas prácticas de programación y ciencia de datos.

## Estructura de carpetas inicial

- \`data/\`: Datos originales de Kaggle
- \`notebooks/\`: Exploración de datos y modelos
- \`scripts/\`: Módulos reutilizables (reinicio, procesamiento, etc.)
- \`results/\`: Métricas y salidas
- \`checkpoints/\`: Modelos entrenados
- \`images/\`: Gráficas generadas
- \`backups/\`: Respaldos automáticos en ZIP
"@ | Set-Content -Encoding UTF8 "README.md"
Write-Output "Archivo README.md creado."

# Crear restart_utils.py
@"
# scripts/restart_utils.py

\"\"\"
Utilidad para reiniciar carpetas clave del proyecto:
- Realiza respaldo .zip con timestamp
- Limpia las carpetas: checkpoints, results, images

Autor: Alfredo Aponte
\"\"\"

import os
import shutil
from datetime import datetime
from zipfile import ZipFile

CARPETAS_OBJETIVO = [\"checkpoints\", \"results\", \"images\"]
RUTA_BACKUPS = \"backups\"

def reiniciar_directorios():
    timestamp = datetime.now().strftime(\"%Y%m%d%H%M%S\")
    backup_file = os.path.join(RUTA_BACKUPS, f\"respaldo_{timestamp}.zip\")

    os.makedirs(RUTA_BACKUPS, exist_ok=True)

    with ZipFile(backup_file, 'w') as zipf:
        for folder in CARPETAS_OBJETIVO:
            if os.path.exists(folder):
                for root, _, files in os.walk(folder):
                    for file in files:
                        full_path = os.path.join(root, file)
                        arcname = os.path.relpath(full_path, start='.')
                        zipf.write(full_path, arcname)
                shutil.rmtree(folder)
                os.makedirs(folder)

    print(f\"[INFO] Backup creado: {backup_file}\")
    print(\"[INFO] Carpetas reiniciadas:\", \", \".join(CARPETAS_OBJETIVO))

if __name__ == \"__main__\":
    reiniciar_directorios()
"@ | Set-Content -Encoding UTF8 "scripts/restart_utils.py"
Write-Output "Archivo scripts/restart_utils.py creado."

Write-Output "`n✅ Proyecto inicializado correctamente. Puedes continuar con la descarga de datos."
