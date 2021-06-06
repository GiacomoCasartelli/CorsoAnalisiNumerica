function Q = quadAutoUnif(f,a,b,toll,maxN,Qrule)

%INPUT: 
% 1)funzione f.
% 2)estremi dell'intervallo [a,b].
% 3)la tolleranza che utilizzeremo come criterio d'arresto.
% 4)variabile struct che descrive la formula da usare Qrule.
% la struct Qrule deve essere composta da.
% a)Qrule.p = vettore dei valori dei pesi usati.
% b)Qrule.x = vettore dei valori dei nodi usati.
% c)Qrule.order = ordine di convergenza p
%OUTPUT: 
% il valore Q dell'integrale calcolato con il meccanismo di Richardson.

p = 5;
I2N  = quadCS(f,a,b);
for N=1:maxN
    %pongo IN pari a I2N del passo precedente
    IN  = I2N;
    %calcolo I2N
    I2N = quadN(f,a,b,2*N,Qrule);
    %calcolo E2n
    E = abs(I2N - IN)/(2^p-1);
    %controllo se il valore è minore della tolleranza
    if (E<toll)
        break
    end
end
Q=I2N;


