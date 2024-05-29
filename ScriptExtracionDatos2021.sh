# Autor: Andrea Campillo Piqueras.
# Trabajo Fin de Máster Universitario en Análisis y Visualización de Datos Masivos/ Visual Analytics and Big Data.
# PrediDia: Un Enfoque Predictivo para la Evaluación de la Diabetes.
# GitHub: https://github.com/AndreaCampillo/TFM_PrediDia
# Licencia: MIT License Copyright (c) 2024 Andrea Campillo Piqueras.

# Debe tener copiado en la misma carpeta de ejecución el fichero: LLCP2021.ASC

echo "Year;CatBMI;Stroke;HeartDis;PhysExer;HealthIns;NoMedCost;GenHealth;CogDiff;Depression;MentalHlth;MentalState;PhysHlth;WalkDiff;Gender;AgeRange;EdLevel;AnnIncome;SocClass;UrologyDz;VisionDiff;Asthma;LungDiseases;Arthritis;SmokerTrad;ECigSmok;AlcDrinker;Race;MaritalSt;LastMedChk;Awareness;FootIrrita;FecFootIrrita;HighBP;HighChol;FruitCons;VegCons;FruitOrVegCon;FruitAndVegCon;MarijuanaCon;SleepHours;BrDiabetes;GrDiabetes;SupGrPreDiabetes;SupGrNoPreDiabetes" > DataSetPrimeraPasada.csv #Cabecera

awk '{
    Year = "2021"
	CatBMI = substr($0, 2004, 1)
	Stroke = substr ($0, 121, 1)
	HeartDis = substr ($0, 1908, 1)
	PhysExer = substr ($0, 1904, 1)
	HealthIns = substr ($0, 1902, 1)	
	NoMedCost = substr ($0, 111, 1)		
	GenHealth = substr ($0, 1899, 1)	
	CogDiff = substr ($0, 206, 1)	
    Depression = substr ($0, 127, 1)	
	MentalHlth = substr ($0, 1901, 1)
	PhysHlth = substr ($0, 1900, 1)
	WalkDiff = substr ($0, 207, 1)
	Gender = substr ($0, 1982, 1)
	AgeRange = substr ($0, 1988, 1)
	EdLevel = substr ($0, 2007, 1)
	AnnIncome = substr($0, 193, 2)
	UrologyDz = substr($0, 128, 1)
	VisionDiff = substr($0, 205, 1)
	Asthma = substr($0, 1909, 1)
	LungDiseases = substr($0, 126, 1)
	Arthritis = substr($0, 1912, 1)
	SmokerTrad = substr($0, 2009, 1)	
	ECigSmok = substr($0, 2011, 1)	
	AlcDrinker = substr($0, 2016, 1)
	Race = substr($0, 1980, 1)
	MaritalSt = substr($0, 175, 1)
	LastMedChk = substr($0, 112, 1)
	Awareness = substr($0, 275, 1)
	FootIrrita = substr($0, 264, 3)
	HighBP = substr($0, 114, 1)
	HighChol = substr($0, 117, 1)
	BrDiabetes = substr($0, 129, 1)
	FruitCons = substr($0, 2066, 1)
	VegCons = substr($0, 2067, 1)	
	MarijuanaCon = 9
	SleepHours = 99
	
	if (CatBMI == "1" || CatBMI == "2" || CatBMI == "3" || CatBMI == "4") {
       CatBMI = substr($0, 2004, 1)       
    } else {
       CatBMI = "9" # No sabe, no contesta, caracteres no esperados
    }	
			
	if (Stroke == "1" || Stroke == "2") {
       Stroke = substr ($0, 121, 1)      
    } else {
       Stroke = "9" # No sabe, no contesta, caracteres no esperados
    }	
	
	if (HeartDis == "1" || HeartDis == "2") {
       HeartDis = substr ($0, 1908, 1)      
    } else {
       HeartDis = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	if (PhysExer == "1" || PhysExer == "2") {
       PhysExer = substr ($0, 1904, 1)      
    } else {
       PhysExer = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (HealthIns == "1" || HealthIns == "2") {
       HealthIns = substr ($0, 1902, 1)      
    } else {
       HealthIns = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (NoMedCost == "1" || NoMedCost == "2") {
       NoMedCost = substr ($0, 111, 1)      
    } else {
       NoMedCost = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (GenHealth == "1" || GenHealth == "2") {
       GenHealth = substr ($0, 1899, 1)      
    } else {
       GenHealth = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	if (CogDiff == "1" || CogDiff == "2") { #Algunas veces intercala un espacio en blanco, despues de analizar el fichero origen se observa anormalidades en esa fila
		CogDiff = substr ($0, 206, 1)
	} else {
		CogDiff = "9" #No sabe, no contesta, caracteres no esperados
    }

	if (Depression == "1" || Depression == "2") {
	   Depression = substr ($0, 127, 1)   
    } else {
       Depression = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	if (MentalHlth == "1" || MentalHlth == "2" || MentalHlth == "3") {
       MentalHlth = substr ($0, 1901, 1)      
    } else {
       MentalHlth = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	CogDiff = substr ($0, 206, 1)
	Depression = substr ($0, 127, 1)
	MentalHlth = substr ($0, 1901, 1)
	if ((MentalHlth == "1" || MentalHlth == "2") && Depression == "2" && Decide = "2" ) {
		MentalState = 1 # Buena salud mental 
	} else if (MentalHlth == "3" ||  Depression == "1" || Decide = "1" ) {
		MentalState = 2 # Mala salud mental, se considera mala salud mental con más de trece días en ese estado
	} else {
		MentalState = "9" # No sabe, no contesta, caracteres no esperados
	}
	
	if (PhysHlth == "1" || PhysHlth == "2" || PhysHlth == "3") {
       PhysHlth = substr ($0, 1900, 1)      
    } else {
       PhysHlth = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (WalkDiff == "1" || WalkDiff == "2") {
       WalkDiff = substr ($0, 207, 1)      
    } else {
       WalkDiff = "9" # No sabe, no contesta, caracteres no esperados
    }	

	if (Gender == "1" || Gender == "2") {
       Gender = substr ($0, 1982, 1)      
    } else {
       Gender = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (AgeRange == "1" || AgeRange == "2" || AgeRange == "3" || AgeRange == "4" || AgeRange == "5" || AgeRange == "6") {
       AgeRange = substr ($0, 1988, 1)      
    } else {
       AgeRange = "9" # No sabe, no contesta, caracteres no esperados
    }	
	
	if (EdLevel == "1" || EdLevel == "2" || EdLevel == "3" || EdLevel == "4") {
       EdLevel = substr ($0, 2007, 1)      
    } else {
       EdLevel = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (AnnIncome == "01" || AnnIncome == "02" || AnnIncome == "03" || AnnIncome == "04" || AnnIncome == "05" || AnnIncome == "06" || AnnIncome == "07" || AnnIncome == "08" || AnnIncome == "09" || AnnIncome == "10" || AnnIncome == "11") {
        AnnIncome = substr($0, 193, 2)
    } else {
        AnnIncome = 99  # No sabe, valor no esperado, caracteres no esperados
    }
		
	clase = substr($0, 193, 2)  # Extraer el código salarial codificado
    if (clase == "01" || clase == "02" || clase == "03" || clase == "04" || clase == "05" || clase == "06") {
        clase_salario = 1  # Clase Baja
    } else if (clase == "07" || clase == "08" || clase == "09") {
        clase_salario = 2  # Clase Media
    } else if (clase == "10" || clase == "11") {
        clase_salario = 3  # Clase Alta
    } else {
        clase_salario = 9  # No sabe, valor no esperado, caracteres no esperados
    }

	if (UrologyDz == "1" || UrologyDz == "2") {
       UrologyDz = substr ($0, 128, 1)      
    } else {
       UrologyDz = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (VisionDiff == "1" || VisionDiff == "2") {
       VisionDiff = substr($0, 205, 1)      
    } else {
       VisionDiff = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	if (Asthma == "1" || Asthma == "2") {
       Asthma = substr($0, 1909, 1)    
    } else {
       Asthma = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (LungDiseases == "1" || LungDiseases == "2") {
       LungDiseases = substr($0, 126, 1)    
    } else {
       LungDiseases = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (Arthritis == "1" || Arthritis == "2") {
       Arthritis = substr($0, 1912, 1)    
    } else {
       Arthritis = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (SmokerTrad == "1" || SmokerTrad == "2"  || SmokerTrad == "3" || SmokerTrad == "4") {
       SmokerTrad = substr($0, 2009, 1)   
    } else {
       SmokerTrad = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (ECigSmok == "1" || ECigSmok == "2") {
	   ECigSmok = substr($0, 2011, 1)   
    } else {
       ECigSmok = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (AlcDrinker == "1" || AlcDrinker == "2") {
	   AlcDrinker = substr($0, 2016, 1)  
    } else {
       AlcDrinker = "9" # No sabe, no contesta, caracteres no esperados
    }	

	if (Race == "1" || Race == "2"  || Race == "3" || Race == "4" || Race == "5") {
	   Race = substr($0, 1980, 1)  
    } else {
       Race = "9" # No sabe, no contesta, caracteres no esperados
    }	

	if (MaritalSt == "1" || MaritalSt == "2"  || MaritalSt == "3" || MaritalSt == "4" || MaritalSt == "5" || MaritalSt == "6" ) {
       MaritalSt = substr($0, 175, 1)  
    } else {
       MaritalSt = "9" # No sabe, no contesta, caracteres no esperados
    }

	if (LastMedChk == "1" || LastMedChk == "2"  || LastMedChk == "3" || LastMedChk == "4") {
        LastMedChk = substr($0, 112, 1)
    } else if (LastMedChk == "8") {
        LastMedChk = 5 #Nunca
    } else {
        LastMedChk = 9 #no sabe, no contesta, caracteres no esperados
    }	

	if (Awareness == "1" || Awareness == "2" ) {
       Awareness = substr($0, 275, 1)
    } else {
       Awareness = "9" # No sabe, no contesta, caracteres no esperados
    }

    FootIrrita_Temp = substr($0, 264, 1) # Sólo es necesario el primer caracter
    if (FootIrrita_Temp == "1" || FootIrrita_Temp == "2" || FootIrrita_Temp == "3" || FootIrrita_Temp == "4" || FootIrrita_Temp == "5" || FootIrrita_Temp == "8"){
        FootIrrita = substr($0, 264, 3) #Frecuencia irritacion o llagas en los pies diaria       
    } else {
        FootIrrita = 999 #No tiene pies, no sabe, no contesta, caracteres no esperados
    }		
	
    # Nuevo campo basado en substr($0, 264, 1) con agrupaciones especificadas
    if (FootIrrita_Temp == "1" || FootIrrita_Temp == "2" || FootIrrita_Temp == "3" || FootIrrita_Temp == "4") {
        FecFootIrrita = 1 #Tiene irritacion o llagas en los pies
    } else if (FootIrrita_Temp == "8") {
        FecFootIrrita = 2 #No tiene irritacion o llagas en los pies semanal
    } else {
        FecFootIrrita = 9 #No tiene pies, no sabe, no contesta, caracteres no esperados
    }

	if (HighBP == "1" || HighBP == "4") {
        HighBP = 1 #Limite tensión alta se considera tensión alta
    } else if (HighBP == "2" || HighBP == "3" ) {
        HighBP = 2 #Tension alta durante el embarazo se considera que no tiene 
    } else {
        HighBP = 9 #No sabe, no contesta, caracteres no esperados
    }
	
	HighChol = substr($0, 117, 1)
	if (HighChol == "1" || HighChol == "2" ) {
		HighChol = substr($0, 117, 1)
    } else {
       HighChol = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	if (FruitCons == "1" || FruitCons == "2" ) {
	   FruitCons = substr($0, 2066, 1)
    } else {
       FruitCons = "9" # No sabe, no contesta, caracteres no esperados
    }	
	
	if (VegCons == "1" || VegCons == "2" ) {
	   VegCons = substr($0, 2067, 1)
    } else {
       VegCons = "9" # No sabe, no contesta, caracteres no esperados
    }
	
	# Nuevo campo consume frutas o vegatales
	FruitCons = substr($0, 2066, 1)
	VegCons = substr($0, 2067, 1)
	if (FruitCons == "1" || VegCons == "1" ) {
		FruitOrVegCon = 1
	} else if (FruitCons == "2" && VegCons == "2" ) {
		FruitOrVegCon = 2
	} else {
		FruitOrVegCon = "9" # No sabe, no contesta, caracteres no esperados
	}

	# Nuevo campo consume frutas y vegatales
	FruitCons = substr($0, 2066, 1)
	VegCons = substr($0, 2067, 1)
	if (FruitCons == "1" && VegCons == "1" ) {
		FruitAndVegCon = 1
	} else if (FruitCons == "2" || VegCons == "2" ) {
		FruitAndVegCon = 2
	} else {
		FruitAndVegCon = "9" # No sabe, no contesta, caracteres no esperados
	}
	
    # Nuevo campo basado en substr($0, 129, 1) con agrupaciones especificadas
    BrDiabetes = substr($0, 129, 1)
    if (BrDiabetes == "1") {
        GrDiabetes = 1 #Diabetes
    } else if (BrDiabetes == "4") {
        GrDiabetes = 2 #Prediabetes
    } else if (BrDiabetes == "2" || BrDiabetes == "3") {
        GrDiabetes = 3 #No Diabetes
    } else {
        GrDiabetes = 9 #No sabe, no contesta, caracteres no esperados
    }
 
    # Nuevo campo basado en substr($0, 129, 1) con agrupaciones especificadas
    BrDiabetes = substr($0, 129, 1)
    if (BrDiabetes == "1" || BrDiabetes == "4") {
        SupGrPreDiabetes = 1 #Diabetes, incluye Prediabetes
    } else if (BrDiabetes == "2" || BrDiabetes == "3") {
        SupGrPreDiabetes = 2 #No Diabetes
    } else {
        SupGrPreDiabetes = 9 #No sabe, no contesta, caracteres no esperados
    }

    # Nuevo campo basado en substr($0, 129, 1) con agrupaciones especificadas
    BrDiabetes = substr($0, 129, 1)
    if (BrDiabetes == "1") {
        SupGrNoPreDiabetes = 1 #Diabetes
    } else if (BrDiabetes == "2" || BrDiabetes == "3"  || BrDiabetes == "4") {
        SupGrNoPreDiabetes = 2 #No Diabetes, incluye Prediabetes
    } else {
        SupGrNoPreDiabetes = 9 #No sabe, no contesta, caracteres no esperados
    }
	
    print Year";"CatBMI";"Stroke";"HeartDis";"PhysExer";"HealthIns";"NoMedCost";"GenHealth";"CogDiff";"Depression";"MentalHlth";"MentalState";"PhysHlth";"WalkDiff";"Gender";"AgeRange";"EdLevel";"AnnIncome";"clase_salario";"UrologyDz";"VisionDiff";"Asthma";"LungDiseases";"Arthritis";"SmokerTrad";"ECigSmok";"AlcDrinker";"Race";"MaritalSt";"LastMedChk";"Awareness";"FootIrrita";"FecFootIrrita";"HighBP ";"HighChol";"FruitCons";"VegCons";"FruitOrVegCon";"FruitAndVegCon";"MarijuanaCon";"SleepHours";"BrDiabetes";"GrDiabetes";"SupGrPreDiabetes";"SupGrNoPreDiabetes
}' LLCP2021.ASC >> DataSetPrimeraPasada.csv

awk 'BEGIN {FS=OFS=";"} {gsub("7", "9", $9); gsub("7", "9", $10)} 1' DataSetPrimeraPasada.csv > DataSetSegundaPasada.csv #El campo CogDiff y Depression tienen anomalias y no interpretan bien el 7, por ello se convierte en 9

sed 's/ /9/g' DataSetSegundaPasada.csv > 2021DataSet_Diabeticos_NoDiabeticos_NoDefinidos.csv #Sustituye espacios por 9s debido que existen caracteres extraños no detectados en la primera pasada

awk -F';' '$43 != 9' 2021DataSet_Diabeticos_NoDiabeticos_NoDefinidos.csv > 2021DataSet_Diabeticos_NoDiabeticos.csv #Tienen definido si son diabeticos o no

echo "Year;CatBMI;Stroke;HeartDis;PhysExer;HealthIns;NoMedCost;GenHealth;CogDiff;Depression;MentalHlth;MentalState;PhysHlth;WalkDiff;Gender;AgeRange;EdLevel;AnnIncome;SocClass;UrologyDz;VisionDiff;Asthma;LungDiseases;Arthritis;SmokerTrad;ECigSmok;AlcDrinker;Race;MaritalSt;LastMedChk;Awareness;FootIrrita;FecFootIrrita;HighBP;HighChol;FruitCons;VegCons;FruitOrVegCon;FruitAndVegCon;MarijuanaCon;SleepHours;BrDiabetes;GrDiabetes;SupGrPreDiabetes;SupGrNoPreDiabetes" > 2021DataSet_NoDefinidosDiabetes.csv #Cabecera
awk -F';' '$43 == 9' 2021DataSet_Diabeticos_NoDiabeticos_NoDefinidos.csv  >> 2021DataSet_NoDefinidosDiabetes.csv  #No tienen definido si son diabéticos o no (valor 9)

# Comprobaciones:
# wc -l datasetPrimeraPasada.csv #438694
# wc -l datasetSegundaPasada.csv #438694
# wc -l 2021DataSet_Diabeticos_NoDiabeticos_NoDefinidos.csv #438694
# wc -l 2021DataSet_Diabeticos_NoDiabeticos.csv #437709
# wc -l 2021DataSet_NoDefinidosDiabetes.csv #986

