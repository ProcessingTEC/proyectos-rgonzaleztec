//Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "/dev/cu.usbserial-DA011LIZ", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  background(255);
}

void draw() {
  background(255);
  fill(0,0,255);
  ellipse(width/4,height/4,val[0], 100);
  fill(255,0,0);
  ellipse(width/2,height/2,val[1], 100);  
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}