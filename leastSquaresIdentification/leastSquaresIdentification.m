
%%%%%%%%%%%%%%%%Proyecto Final de Sistemas de Control%%%%%%%%%%%%%%%%%%
%   Equipo 1-4                                                  
%   Carlos Alvarado
%   Juan Gonzales
%   Kevin Murillo
% Se tiene un modelo de un rodillo caliente para secar
% papel. Se trata el modelo como una caja negra y a partir de las
% respuestas obtenidas de este sistema se identifica un modelo que 
% represente con fidelidad la dinamica del modelo real.
%
% A partir de este modelo se diseñan  los controladores 
% Se solicita:
%   Determinar las variables de interés con base en el
% funcionamiento del proceso, así como el comportamiento
% requerido del lazo de control.
%   Realizar la identificación de un modelo dinámico
% del sistema de orden reducido, de forma experimental
% a partir del proceso “real” suministrado.
%   Analizar la variación de las características dinámicas
% del proceso en el ámbito de operación esperado.
%   Establecer las especificaciones requeridas de diseño:
% rendimiento, esfuerzo de control, fragilidad
% y robustez, que se consideren adecuados para el
% problema propuesto.
%   Seleccionar el algoritmo de control PID a utilizar
% y su respectiva estructura.
%   Realizar el ajuste de los parámetros del controlador
% utilizando las estrategias y métodos que se consideren
% adecuados para el problema propuesto. Se pueden
% utilizar métodos expuestos en diversas fuentes
% bibliográficas (libros, revistas IEEE, publicaciones
% IFAC, el Handbook de reglas de sintonización PID
% [1], etc.).
%%%%%%%%%%%%%%%%%%%%r%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

s = tf('s');
P = 0.243*(50.1*s+1)*exp(-40*s)/(s*(20.4*s+1));
Ps = 0.241*(50.4*s+1)/(s*(20.9*s+1))-0.241*(50.4*s+1)*exp(-40*s)/(s*(20.9*s+1));
Ppade = 0.243*(50.1*s+1)*pade(exp(-40*s),2)/(s*(20.4*s+1));

Pls = 0.241*(50.4*s+1)*exp(-40*s)/(s*(20.9*s+1));
Pminus = (s*(20.9*s+1))/(0.241*(50.4*s+1));
Gf = 1/(2*s+1);
Cimc = Pminus*Gf;


L2 = P*0.059*(1/(50*s+1))*(1+1/(280*s))*(1+20.9*s)/(2.09*s+1);
L = Ppade*0.059*(1/(50*s+1))*(1+1/(280*s))*(1+20.9*s)/(2.09*s+1);
Ms = getPeakGain(1/(1+L));

figure;
plot(100*y,'k');
hold on;
plot(100*r,'--k');
plot(100*d,'-.k');
xlabel('tiempo(s)');
ylabel('Magnitud(%)');
legend('Respuesta','Valor deseado','Perturbación');
grid;
title('Respuesta a lazo cerrado con controlador PID serie');
hold off;






figure;
plot(100*simout6,'k');
hold on;
plot(100*simout1,'--k');
% plot(simout2,'-.k');
% plot(simout3,':k');
xlabel('tiempo(s)');
grid;
ylabel('Magnitud(%)');
legend('M_s = 1,2 con PS','M_s = 1,2');
title('Señal de salida del sistema de control con predictor Smith');

t = 0:0.1:200;
y1 = 0.5883*t-24.12;
y2 = 0.242*t-2.6;
figure;
plot(tout,y(:,5),'k');
hold on
plot(t,y1,'--k');
plot(t,y2,'--k');
plot(62.12,12.43,'ksquare')
xlim([20 140]);
ylim([0 35]);
grid;
xlabel('tiempo(s)');
ylabel('Magnitud');
title('Respuesta de la planta ante una entrada escalón');

% G posee el modelo real del rodillo caliente
% de ahora en adelante se tratará como una caja negra
% y en base a la respuesta ante distintos estimulos se 
% identificara un modelo de la planta.


%Obtencion de la respuesta ante un escalón de la planta.
figure;
step(G);
xlim([0 120]);
xlabel('tiempo(s)');
ylabel('Magnitud');
title('Respuesta de la planta ante una entrada escalón');

%Obtencion de la respuesta a lazo cerrado de la planta.
figure;
[y,t] = step(feedback(G,0.015));
y = 100*(y/66.58);
plot(t,y,'k');
hold on;
grid;
xlim([0 1800]);
xlabel('tiempo(s)');
ylabel('Magnitud(%)');
title('Respuesta de la planta a lazo cerrado ante un escalón');
plot(82.5 , 25 , 'ksquare');
plot(372 , 75 , 'ksquare');


%%
%Planta obtenida por el metodo utilizado de identificacion

 Gi = 0.241*(50.4*s+1)*exp(-40*s)/(s*(20.9*s+1));

%Comparacion con el modelo de caja negra

figure;
step(G);
hold on;
step(Gi);
xlim([0 120]);
legend('Modelo de caja negra','Planta identificada');

%Obtencion de la respuesta a lazo cerrado de la planta.
figure;
[y,t] = step(feedback(G,0.06));
plot(t,y*10,'k');
hold on;
[y,t] = step(feedback(Gi,0.06));
plot(t,y*10,'--k');
grid;
xlim([0 420]);
xlabel('tiempo(s)');
ylabel('Magnitud(%)');
legend('Planta real','Planta identificada');
title('Respuesta ante un escalón a lazo cerrado de la planta real e identificada');




T = 1; % tiempo de muestreo
k = 1; % constante de iteracion
tau = 40; % aproximacion inicial del tiempo muerto basada en medicion
e = 0.0001; % porcentaje de error para finalizar las iteraciones
eactual = 2; % error actual en cada iteracion



j = 1;
% while eactual > 0.1
    
    t = 1:1:460;
    THETA = zeros(length(t),4);
    Y = zeros(length(t),1);
    
    for i = t 
        theta = integrate(i+floor(tau)+1,tau,u,y);
        THETA(i,1) = theta(1);
        THETA(i,2) = theta(2);
        THETA(i,3) = theta(3);
        THETA(i,4) = theta(4);
        %THETA(i,5) = theta(5);
        Y(i) = y(i+floor(tau)+1);
    end
    
    cita = THETA'*THETA\THETA'*Y;
% end





