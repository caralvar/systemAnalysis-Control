//Primer Modelo circuito RLC con Switch
model ejercicio1_1
  //Se importa la libreria del Sistema internacional
  import SI = Modelica.SIunits;
  //Parametros del sistema
  parameter SI.Resistance R = 4000.0;
  parameter SI.Capacitance C = 0.000075;
  parameter SI.Inductance L = 0.002;
  //Declaracion de la tension de entrada
  SI.Voltage Vin "fuente";
  //Se definen los valores iniciales de la corriente del circuito
  //y la tension del capacitor
  SI.Voltage Vc(start = 0, fixed = true) " tension capacitor ";
  SI.Current I(start = 0, fixed = true) " corriente inductor ";
  //Se establecen las ecuaciones que definen el modelo
  equation
    //Establecimiento de los valores de la tension de entrada
    Vin = if time >= 5.0 then 10.0 else 0.0;
    //Ecuacion del capacitor
    C * der(Vc) = I;
    //LTK y ecuacion del inductor
    L * der(I) = Vin - R * I - Vc;
  //Se establece el tiempo de simulacion del sistema.
annotation( experiment(StartTime = 0.0, StopTime = 25.0));
end ejercicio1_1;
