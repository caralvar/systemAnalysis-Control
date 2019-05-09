%Función que define el sistema de ecuaciones diferenciales establecido
%en el vector columna "edos".

function edos = sistemaEDOS(t,y)
    edos = [y(2); 2*heaviside(t)-2*y(2)-2*y(1)];
end