########################################################
# Esempio con modello e dati separati 
# Variabili, Parametri e Vincoli definiti tramite Indici
########################################################

# Indici
set ProfitIndex;

# Parametri
param P{ProfitIndex};
param T{ProfitIndex};
param Lower{ProfitIndex};
param Upper{ProfitIndex};
param TimeLimit;

# Variabili (in questo caso vettore)
var X{ProfitIndex};

# Obiettivo definito come Sommatoria per ogni elemento di ProfitIndex
maximize Profit: sum{i in ProfitIndex} P[i] * X[i];

# 1 Vincolo definito come sommatoria
subject to TimeConstr: sum{i in ProfitIndex} T[i] * X[i] <= TimeLimit;
# n Vincoli definiti definiti per ogni elemento di ProfitIndex
subject to BoundConstr{i in ProfitIndex}: Lower[i] <= X[i] <= Upper[i];
