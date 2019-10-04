#esempio con modello e dati insieme nello stesso file
var XB;
var XC;

param P1;
param P2;

param T1;
param T2;
param T_Constraint;

param B_LowerBound;
param B_UpperBound;

param C_LowerBound;
param C_UpperBound;


# obiettivo
maximize Profit: P1 * XB + P2 * XC;

# vincoli
subject to Time: T1 * XB + T2 * XC <= T_Constraint;
subject to B_Limit: B_LowerBound <= XB <= B_UpperBound;
subject to C_Limit: C_LowerBound <= XC <= C_UpperBound;