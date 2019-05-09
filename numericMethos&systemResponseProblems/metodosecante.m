%Funcion que realiza las iteraciones para obtener una solucion a la
%ecuacion de la forma f(x)=0 por el metodo de la secante. Se reciben dos
%valores iniciales, f(x), y el error maximo (resolucion) deseado para la
%solucion
function solucion = metodosecante(xInicial,xInicialAnterior,f,resolucion)
    errorAceptado = 0; %variable que controla el while
    while(errorAceptado == 0)
        %Se aplica la formula establecida en el metodo de la secante
        xSiguiente = xInicial - (f(xInicial)*(xInicialAnterior-xInicial))/(f(xInicialAnterior)-f(xInicial));
        %Se obtiene el error del valor obtenido
        error = (abs(xInicial-xSiguiente)/xSiguiente)*100;
        %Se establecen los siguientes valores iniciales
        xInicialAnterior = xInicial;
        xInicial = xSiguiente;
        %Si el error es menor que la solucion se sale del while.
        if (error<resolucion)
            errorAceptado = 1;
        end
    end
    %Se establece el ultimo valor obtenido como la solucion
    solucion = xSiguiente;
end