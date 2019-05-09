function dX=OSC1(t,X)
a=10;
b=4.5;
c=10;

    dX = zeros(3,1);   
    
    dX(1) = a*(b*X(2)-X(1));  
    
    dX(2) = c*X(1) - X(1)*X(3);  
    
    dX(3) = X(1)*X(2) - b*X(3);
end