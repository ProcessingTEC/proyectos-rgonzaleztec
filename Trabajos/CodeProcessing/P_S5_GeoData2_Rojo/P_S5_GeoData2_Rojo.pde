BufferedReader reader;
String line;

int R=1;//6371;//radio de la tierra en km

void setup() {
  // Open the file from the createWriter() example
  reader = createReader("Qdata.txt");  //<>//
  size(600, 600); 
  background(255);
  smooth(8);
}

void draw() {
  frameRate(30);
  //strokeWeight(1);
  //noStroke();
  //fill(0);
  line = getLine(reader);
  if (line == null) {
    // detiene el loop
    noLoop();
  } 
  else {
    //divide la linea en elementos separados por coma
    String[] pieces = split(line, ',');
    float x = float(pieces[0]);
    float y = float(pieces[1]);
    float speed =float(pieces[2]);
    float air= float(pieces[3]);
    //noStroke();
    //fill(231, 248, 154, 200);
    //ellipse(width/2, height/2, speed*2, speed*2);
    //text(pieces[2], width/2, height/2+speed*2);
    //fill(56,88,181, 50);
    //ellipse(width/2, height/2, air*2, air*2);
    //noFill();
    //stroke(255, 200);
    //ellipse(width/2, height/2, 100*2, 100*2);
    //stroke(0,150);
    //strokeWeight(2);
    //point(width-toX(x,y)*width-250,toY(x,y)*height);
   
    println(speed);
    
    if (speed == 0.0) {
      stroke(255,0,0);
      figura(air); //<>//
      figura(air);
      figura(air);
    }
    else{
      stroke(0,0,255);
      figura2(air);
      figura2(air);
      figura2(air);
    }
  }
} 

//geographic to cartessian
float toX(float lat, float lon) {
  float x = R * cos(lat) * cos(lon);
  return x;
}

float toY(float lat, float lon) {
  float y = R * cos(lat) * sin(lon);
  return y;
}

//get each file line
String getLine(BufferedReader r){
  String l;
  try {
   l = r.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    l = null;
  } 
  return l;
}


void figura(float x) {
 //Crea la figura de curva
  int y1 = 50;
  curve( 5+x, 28+y1,  5+x, 28+y1, 73+x, 26+y1, 73+x, 63+y1);
  
  curve( 5+x, 28+y1, 73+x, 26+y1, 73+x, 63+y1, 15+x, 67+y1); 
  
  curve(73+x, 26+y1, 73+x, 63+y1, 15+x, 67+y1, 15+x, 67+y1);
 
}

void figura2(float x) {
 //Crea la figura de curva
 
  curve( 5+x, 28,  5+x, 28, 73+x, 26, 73+x, 63);
  
  curve( 5+x, 28, 73+x, 26, 73+x, 63, 15+x, 67); 
  
  curve(73+x, 26, 73+x, 63, 15+x, 67, 15+x, 67);
 
}

//void draw() {
//  curveDetail(1);
//  drawCurves(-15);
//  stroke(126);
//  curveDetail(2);
//  drawCurves(0);
//  stroke(255);
//  curveDetail(4);
//  drawCurves(15);
//}