%A continuación se resolverá la ecuación diferencial
%0.5y''(t)+y'(t)+y(t)=u(t)
%Definida en el sistema de ecuaciones diferenciales en la funcion "sistemaEDOS"
%usando el cambio de variable y'(t)= v(t).

%Primero se define el intervalo de tiempo
timespan = [0 7];

%Se resolvera la EDO para las siguientes condiciones iniciales.
x0 = [0;0];
x1 = [2;0];
x2 = [2;2];

%Ahora se resuelve el sistema con ode45 y se grafica la solución para cada
%estado inicial

[t,y0] = ode45(@(t,y) sistemaEDOS(t,y),timespan,x0);

figure;
plot(t,y0(:,1));
hold on;
plot(t,y0(:,2));
title('Solucion EDO con con estado inicial X1 = [0;0]');
xlabel('tiempo (t)');
ylabel('Solucion y1(t), y2(t)');
legend('y1(t)','y2(t)');


[t1,y1] = ode45('sistemaEDOS',timespan,x1);

figure;
plot(t1,y1(:,1));
hold on;
plot(t1,y1(:,2));
title('Solucion EDO con estado inicial X2 = [2;0]');
xlabel('tiempo (t)');
ylabel('Solucion y1(t), y2(t)');
legend('y1(t)','y2(t)');

[t2,y2] = ode45('sistemaEDOS',timespan,x2);

figure;
plot(t2,y2(:,1));
hold on;
plot(t2,y2(:,2));
title('Solucion EDO con con estado inicial X3 = [2;2]');
xlabel('tiempo (t)');
ylabel('Solucion y1(t), y2(t)');
legend('y1(t)','y2(t)');

figure;
plot(t,y0(:,1));
hold on;
plot(t1,y1(:,1));
hold on;
plot(t2,y2(:,1));
hold on;
plot(t,y0(:,2));
hold on;
plot(t1,y1(:,2));
hold on;
plot(t2,y2(:,2));
