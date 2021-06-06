function [Q] = quadN(f,a,b,N,Qrule)

%INPUT: 
% 1)funzione f
% 2)estremi dell'intervallo [a,b]
% 3)numero N di sottointervalli in cui dividere [a,b]
% 4)variabile struct che descrive la formula da usare Qrule
% la struct Qrule deve essere composta da
% a)Qrule.p = vettore dei valori dei pesi usati
% b)Qrule.x = vettore dei valori dei nodi usati
%OUTPUT: 
% il valore Q dell'integrale calcolato con i parametri in Qrule
% il calcolo sarà effettutato in N sottointervalli di dimensione uguale

% costruiamo i sottointervalli e calcoliamo al contempo gli integrali in
% essi

t1 = 0;
Q  = 0;

for i=1:N
    t2 = i*(b-a)/N;
    Q  = Q + quad1(f,a+t1,a+t2,Qrule);
    t1 = t2;
end

