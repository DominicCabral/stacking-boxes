ArrayList<VanishingBoxes> boxes = new ArrayList<VanishingBoxes>();
boolean clearboxes = false;
int backgroundColor = 0;

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
  
  if(mousePressed){
    boxes.add(new VanishingBoxes(int(random(25,100)),100, mouseX, mouseY));
  }

  if(keyPressed){
    save("main.jpg");
  }
  
  for (VanishingBoxes box: boxes) {
      box.update();
  }
}