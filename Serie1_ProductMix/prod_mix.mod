########################################################
# Esempio con modello e dati separati 
# Variabili, Parametri e Vincoli definiti tramite Indici
########################################################

# Indici
set ProdIdx;
set MachineTypeIdx;

# Parametri
param ProdPrice{ProdIdx};
param ProdTime{ProdIdx, MachineTypeIdx};
param NumMachines{MachineTypeIdx};
param NumEmployees;
param NumHoursPerAssembly;
param NumHoursPerShift;
param NumShiftPerDay;
param NumWorkingDayPerWeek;


set ProfitIndex;


param Lower{ProfitIndex};
param Upper{ProfitIndex};
param TimeLimit;

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

	