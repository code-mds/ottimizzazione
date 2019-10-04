#esempio con modello e dati insieme nello stesso file
set ProfitIndex;

param P{ProfitIndex};
param T{ProfitIndex};
param L{ProfitIndex};
param U{ProfitIndex};
param T_Constraint;

var X{ProfitIndex};



# obiettivo
maximize Profit: sum{i in ProfitIndex} P[i] * X[i];

# vincoli
s.t. Time: sum{i in ProfitIndex} T[i] * X[i] <= T_Constraint;

s.t. Constr{i in ProfitIndex}: L[i] <= X[i] <= U[i];


#subject to B_Limit: B_LowerBound <= XB <= B_UpperBound;
#subject to C_Limit: C_LowerBound <= XC <= C_UpperBound;