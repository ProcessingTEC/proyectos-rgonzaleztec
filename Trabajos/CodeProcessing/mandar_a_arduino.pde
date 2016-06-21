import processing.serial.*;


Serial port;

void setup()
{
 port = new Serial(this,"/dev/cu.usbserial-DA011LIZ",9600);
 
}

void draw()
{
  int posX = mouseX;
  int posY = mouseY;

  
 port.write(nf(width/2-posX)+","+nf(height/2-posY)+"/n"); 
}