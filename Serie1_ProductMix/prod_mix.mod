########################################################
# Esempio con modello e dati separati 
# Variabili, Parametri e Vincoli definiti tramite Indici
########################################################

# Indici
set ProdIdx;
set MachineTypeIdx;

# Parametri / Costanti
param ProdPrice{ProdIdx};					# Vettore
param ProdTime{ProdIdx, MachineTypeIdx};	# Matrice
param NumMachines{MachineTypeIdx};
param NumEmployees;							# Constante singola
param NumHoursPerAssembly;
param NumHoursPerShift;
param NumShiftPerDay;
param NumWorkingDayPerWeek;

# Variabili (in questo caso vettore)
var X{ProdIdx} integer, >= 0;

# Obiettivo definito come Sommatoria per ogni elemento di ProfitIndex
maximize Profit: sum{p in ProdIdx} ProdPrice[p] * X[p];

subject to MachinesCapacity{m in MachineTypeIdx}: 
	sum{p in ProdIdx} ProdTime[p,m] * X[p] 
	<= NumWorkingDayPerWeek * NumMachines[m] * NumShiftPerDay * NumHoursPerShift;

subject to AssemblyCapacity: 
	sum{p in ProdIdx} NumHoursPerAssembly * X[p] 
	<= NumWorkingDayPerWeek * NumEmployees * NumShiftPerDay * NumHoursPerShift;


# tutti i vincoli potrebbero essere scritti con un unico vincolo
# definito come SUM{j in J} x[j]*coeff[j] <= VINCOLO
#   i vincoli VINCOLO <= coeff[j]*x[j]  ===> si esprime come -coeff[j]*x[j] <= -VINCOLO
#   i vincoli che si applicano a delle x specifiche si risolvono mettendo i coefficienti a 0 dove non richiesti
	