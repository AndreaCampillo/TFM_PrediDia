Autor: Andrea Campillo Piqueras.
Trabajo Fin de Máster Universitario en Análisis y Visualización de Datos Masivos/ Visual Analytics and Big Data.
Título: PrediDia:Un Enfoque Predictivo para la Evaluación de la Diabetes.

Organización del repositorio:
Para mayor claridad el presente repositorio se ha organizado en cinco ramas:
* Main: Rama por defecto con información sobre el tipo de licenciamiento, introducción y estructura del respositorio.
* Datasets: Datasets generados durante el trabajo.
* Jupyter_Notebooks: Código fuente de los notebooks escritos en leguaje Python utilizando el entorno de programación Jupyter.
* Scripts: Codigo fuente basados en lenguaje de scripting de la Shell de Linux Bash utilizado en la generación de 
		       los datasets.
* brfss: Ficheros pdfs, URLs y datasets originales del proveedor (brfss) utilizado como referencia en el proyecto. 
		     La información se puede encontrar en su ubicación original, pero ha parecido conveniente dejar copia
		     en este repositorio, con una doble finalidad: El lector de este trabajo tenga centralizada la información y 
		     evitar que en el futuro la ubicación original pudiera ser cambiada.

Resumen:
En el presente trabajo fin de máster se compara distintas técnicas de la Ciencia de Datos, Machine Learning y 
Deep Learning con el objetivo de predecir si un individuo padece diabetes tipo 2, a partir de características 
antropomórficas y socioculturales, sin tener en cuenta datos clínicos, reduciéndose con ello los costes 
sanitarios y pudiendo aplicarse en ámbitos sociales con difícil acceso al sistema de salud.
Siguiendo una metodología de proyectos basados en Machine Learning se ha determinado el mejor modelo posible
capaz de predecir la enfermedad objeto de este trabajo. Para ello se han obtenido nueve conjuntos de datos,
dos de ellos utilizados de forma intensiva, a partir de encuestas masivas realizadas en Estados Unidos por 
los “Centros de Control de Prevención de Enfermedades”, para pasar a continuación a realizar un estudio 
estadístico, determinando los atributos más relevantes, seleccionando las técnicas de balanceo e hiperparámetros 
óptimos para los distintos algoritmos de aprendizaje supervisado, consiguiendo los mejores modelos procediendo 
a la selección, basado en métricas objetivas, del que mejor se adapta en el cumplimiento de los objetivos. 
Además, se han incluido en la comparativa un modelo basado en Redes Neuronales Artificiales y como resultado 
final se ha implementado un modelo resultado del ensamblaje de los algoritmos que mejores métricas han conseguido.
Los resultados obtenidos demuestran que es posible predecir la diabetes en un triage temprano de la enfermedad, 
sin usar parámetros clínicos.
Por todo ello, este trabajo podría ser disruptivo en el ámbito sanitario, ahorrando tiempo y costes. 
Se espera por ello que en investigaciones futuras se estudie la aplicabilidad de este modelo cómo un primer
triage en la detección de la enfermedad, además de servir de guía metodológica en proyectos de la misma índole.
