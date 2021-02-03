PImage P;

void setup(){
 size(1000, 600);
 P = loadImage("fondo.jpg");
 P.resize(1000,600);
}

void draw(){
  image(P, 0, 0); 
}
