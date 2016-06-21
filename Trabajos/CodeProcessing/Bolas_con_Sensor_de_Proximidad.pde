/*Tomas de Camino
 */

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];
 
int nBolas =30;
float [][] bolas = new float[nBolas][2];
 
void setup() {
  size(600, 600);
  noCursor();
  smooth();
  colorMode(HSB, 255, 255, 255);
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=random(width);
    bolas[i][1]=random(width);
  }
  port = new Serial(this, "/dev/cu.usbserial-DA011LIZ", 9600);
  port.bufferUntil('\n');  //clear the buffer
}
 
void draw() {
  noStroke();
  background(255);
  fill(116, 255, 255);
  ellipse(val[0], val[1], 20, 20);//dibuja la elipse del mouse
  fill(100, 200, 255, 100);
  for (int i=0;i<nBolas;i++) {
    float distancia = sqrt(sq(val[0]-bolas[i][0])+sq(val[1]-bolas[i][1]));
    noStroke();
    ellipse(bolas[i][0], bolas[i][1], 60, 60);
    if(distancia<200){
     //calcula la nueva posicion de la bola
     strokeWeight(2);
     stroke(131,200,255,100);
     line(val[0],val[1],bolas[i][0],bolas[i][1]);
     bolas[i][0]+=(val[0]-bolas[i][0])/(i*50);
     bolas[i][1]+=(val[1]-bolas[i][1])/(i*50);
    }
  }
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}