%Solucion de la ecuacion:
%f(x)=0 donde:
%f(x) = 5*(x.^4)+(2/9)*(x.^2)+sin(5.*x)+exp(-9*x)-2*x.*cos(x)-2*(x.^3)
%Por el metodo numerico de la secante.

%Declaracion de f(x)
f = @(x) 5*(x.^4)+(2/9)*(x.^2)+sin(5.*x)+exp(-9*x)-2*x.*cos(x)-2*(x.^3);

resolucion = 0.0001;
%Se establecen los valores iniciales para encontrar la primer solucion
xInicialAnteriorA = 0;
xInicialA = 0.1;
primerSolucion = metodosecante(xInicialAnteriorA,xInicialA,f,resolucion);

%Se establecen los valores iniciales para encontrar la segunda solucion
xInicialAnteriorB = 0.7;
xInicialB = 0.8;
segundaSolucion = metodosecante(xInicialAnteriorB,xInicialB,f,resolucion);

%Obtencion de la grafica de f(x) = 0
%Variable independiente
graphXA = -2:0.001:2;
graphXB = -0.2:0.001:1;
%f(x)
graphYA = f(graphXA);
graphYB = f(graphXB);
xaxisA = 0*graphXA; %puntos para la ecuacion y=0
xaxisB = 0*graphXB;

%Primero se grafica la ecuacion f(x)=0 para -2<=x<=2 y Y=0 para observar la
%ubicacion grafica de las soluciones
figure;
plot(graphXA,graphYA,graphXA,xaxisA,'k');
title('f(x) = 0 para -2\leqx\leq2 ');
legend('f(x)','y=0');
xlabel('x');
ylabel('f(x)');


%Luego se grafica f(x)=0 y Y=0 para -0.2<=x<=1 y se colocan las soluciones
%obtenidas por el metodo de la secante.
figure;
plot(graphXB,graphYB,graphXB,xaxisB,'k');
title('f(x) = 0 para -0,2\leqx\leq1 ');
xlabel('x');
ylabel('f(x)');
hold on;
%Se establecen los puntos en el plano de acuerdo a las soluciones
%obtenidas por el metodo de la secante 
plot(primerSolucion,0,'go',segundaSolucion,0,'go','LineWidth',2);
legend('f(x)','y=0','Soluciones obtenidas');

