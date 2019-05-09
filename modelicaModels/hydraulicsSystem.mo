model Ejercicio1
// Primero se declaran los parámetros.
  constant Real g( unit = "m/s2") = 9.80;
  parameter Real A1( unit = "m2") = 2 " area tanque 1";
  parameter Real A2( unit = "m2") = 4 " area tanque 2";
  parameter Real densidad( unit = "kg/m3") = 1000 " densidad fluido ";
  parameter Real hoff( unit = "m") = 1 "Altura tanque 2 a la valvula v ";
  parameter Real Rh1 = 560 " constante valvula 1";
  parameter Real Rh2 = 590 " constante valvula 2";
  parameter Real Rhv = 485 " constante valvula v";
  
  
// Luego se definen las variables, compuestas por los estados, salidas y entradas
// se parte del estado cero por lo que se define H1=H2= 0 al iniciar
  Real H1( unit = "m", start = 0, fixed = true ) " nivel 1";
  Real H2( unit = "m", start = 0, fixed = true ) " nivel 2";
  Real qin1( unit = "m3/s") " caudal entrada 1";
  Real qin2( unit = "m3/s") " caudal entrada 2";
  Real q1( unit = "m3/s") " caudal salida de la valvula 1";
  Real q2( unit = "m3/s") " caudal salida de la valvula 2";
  Real qv( unit = "m3/s") " caudal en la valvula v";
  Real poff( unit = "Pa") " presion en el tanque 2 a la altura hoff";


equation    
  //Se define el comportamiento de las entradas
  qin1 = if (time >= 5 and time <= 750) then 0.25 else 0;
  qin2 = if (time >= 750 and time <= 2000) then 0.45 else 0;
  
  //Se establece la suma de caudales para cada uno de los tanques
  der(H1) = (qin1 - q1 - qv)/A1;
  der(H2) = (qin2 - q2 + qv)/A2;
  
  //Se definen los caudales de las valvulas
  q1 = if noEvent (H1 >= 0) then (sqrt (densidad * g * H1))/Rh1 else 0;
  q2 = if noEvent (H2 >= 0) then (sqrt (densidad * g * H2))/Rh2 else 0;
  
  //Se utiliza poff ya que se debe considerar los casos donde H2<Hoff y biseversa
  poff = if noEvent (H2 - hoff >= 0) then densidad*g*(H2-hoff) else 0;
  
  //Con poff se establece el caudal de la valvula entre los tanques, se considera el cambio
  //de signo de qv dependiendo de la presion en los extremos de la válvula 
  qv = if noEvent (densidad*g*H1 - poff >= 0) then (sqrt(densidad*g*H1-poff))/Rhv 
    else -1*(sqrt(-1*(densidad*g*H1-poff)))/Rhv;
    
  //Se define el espacio de tiempo de la simulacion.
  annotation ( experiment ( StartTime = 0, StopTime = 2500 ));  
end Ejercicio1;
