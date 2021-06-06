clear all 
%utilizza le function "diffDivise" e "newtonEval"
x = [0,2,1,4]; 
y = [1,3,-1,5];
xx = [0,0.5,0.75,1,1.5,1.75,2,2.5,3,3.5,4];

D=diffDivise(x,y);
z=newtonEval(D,xx)

t=linspace(min(x),max(x),100);
f1=figure;
plot(x,y,'r*',t,newtonEval(D,t),'b')
title('prova neville.m')
xlabel('x'); ylabel('y');
grid on