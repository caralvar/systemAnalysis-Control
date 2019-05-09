%Se definen las matrices A,B,C,D del sistema.
A1 = [0 0 -10; 1 0 -17; 0 1 -8];
B1 = [5;-2;0];
C1 = [0 0 1];

A2 = [0 1 0;0 0 1;-10 -17 -8];
B2 = [0;0;1];
C2 = [5 -2 0];

A3 = [-1 0 0; 0 -2 0; 0 0 -5];
B3 = [1;1;1];
C3 = [7/4 -3 5/4];

%Se definen los sistemas y se obtiene la respuesta al escalon
sistemaSalidaIntegradores = ss(A1,B1,C1,0);
[y1,t1] = step(sistemaSalidaIntegradores);

sistemaVariablesFase = ss(A2,B2,C2,0);
[y2,t2] = step(sistemaVariablesFase);

sistemaVariablesJordan = ss(A3,B3,C3,0);
[y3,t3] = step(sistemaVariablesJordan);

%Se grafican las salidas obtenidas.
figure;
plot(t1,y1);
grid;
title('Respuesta a escalón (Salida de Integradores)');
xlabel('Tiempo');
ylabel('Valor de la salida');
legend('y(t)')

figure;
plot(t2,y2);
grid;
title('Respuesta a escalón (Variables de fase)');
xlabel('Tiempo');
ylabel('Valor de la salida');
legend('y(t)');

figure;
plot(t3,y3);
grid;
title('Respuesta a escalón (Variables de Jordan)');
xlabel('Tiempo');
ylabel('Valor de la salida');
legend('y(t)');
