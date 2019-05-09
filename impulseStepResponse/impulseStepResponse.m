%Se definen las matrices A,B,C,D del sistema.
A1 = [0 0 -10; 1 0 -17; 0 1 -8];
B1 = [5;-2;0];
C1 = [0 0 2];

A2 = [0 1 0; 0 0 1; -4 -5 -2];
B2 = [0;0;1];
C2 = [5 -2 0];

A2 = [-1 0 0; 0 -2 0; 0 0 -5];
B2 = [1;1;1];
C2 = [7/4 -3 5/4];

%Se definen los sistemas y se obtiene la respuesta al escalon
sistemaSalidaIntegradores = ss(A1,B1,C1,0);
[y1,t1] = step(sistemaSalidaIntegradores);

sistemaVariablesFase = ss(A2,B2,C2,0);
[y2,t2] = step(sistemaVariablesFase);

sistemaVariablesJordan = ss(A3,B3,C3,0);
[y3,t3] = step(sistemaVariablesJordan);

%Se grafican las salidas obtenidas.
figure;
plot(t0,y0);
xlim([0 4]);
grid;
title('Respuesta a escalón \mu(t)');
xlabel('Tiempo');
ylabel('Valor de las salidas');
legend('y_{1}(t)','y_{2}(t)');

figure;
plot(t1,y1);
grid;
xlim([0 3.6]);
title('Respuesta a entrada 0 con estados iniciales [1;0;-1]');
xlabel('Tiempo');
ylabel('Valor de las salidas');
legend('y_{1}(t)','y_{2}(t)');

figure;
plot(t2,y2);
xlim([0 3.6]);
grid;
title('Respuesta a impulso \delta(t)');
xlabel('Tiempo');
ylabel('Valor de las salidas');
legend('y_{1}(t)','y_{2}(t)');

