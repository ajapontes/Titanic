# 🚢 Titanic - Predicción de Supervivencia (Competencia Kaggle)

Este proyecto aplica buenas prácticas de ciencia de datos para resolver la competencia [Titanic: Machine Learning from Disaster](https://www.kaggle.com/competitions/titanic/) de Kaggle. Se desarrolla utilizando Jupyter Notebooks dentro de VSCode, con una estructura modular, reinicio automático de artefactos, versionamiento con Git y despliegue controlado.

---

## 🧠 Objetivos

- Cargar, explorar y preprocesar datos del Titanic.
- Probar múltiples modelos predictivos (Logistic Regression, SVM, Random Forest, XGBoost, etc.).
- Generar archivos `submission.csv` directamente desde VSCode.
- Aplicar principios de reproducibilidad, backup y control de versiones.

---

## 📁 Estructura de Carpetas

```plaintext
C:\Proyectos\Titanic
│
├── data/                # Datos descargados desde Kaggle (.csv)
├── notebooks/           # Notebooks con análisis, modelos y resultados
├── scripts/             # Módulos reutilizables (utils, reinicio, modelos)
├── results/             # Métricas generadas
├── checkpoints/         # Modelos entrenados (.pkl, .joblib)
├── images/              # Gráficas generadas
├── backups/             # Respaldos .zip automáticos con timestamp
├── requirements.txt     # Librerías necesarias para correr el proyecto
├── .gitignore           # Archivos que no se deben versionar
├── restart_utils.py     # Script de reinicio controlado
└── README.md            # Este archivo

🛠️ Configuración del Entorno
1. Crear entorno virtual (recomendado)
bash
Copiar
Editar
python -m venv venv
.\venv\Scripts\activate  # En Windows
2. Instalar dependencias
bash
Copiar
Editar
pip install -r requirements.txt
3. Configurar acceso a Kaggle
Ve a https://www.kaggle.com/account

Crea un nuevo API Token (descarga kaggle.json)

Coloca el archivo kaggle.json en la raíz del proyecto:

plaintext
Copiar
Editar
C:\Proyectos\Titanic\kaggle.json
Este archivo está listado en .gitignore para evitar que se suba a GitHub.

🚀 Flujo de Trabajo del Proyecto
Ejecutar el script restart_utils.py si deseas iniciar una nueva corrida limpia (genera respaldo .zip automático).

Cargar y explorar los datos en los notebooks 01_descarga_y_carga_datos.ipynb y 02_eda.ipynb.

Probar distintos modelos en los notebooks 03_modelo_baseline.ipynb, 04_modelo_rf.ipynb, etc.

Guardar predicciones en submission.csv.

Subir resultados a Kaggle desde la terminal:

bash
Copiar
Editar
kaggle competitions submit -c titanic -f submission.csv -m "Comentario del intento"
🧪 Reinicio de artefactos del proyecto
Puedes reiniciar automáticamente los directorios checkpoints/, results/ e images/ con respaldo incluido:

bash
Copiar
Editar
python scripts/restart_utils.py
Esto creará un archivo .zip en backups/ con los contenidos previos, etiquetado con fecha y hora.

📊 Progreso del Proyecto
|Etapa 1Estado|
--
|Estructura inicial|✅ Completado|
|Descarga de datos|✅ Completado|
|Exploración (EDA)|🔜 En progreso|
|Entrenamiento de modelos|🔜 Próximo paso|
|Generación de submissions|🔜 Próximo paso|
|Automatización de envíos|🔜 Pendiente|
|Optimización de modelos|🔜 Pendiente|

🔒 Seguridad y buenas prácticas
El archivo kaggle.json no se sube a GitHub por razones de seguridad.

Todos los resultados intermedios se respaldan automáticamente antes de ser sobrescritos.

El código está documentado en español, y los notebooks incluyen Markdown explicativo para facilitar la lectura.

🧠 Tecnologías utilizadas
Python 3.x

Jupyter Notebooks

pandas, numpy, matplotlib, seaborn

scikit-learn, kaggle API

Git + GitHub (repositorio privado)

✍️ Autor
Alfredo Aponte
Field Compliance Officer | Arquitecto SAP BTP | Científico de Datos en formación