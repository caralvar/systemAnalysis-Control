%%%%%%%%%%%%%%% TAREA 4 ANÁLISIS DE SITEMAS%%%%%%%%%%%
%Declaración de la función de transferencia de la segunda salida
%en respuesta a la segunda entrada.(G22)
H = tf([1 2],[1 2 2]);
%Obtención de la respuesta al escalón de H.
[y1 t1] = step(H,[0:0.0461:7]);
%Gráfica de la respuesta.
figure;
plot(t1,y1);
grid;
title('Respuesta al escalón de la segunda salida a la segunda entrada.');
xlabel('Tiempo');
ylabel('Valor de la salida');
legend('y_{2}(t) en respuesta a u_{2}(t) (\mu(t))');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Declaración de la matriz de transferencia completa con el comando tf()
%Se declaran los numeradores de las entradas de la matriz.
N = {-1,[1 1 0];1,[1 2]};
%Se declaran los denominadores de las entradas de la matriz.
D = {[1 2 2],[1 2 2];[1 2 2],[1 2 2]};
%Se declara la matriz de transferencia a partir de N y D.
G = tf(N,D); 
%Se obtiene la respuesta al escalón del sistema definido por G.
[y2 t2] = step(G,[0:0.0461:7]);
%Se grafica la respuesta obtenida.
figure;
%Se grafica la suma de la respuesta a las dos entradas.
plot(t2,y2(:,2,1)+y2(:,2,2));
hold on;
plot(t2,y2(:,1,1)+y2(:,1,2));
legend('y_{2}(t) en respuesta a las entradas (\mu(t))', ...
    'y_{1}(t) en respuesta a las entradas (\mu(t))');
grid;
title(['Respuesta al escalón a ambas entradas del sistema.'...
    '\newline Definiendo la matriz de transferencia']);
xlabel('Tiempo');
ylabel('Valor de la salida');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definición de las matrices del modelo en variables de estado.
A = [-1 -1;1 -1];
B = [1 1;0 1];
C = [0 -1;0 1];
D = [0 1;0 0];
%Declaración del sistema.
SYS = ss(A,B,C,D);
%Obtención de la matriz de transferencia a partir del MVE
%utilizando el comando tf().
FT = tf(SYS);
%Obtención de la respuesta al impulso del sistema definido a partir de la
%matriz de transferencia FT.
[y3 t3] = step(FT,[0:0.0461:7]);
%Gráfica de la respuesta al impulso.
figure;
%Se grafica la suma de la respuesta a las dos entradas.
plot(t3,y3(:,2,1)+y3(:,2,2));
hold on;
plot(t3,y3(:,1,1)+y3(:,1,2));
legend('y_{2}(t) en respuesta a las entradas (\mu(t))', ...
    'y_{1}(t) en respuesta a las entradas (\mu(t))');
grid;
title(['Respuesta al escalón a ambas entradas del sistema.'...
    '\newline Obteniendo la matriz de transferencia a partir del MVE.']);
xlabel('Tiempo');
ylabel('Valor de la salida');
