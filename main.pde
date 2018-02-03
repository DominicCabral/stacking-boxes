ArrayList<VanishingCircle> circles = new ArrayList<VanishingCircle>();
boolean clearCircles = true;
int backgroundColor = 0;

void setup(){
  background(backgroundColor);
  size(500,500);
  surface.setResizable(true);
  frameRate(30);  
}

void draw(){
  if(clearCircles){
    background(backgroundColor);
  }
  
  if(mousePressed){
    circles.add(new VanishingCircle(int(random(75,100)),100, mouseX, mouseY));
  }
  
  for (VanishingCircle circle: circles) {
      circle.update();
  }
}