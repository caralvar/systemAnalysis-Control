A = randi(10,10,10);              % Este comando proporciona una matriz 10x10 con numeros 
                                  % enteros en el intervalo [0,10]
                                  
[VecProp,V] = eig(A);             % Se crean dos matrices del mismo orden de A; una contiene
                                  % los vectores propios respectivos y la
                                  % otra, sus valores propios

ValProp = eig(A);                 % Se crea un vector con los respectivos valores propios de 
                                  % la matriz A

B = randi(10,10,3);               % Se crea una matriz 10x3 con numeros enteros aleatorios 
                                  % entre 0 y 10

C = A*B;                          % Esta matriz es la multiplicación de A*B


Z = size(C);                      % Se crea vector 1x2 que contiene en cada entrada las 
                                  % dimensiones de la matriz C 

                                  
M = max(C);                       % Este comando guarda en un vector fila, los valores maximos
                                  % de cada columna de la matriz C
                                  
M = [M(1);M(2);M(3)];             % Se guarda en un vector columna cada valor maximo obtenido
MaxC = max(M);                    % para emplear el comando "max" nuevamente y obtener el valor 
                                  % maximo absoluto de la matriz C

m = min(C);                       % Este comando guarda en un vector fila, los valores minimos
                                  % de cada columna de la matriz C 

m = [m(1);m(2);m(3)];             % El minimo absoluto de la matriz, se obtiene analogamente 
MinC = min(m);                    % al procedimiento para el maximo absoluto



x = A(5,2)*B(9,3)*C(5,3);         % Se toman diversas entradas de las tres matrices generadas
                                  % para obtener una operacion escalar


concavec = cat(2,A(3,:),B(6,:));  % Se unen dos vectores fila en un nuevo vector fila 