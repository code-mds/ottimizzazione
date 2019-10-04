#esempio con modello e dati insieme nello stesso file
var XB;
var XC;

# obiettivo
maximize Profit: 25 * XB + 30 * XC;

# vincoli
subject to Time: (1/200) * XB + (1/140) * XC <= 40;
subject to B_Limit: 0 <= XB <= 6000;
subject to C_Limit: 0 <= XC <= 4000;

###################
# per eseguire da console
# ampl: model prod0.mod;
# ampl: solve;
#   MINOS 5.51: optimal solution found.
#   2 iterations, objective 192000
 
# ampl: display XB;
#   XB = 6000

# ampl: display XC;
#   XC = 1400

###################
# per eseguire da script
# seleziono file e "send to ampl"
