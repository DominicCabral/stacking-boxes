ArrayList<VanishingBoxes> boxes = new ArrayList<VanishingBoxes>();
import themidibus.*;
boolean clearboxes = false;
int backgroundColor = 255;
static final int MAX_BOX_SIZE = 100;
int incrX = (int)(width/4);
int incrY = (int)(height/4);
int x = 0;
int y = height/2;
int dx = incrX;
int dy = incrY;
float globalShakeRange, globalSinHeight = 1;

void setup(){
  background(backgroundColor);
  pixelDensity(2);
  size(1000, 1000, P3D);
  surface.setResizable(true);
  frameRate(30);  
}

void draw(){
  lights();

  if(clearboxes){
    background(backgroundColor);
  }


  x = x + dx;
  y = y + dy;

  if(x > width){
    dx = -incrX;
  }
  if(x < 0){
    dx = incrX;
  }
  if(y > height){
    dy = -incrY;
  }
  if(y < 0){
    dy = incrY;
  }
  
  boxes.add(new VanishingBoxes(int(random(25,MAX_BOX_SIZE)),100, x, y));

  if(keyPressed){
    if(key == 'a' || key == 'A'){
     globalShakeRange = int(globalShakeRange * sin(frameCount))+(MAX_BOX_SIZE/2);
    }
    if(key == 'p' || key == 'p'){
    saveFrame("red.jpg");
    }
  }
  globalShakeRange = globalShakeRange - globalShakeRange/2.0;

  
  for (VanishingBoxes box: boxes) {
      box.update();
  }
}