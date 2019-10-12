# ------------------------
# 1) Definire variabili
# 2) Definire goal
# 3) Definire constraints
# ------------------------

# 1) Variabili: matrice X[i,j]   {0,1} i->Left, j->Right
set Left;
set Right;

var X{Left,Right} binary;

param PRI{Left,Right};	# piorita [1 .. 100]
param ACC{Left,Right};	# accettabilita [0..1], 0 non accettabile

# 2) Obiettivo: max SUM_i(SUM_j( X[i,j] * C[i,j]), C priorita'
maximize Assegnamenti: sum{i in Left, j in Right} X[i,j] * PRI[i,j];

# 3) Vincoli:
subject to OneRight{i in Left}: sum{j in Right} X[i,j] <= 1;
subject to OneLeft{j in Right}: sum{i in Left} X[i,j] <= 1;
subject to Accettabile{i in Left, j in Right}: X[i,j] <= ACC[i,j];
