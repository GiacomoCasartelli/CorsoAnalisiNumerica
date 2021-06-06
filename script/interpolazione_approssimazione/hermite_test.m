clear all 

f = @(x) 2.*sin(3.*x)+3.*cos(x)+exp(-7.*x);
g = @(x) 6.*cos(3.*x)-3.*sin(x)-7.*exp(-7.*x);
% f=@(x) sin(x);
% g=@(x) cos(x);

x = [1,2,3,4]; 
y = f(x);
y1 = g(x);

D=divDiffHermite(x,y,y1)

xx=linspace(min(x),max(x),100);
f1=figure;
plot(xx,f(xx),'g')
hold on
plot(x,y,'r*',xx,newtonEval(D,xx),'b')
title('prova hermite.m')
xlabel('x'); ylabel('y');
grid on