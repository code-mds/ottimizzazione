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

# tutti i vincoli potrebbero essere scritti con un unico vincolo
# definito come SUM{j in J} x[j]*coeff[j] <= VINCOLO
#   i vincoli VINCOLO <= coeff[j]*x[j]  ===> si esprime come -coeff[j]*x[j] <= -VINCOLO
#   i vincoli che si applicano a delle x specifiche si risolvono mettendo i coefficienti a 0 dove non richiesti