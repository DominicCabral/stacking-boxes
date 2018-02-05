import java.util.Random;

class VanishingBoxes {
  int minOpacity;
  float r,g,b, size, opacity, xPoint, yPoint, zPoint, iterations;
  boolean completed, spinRight;
  VanishingBoxes(int s, int o, int x, int y){
   opacity = o;

   // the box was drawn at (0, 0, 0), store that location
   xPoint = modelX(x, y, 0);
   yPoint = modelY(x, y, 0);
   zPoint = modelZ(x, y, 0);
   size = s;
   r = random(255);
   g = random(255);
   b = random(255);
   minOpacity = 1;
   completed = false;
   spinRight = getRandomBoolean();
   iterations = 0;

  }
  
  public void update(){
    if(!completed){

      if(opacity > minOpacity){
        float shakeRange = globalShakeRange;
        opacity = opacity - opacity/100.0;
        xPoint = xPoint + int(random(-shakeRange,shakeRange));
        yPoint = yPoint + int(random(-shakeRange,shakeRange));
        zPoint = zPoint - size*.5;

         //lower color
         r = r - r/100;
         g = g - g/100;
         b = b - b/100;

         createBox();
      }else{
        completed = true;
      }
    }
  }
  
  private void createBox(){

      // draw another box at the same (x, y, z) coordinate as the other
      pushMatrix();
      
      if(spinRight){
        iterations++;
      }else{
        iterations--;
      }


      // stroke(b,g,r,opacity);
      // stroke(255,255,255,opacity);
      fill(r,0,b,opacity);
      noStroke();
      translate(xPoint, yPoint, zPoint);
      rotateX(iterations*PI/60.0);
      rotateY(iterations*PI/120.0);
      rotateZ(iterations*PI/180.0);
      box(size);

      // clear out all the transformations
      popMatrix();

  }

  private boolean getRandomBoolean() {
    Random random = new Random();
    return random.nextBoolean();
  }
}