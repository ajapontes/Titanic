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
