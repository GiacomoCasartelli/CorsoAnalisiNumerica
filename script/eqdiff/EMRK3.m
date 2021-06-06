function [T,Y,nRif] = EMRK3(f,y0,tFin,toll,dt0)
%INFORMAZIONI:
%INPUT:
% 1)function handle f=@(t,y)
% 2)'y0' dato iniziale
% 3)'tFin' tempo finale
% 4)'toll' tolleranza 
% 5)'dt0' lunghezza intervallo al passo 0
%OUTPUT:
%1)T vettore dei tempi tn
%2)Y vettore dei valori della soluzione calcolati nei tn
%3)nRif numero di passi rifiutati

if nargin<5
    dt0 = tFin/100;
end

%inizio di t, del passo e del numero di valori rifiutati
dt=dt0;
t=0;
T(1)=0;
nRif=0; 

%inizio dei metodi a y0

Y(1)=y0;

k=1; %indice dei vettori
while t<tFin
    %calcolo con eulero esplicito in T(k)
    E = Y(k) + dt*f(T(k),Y(k));
    %calcolo con eulero modificato in T(k+1) usando eul esp
    M = Y(k) + dt*(f(T(k),Y(k))+f(T(k)+dt,E))/2;
    %calcolo con RK3 usando eulero esp e eulero mod
    Y(k+1)  = Y(k) + dt*( f(T(k),Y(k))/6 + f(T(k)+dt,E)/6 + 2/3*f(T(k)+dt/2,M) );
    
    %stima d'errore
    err = abs(M-Y(k+1))/dt;

    if err<toll
        t      = T(k) + dt;
        T(k+1) = t;
        k      = k+1;
        dt     = 0.93*dt*(toll/err)^0.5;
    else
        dt   = dt*(toll/err)^0.5;
        nRif = nRif +1;
    end
end
end