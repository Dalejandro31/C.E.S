//librerias que permiten la coneccción entre el entorno de Java con el entorno  de arduino

import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

/// se especifica por medio  de una variable entera al numero  de caracters que pose la pantalla lcd de 16 x 2 seguidamente de declarar el puerto al  que se debe conectar 
//con el arduino. 

	 	int caracteres = 32;
    private OutputStream Output = null;
    SerialPort serialPort;
    private final String PORT_NAME = "COM4";
    private static final int TIME_OUT = 2000;
    private static final int DATA_RATE = 9600;
    
// se crea la instancia para generar la conccion con  el entorno de arduino
	CommPortIdentifier portId = null;
        Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();

        while (portEnum.hasMoreElements()) {
            CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();

            if (PORT_NAME.equals(currPortId.getName())) {
                portId = currPortId;
                break;
            }
        }

        if (portId == null) {

            System.exit(ERROR);
            return;
        }

        try {

            serialPort = (SerialPort) portId.open(this.getClass().getName(), TIME_OUT);

            serialPort.setSerialPortParams(DATA_RATE,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);

            Output = serialPort.getOutputStream();

        } catch (Exception e) {

            System.exit(ERROR);
        }

    }
    
    // luego creamos la instancia para enviar los datos al 
    
    	try {
            Output.write(data.getBytes());

        } catch (IOException e) {

            System.exit(ERROR);
        }
    }
    
//Luego declaramos los botones con los cuales la persona va a enviar la palabara traducida de el  lenguaje de señas al  lenguaje convencional

		 EnviarDatos(jTextField1.getText());
        jTextField1.setText("hola"); 
        
//este metodo nos permite conocer el limite de letras disponibles en nuestro dsipositivo el indica que no puede ser superior a 32

	caracteres = 32 - jTextField1.getText().length();        
        if(caracteres <= 0){
            jLabel1.setText("numero de letras disponibles = 0"); 
            String cadena = "";
            cadena = jTextField1.getText();
            cadena= cadena.substring(0, 32);
            jTextField1.setText(cadena);
        }else{
            
        } jLabel1.setText("letras disponibles en la pantalla " + (caracteres));
    }
    
    ////              //////
    ////     /////
    ////              /////


// Ahora vamos a explicar nuestro codigo en el entorno de programacion en arduino 

///esta es la libreria qu usamos para poder hacer uso  de la pantalla lcd de 16 x 2
	
  #include <LiquidCrystal.h>
// luego declaramos los pines que se van a usar en el circuito
	LiquidCrystal lcd  (7,6,5,4,3,2);
 
 // no hay que olvidar que debemos declarar el mismo puerto serial en ambos ambientes de programacion 
 	Serial.begin(9600);
 
 //luego declaramos lenguaje ascii el cual nos permite imprimir caracteres en nuestra pantalla 
 
 	while (Serial.available()>0){
Mensaje=Mensaje+Decimal_to_ASCII(Serial.read());
cuenta++;

//En este ultimo paso se declaran los caracteres para dar su salida en pantalla 

char Decimal_to_ASCII(int entrada){
  char salida=' ';
  switch(entrada){
case 32: 
salida=' '; 
break; 
case 33: 
salida='!'; 
break; 
case 34: 
salida='"'; 
break; 
case 35: 
salida='#'; 
break; 
case 36: 
salida='$'; 
break; 
case 37: 
salida='%'; 
break; 
case 38: 
salida='&'; 
break; 
case 39: 
salida=' '; 
break; 
case 40: 
salida='('; 
break; 
case 41: 
salida=')'; 
break; 
case 42: 
salida='*'; 
break; 
case 43: 
salida='+'; 
break; 
case 44: 
salida=','; 
break; 
case 45: 
salida='-'; 
break; 
case 46: 
salida='.'; 
break; 
case 47: 
salida='/'; 
break; 
case 48: 
salida='0'; 
break; 
case 49: 
salida='1'; 
break; 
case 50: 
salida='2'; 
break; 
case 51: 
salida='3'; 
break; 
case 52: 
salida='4'; 
break; 
case 53: 
salida='5'; 
break; 
case 54: 
salida='6'; 
break; 
case 55: 
salida='7'; 
break; 
case 56: 
salida='8'; 
break; 
case 57: 
salida='9'; 
break; 
case 58: 
salida=':'; 
break; 
case 59: 
salida=';'; 
break; 
case 60: 
salida='<'; 
break; 
case 61: 
salida='='; 
break; 
case 62: 
salida='>'; 
break; 
case 63: 
salida='?'; 
break; 
case 64: 
salida='@'; 
break; 
case 65: 
salida='A'; 
break; 
case 66: 
salida='B'; 
break; 
case 67: 
salida='C'; 
break; 
case 68: 
salida='D'; 
break; 
case 69: 
salida='E'; 
break; 
case 70: 
salida='F'; 
break; 
case 71: 
salida='G'; 
break; 
case 72: 
salida='H'; 
break; 
case 73: 
salida='I'; 
break; 
case 74: 
salida='J'; 
break; 
case 75: 
salida='K'; 
break; 
case 76: 
salida='L'; 
break; 
case 77: 
salida='M'; 
break; 
case 78: 
salida='N'; 
break; 
case 79: 
salida='O'; 
break; 
case 80: 
salida='P'; 
break; 
case 81: 
salida='Q'; 
break; 
case 82: 
salida='R'; 
break; 
case 83: 
salida='S'; 
break; 
case 84: 
salida='T'; 
break; 
case 85: 
salida='U'; 
break; 
case 86: 
salida='V'; 
break; 
case 87: 
salida='W'; 
break; 
case 88: 
salida='X'; 
break; 
case 89: 
salida='Y'; 
break; 
case 90: 
salida='Z'; 
break; 
case 91: 
salida='['; 
break; 
case 92: 
salida=' '; 
break; 
case 93: 
salida=']'; 
break; 
case 94: 
salida='^'; 
break; 
case 95: 
salida='_'; 
break; 
case 96: 
salida='`'; 
break; 
case 97: 
salida='a'; 
break; 
case 98: 
salida='b'; 
break; 
case 99: 
salida='c'; 
break; 
case 100: 
salida='d'; 
break; 
case 101: 
salida='e'; 
break; 
case 102: 
salida='f'; 
break; 
case 103: 
salida='g'; 
break; 
case 104: 
salida='h'; 
break; 
case 105: 
salida='i'; 
break; 
case 106: 
salida='j'; 
break; 
case 107: 
salida='k'; 
break; 
case 108: 
salida='l'; 
break; 
case 109: 
salida='m'; 
break; 
case 110: 
salida='n'; 
break; 
case 111: 
salida='o'; 
break; 
case 112: 
salida='p'; 
break; 
case 113: 
salida='q'; 
break; 
case 114: 
salida='r'; 
break; 
case 115: 
salida='s'; 
break; 
case 116: 
salida='t'; 
break; 
case 117: 
salida='u'; 
break; 
case 118: 
salida='v'; 
break; 
case 119: 
salida='w'; 
break; 
case 120: 
salida='x'; 
break; 
case 121: 
salida='y'; 
break; 
case 122: 
salida='z'; 
break; 
case 123: 
salida='{'; 
break; 
case 124: 
salida='|'; 
break; 
case 125: 
salida='}'; 
break; 
case 126: 
salida='~'; 
break; 



 	
  
	

    
