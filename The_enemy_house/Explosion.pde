class Explosion {

  float xpos, ypos;
  PImage frames[];
  int frameNumber = 0;
  int frameNumberAdd=1;
  int ancho = 80, largo = 80;
  int countBeforNextFrame=0;
  int speedOfAnimation = 0;

  boolean exist=false;

  Explosion( int anchoX, int largoY) {

    PImage spritesheet = loadImage("explosion.png");
    
    ancho = anchoX;
    largo = largoY;
    frames = new PImage[5*5];
    for (int y=0; y < 5; y++) {
      for (int x=0; x < 5; x++) {
        frames[y*5+x] = spritesheet.get(x*64, y*64, 64, 64);
      }
    }
  }

  void start(float x_, float y_) {
    if (!exist) {
      exist=true;

      countBeforNextFrame = 0;
      frameNumber=0; 
      xpos= x_;
      ypos= y_;
    }
  }

  void mostrar() {
    if (exist) {
      image(frames[frameNumber], xpos-32, ypos-32, ancho, largo);

      countBeforNextFrame++; 
      if (countBeforNextFrame > speedOfAnimation) {
        countBeforNextFrame = 0;     
        frameNumber += frameNumberAdd;        
        if (frameNumber >= 25) {
          exist = false;
        }
      }
    }
  }

  
}
