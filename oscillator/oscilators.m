

%%%%%%%%%%%%%%%%%%%%% DEFINICION DE PARAMETROS %%%%%%%%%%%%%%%%%%%%%%%%%%

time=0:0.01:200;  

CI1=[2.3; -1.3; 10]; 
CI2=[-2.3; 1.3; -10];
CI3=[-0.1; -1; -1];

[T,X]=ode45(@OSC1,time,CI1);


[T,Y]=ode45(@OSC1,time,CI2);     
[T,Z]=ode45(@OSC1,time,CI3);    
[T,M]=ode45(@OSC2,time,CI1);          
[T,N]=ode45(@OSC3,time,CI1);

%%%%%%%%%%%%%%%%%%%% OBTENCION DE VALORES FINALES %%%%%%%%%%%%%%%%%%%%%%%%

x= X(:,1);
y= X(:,2);
z= X(:,3);

ValFin=[x(numel(x),1); y(numel(y),1); z(numel(z),1)];

%%%%%%%%%%%%%%%%%%%%% CREACION DE LAS SUPERFICIES %%%%%%%%%%%%%%%%%%%%%%%%

c=1:numel(time);
h = surface([X(:,1), X(:,1)], [X(:,2), X(:,2)], [X(:,3), X(:,3)], [c(:), c(:)], 'EdgeColor','flat', 'FaceColor','none');
view(-18,28);
grid on;
colormap( jet(numel(time)) );
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');

%%%%%%%%%%%%%%%%%%%%%%%% ANALISIS TEMPORAL DE LOS ESTADOS %%%%%%%%%%%%%%%%

plot(T,X(:,1),'r');
hold on;
plot(T,Y(:,1),'b');               
hold on;                                 
plot(T,Z(:,1),'y');                            
hold on;
plot(T,M(:,1),'Color',[0.8,0.4,0.5]);
hold on;
plot(T,N(:,1),'g');
grid on;
xlabel('Tiempo (t)')
ylabel('z(t)')