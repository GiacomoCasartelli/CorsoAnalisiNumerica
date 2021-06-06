clear all 

x = [0,1,2,4]; 
y = [1,-1,3,5];

dD=diffDivise([0,2,4],[1,3,5]);
d=aggiungiNodo(dD,1,-1);

xx=linspace(min(x),max(x),100);
f1=figure;
plot(x,y,'r*',xx,newtonEval(d,xx),'b')
title('prova newton.m')
xlabel('x'); ylabel('y');
grid on
