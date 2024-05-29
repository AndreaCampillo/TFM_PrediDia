# Autor: Andrea Campillo Piqueras.
# Trabajo Fin de Máster Universitario en Análisis y Visualización de Datos Masivos/ Visual Analytics and Big Data.
# PrediDia: Un Enfoque Predictivo para la Evaluación de la Diabetes.
# GitHub: https://github.com/AndreaCampillo/TFM_PrediDia
# Licencia: MIT License Copyright (c) 2024 Andrea Campillo Piqueras.

# Debe tener copiado en la misma carpeta de ejecución los ficheros: 
#	* 2021DataSet_Diabeticos_NoDiabeticos_Depurado.csv ( https://github.com/AndreaCampillo/TFM_PrediDia/raw/Datasets/2021DataSet_Diabeticos_NoDiabeticos_Depurado.csv )
#	* 2022DataSet_Diabeticos_NoDiabeticos_Depurado.csv ( https://github.com/AndreaCampillo/TFM_PrediDia/raw/Datasets/2022DataSet_Diabeticos_NoDiabeticos_Depurado.csv )

cp "2021DataSet_Diabeticos_NoDiabeticos_Depurado.csv" "2021_22DataSet_Diabeticos_NoDiabeticos_Depurado.csv"
tail -n +2 "2022DataSet_Diabeticos_NoDiabeticos_Depurado.csv" > "2022DataSet_Diabeticos_NoDiabeticos_Depurado_SinCabecera.csv"
cat "2022DataSet_Diabeticos_NoDiabeticos_Depurado_SinCabecera.csv" >> "2021_22DataSet_Diabeticos_NoDiabeticos_Depurado.csv"

# Comprobaciones:
# wc -l 2021DataSet_Diabeticos_NoDiabeticos_Depurado.csv #229656
# wc -l 2022DataSet_Diabeticos_NoDiabeticos_Depurado.csv #273938
# wc -l 2022DataSet_Diabeticos_NoDiabeticos_Depurado_SinCabecera.csv #273937
# wc -l 2021_22DataSet_Diabeticos_NoDiabeticos_Depurado.csv #503593


