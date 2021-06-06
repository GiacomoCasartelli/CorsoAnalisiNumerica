function Q = quadAutoUnifCS(f,a,b,toll,Max)

%INPUT: 
% 1)funzione f.
% 2)estremi dell'intervallo [a,b].
% 3)la tolleranza utilizzata come criterio d'arresto.
% 4)il numero massimo di iterazioni Max.
%OUTPUT: 
% il valore Q dell'integrale calcolato con il meccanismo di Richardson 
% applicato al metodo di Cavalieri-Simpson.

%calcolo il valore al passo 1.
estr=f(a)+f(b); %somma del valore negli estremi.
val=f((a+b)/2); %somma del valore di f nei punti interni.
I2N=(estr/6+2*val/3)*(b-a);   
for N=2:Max
    IN  = I2N;  %andando al passo successivo considero il valore precedente
    k   = 2^(N-1); %k=numero di sottointervalli
    %a ogni passo azzero il valore dei punti interni per ricalcolarlo
    int = 0;
    for j=1:k
        %calcolo uno alla volta i valori nei nuovi punti e uso la
        %variabile temporanea z per non tenerli a memoria.
        z    = f(a+(b-a)*(2*j-1)/(2*k));
        %calcolo il valore di f nei soli nodi interni.
        int  = int + z;
    end
    
    %sommo i nuovi valori che diventeranno gli estremi dei sottointervalli 
    %al passo successivo.
    val = val + int; 
    
    %calcolo il nuovo integrale con la formula di C-S.    
    I2N = (estr/6 + val/3 + int/3)*(b-a)/(k);
    
    %calcolo l'errore tramite il meccanismo di Richardson.
    E  = abs(I2N-IN)/31;
    if E<toll
        %criterio di arresto.
        break
    end
end

Q=I2N;