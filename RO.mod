set X1;
set X2;
set Y;
set M1;
set M2;

param cx{X1,X2};
param cy{Y};

param A11{M1,X1,X2};
param A12{M1,Y};
param A3{M2,X1,X2};

param b1{M1};
param b2{M2};

var x{X1,X2} >= 0;
var y{Y} >= 0;

minimize Objective:
    sum{i in X1} ( sum{j in X2} x[i,j]*cx[i,j] ) + sum{i in Y} y[i]*cy[i];

    #sum{k in M1} sum{i in X1} ( sum{j in X2} A11[k,i,j]*x[i,j] ) + sum{h in Y} A12[k,h] y[h] <= b1[k];
    #sum{k in M2} ( sum{i in X1} ( sum{j in X2} A13[k,i,j]*x[i,j] ) ) >= b2[k];
subject to vincolo1 {k in M1}:
    sum{i in X1, j in X2} A11[k,i,j]*x[i,j] + sum{h in Y} A12[k,h]*y[h] <= b1[k];
;
subject to vincolo2 {k in M2}:    
    sum{i in X1, j in X2} A3[k,i,j]*x[i,j] >= b2[k];
;