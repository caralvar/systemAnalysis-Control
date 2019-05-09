A = [-4 -1 0 3 -2 0;             % Se definen las 4 matrices del MVE como   
     -1 -2 1 0 4 3;              % variables A,B,C,D
     3 0 -3 2 -1 2;
     -3 0 -4 -2 1 -1;
     1 -5 0 -2 -1 -2;
     -1 -3 -3 0 1 -1];
 
 B = [-2; -1; -3; 0; 8; 3];
 
 C = [-1 -1 1 -1 0 1];
 
 D = [-1];
 
 
 G = ss(A,B,C,D);       % Se define el espacio de estados en la variable G
 
 
[P,Z] = pzmap(G);      % Se crea un vector de ceros y uno de polos
%disp(P);               % Se imprimen los polos en la ventana de comandos
%disp(Z);               % Se imprimen los ceros en la ventana de comandos

 
 h = pzoptions('cstprefs');
 h.Grid = 'on';              
 h.Title.Color='b';
% n = pzplot(G,h);              % Se dibujan los polos y ceros en el plano complejo
 
 
 CondIn = [1; 3; 0; -4; -1; -2];        % Vector de condiciones iniciales
 
 B0 = [0; 0; 0; 0; 0; 0];               % Matrices de entrada igual a cero
 D0 = [0];
 
 G1 = ss(A,B0,C,D0);                    % Sistema con con entradas cero
 
 [X,T] = initial(G1,CondIn);            
 plot(T,X);                                  % Se grafica la respuesta a entrada cero
 title('Respuesta de G a entrada cero');     % con las condiciones iniciales
 xlabel('Tiempo [s]');                       % especificadas
 ylabel('Amplitud');                    
 grid on;
 

 %[Y,T] = impulse(G);            
 %plot(T,Y);                         % Se grafica la respuesta al impulso
 %title('Respuesta de G al impulso \delta(t)');
 %xlabel('Tiempo [s]');                       
 %ylabel('Amplitud');                    
 %grid on;
 
                                        
 %[Z,T] = step(G);            
 %plot(T,Z);
 %title('Respuesta de G al escalón \mu(t)');
 %xlabel('Tiempo [s]');                       
 %ylabel('Amplitud');                    
 %grid on;

 
 
[U,T] = gensig('square',25,75,0.01);          % Se define una entrada de forma cuadrada 
                                         % desde 0s hasta 75s, con periodo T=25s

[M,T]=lsim(G,U,T);                       % Mediante este comando, se obtienen los puntos 
                                         % referentes a la onda de entrada en el sistema G

plot(T,M,'r');                           % Se obtiene la grafica correspondiente 
title('Respuesta de G ante una entrada de onda cuadrada');
xlabel('Tiempo [s]');                       
ylabel('Amplitud');                    
grid on;
hold on;
plot(T,U,'b');                           % Se grafica la senal de entrada



H = tf(G);

