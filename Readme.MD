Predicción de Income con Random Forest en R

Modelo aplicado a la base de datos Adult (UCI Machine Learning Repository)

📌 Descripción del Proyecto

Este proyecto implementa un pipeline completo en R para predecir la variable income (ingresos) de la famosa base de datos Adult, también conocida como Census Income Dataset, disponible en el sitio web del UCI Machine Learning Repository.

El objetivo es clasificar si el ingreso anual de una persona es ">50K" o "<=50K", utilizando un modelo de Random Forest.
Todo el proceso —desde la carga de los datos hasta la evaluación del modelo— se realiza íntegramente en R.

🧱 Estructura del Pipeline

El flujo del proyecto incluye:

Carga de datos

Lectura de los archivos originales del dataset Adult (train/test o única tabla según formato elegido).

Definición de tipos de variables (numéricas, categóricas).

Preprocesamiento

Limpieza de valores faltantes.

Recodificación y estandarización de variables categóricas.

División entrenamiento/prueba (si aplica).

Manejo de desbalance si se requiere (opcional).

Entrenamiento del modelo

Ajuste de un modelo de Random Forest usando la librería randomForest o ranger.

Selección de hiperparámetros relevantes (ntree, mtry, etc.).

Predicción y evaluación

Predicciones sobre el conjunto de prueba.

Cálculo de métricas:

Accuracy

Matriz de confusión

Precision, Recall, F1

ROC y AUC (opcional)

Interpretabilidad del modelo

Importancia de variables (variable importance).

Gráficos relacionados (si se incluyen en el repositorio).

📁 Archivos del Repositorio

script.R — Contiene todo el pipeline en R.

README.md — Descripción del proyecto.

/data/ — Carpeta opcional si deseas incluir el dataset o instrucciones para descargarlo.

/plots/ — Gráficos generados durante el análisis (variable importance, ROC, etc., si aplican).

📦 Requisitos

Para ejecutar el proyecto, se recomienda tener instalado R ≥ 4.0 y las siguientes librerías:

install.packages(c("tidyverse", "randomForest", "caret", "ranger", "pROC"))

▶️ Cómo Ejecutar el Proyecto

Clona este repositorio:

git clone https://github.com/usuario/repositorio.git


Abre R o RStudio y ejecuta el script principal:

source("script.R")


Los resultados de las métricas y gráficos se generarán automáticamente.

📊 Resultados Esperados

Dependiendo de los hiperparámetros y del preprocesamiento, el modelo Random Forest generalmente obtiene:

Accuracy entre 0.82 y 0.86

Buena capacidad de separación para clases desbalanceadas

Importancia alta en variables como educación, capital gain, horas trabajadas y ocupación

🧩 Dataset

La base de datos puede encontrarse en:

UCI Machine Learning Repository – Adult Dataset
https://archive.ics.uci.edu/ml/datasets/adult

🤝 Contribuciones

¡Las contribuciones son bienvenidas!
Si deseas mejorar el pipeline, agregar modelos adicionales o incluir análisis comparativos, puedes abrir un pull request o crear un issue.

📝 Licencia

Este proyecto se publica bajo la licencia MIT.