Enemy canon;
Explosion explo;
<<<<<<< HEAD
Car space;
PImage fondo; 

void setup () {

  size (1000, 600);
  canon = new Enemy (65, 400, 120, 120);              //cañon
  explo = new Explosion();
  space = new Car();
  fondo = loadImage("fondo.jpg");
  image(fondo, 0, 0);   
  fondo.resize(width, height);
}

void draw() {

  background(fondo);
  canon.move();
  canon.display(); //Cañon
  explo.mostrar();
  space.move();
}


//Clase

class Enemy {

  //Atributos
  //Fondo
  float x, y, ancho, largo;            //Posicion y tamaño
  PImage[] images = new PImage[13];    // Arreglo
  int currentFrames;                    //Frames



  //Constructor
  Enemy ( float posX, float posY, float anchoini, float largoini ) {
    x = posX;
    y = posY; 
    ancho = anchoini;
    largo = largoini;
    currentFrames = 0;

    for (int i = 0; i < images.length; i++) {
      String imageName = "frame-" + nf(i, 4) + ".png";
      images[i] = loadImage(imageName); // Cargar cada imagen
    }
  }



  //Metodos
  void move() {

    if (keyPressed) {
      if (keyCode == RIGHT) {
        currentFrames++;
        if (currentFrames > 12) {
          currentFrames=12;
        }
      }
      if (keyCode == LEFT) {
        currentFrames--;
        if (currentFrames<0) {
          currentFrames=0;
        }
      }
    }
  }


  void display() {          //Cañon
    //frameRate(20);
    image(images[currentFrames], x, y, ancho, largo);
  }
}

class Car {

  int maxImages = 2;
  int imageIndex = 0;
  int x = 890;
  int vx = 15;
  boolean irderecha = false;

  PImage [] imagesderecha = new PImage[maxImages];
  PImage [] imagesizquierda = new PImage[maxImages];

  {
    for (int i = 0; i < imagesderecha.length; i++) {
      imagesderecha[i] = loadImage("Prame_" + i + ".png");
      imagesizquierda[i] = loadImage("frame_" + i + ".png");
    }
    frameRate(10);
    imageMode(CENTER);
  }
  void move() {
    if (irderecha) {
      image(imagesderecha[imageIndex], x, 460);
    } else {
      image(imagesizquierda[imageIndex], x, 460);
    }
    imageIndex = (imageIndex+1) % imagesderecha.length;
    x = x + vx;
    if (x > 890) {
      vx = -15;
      irderecha = false;
    }
    if (x < 300) {
      vx = 15;
      irderecha = true;
    }
  }
=======

void setup (){
 
  size (1000, 600);
  
  canon = new Enemy (65, 400, 120, 120);              //cañon
  explo = new Explosion();
  
}

void draw(){
  
  canon.fondo();   //Fondo
  canon.move();
  canon.display(); //Cañon
  explo.mostrar();
>>>>>>> e38ec81ce4abf92bb94bc07c92b11644ad1aca70
}


//Clase

class Enemy{
  
  //Atributos
       PImage fondo;                        //Fondo
       float x, y, ancho, largo;            //Posicion y tamaño
       PImage[] images = new PImage[13];    // Arreglo
       int currentFrames;                    //Frames


  
//Constructor
  Enemy ( float posX, float posY, float anchoini, float largoini ){
    x = posX;
    y = posY; 
    ancho = anchoini;
    largo = largoini;
    currentFrames = 0;
    
   for (int i = 0; i < images.length; i++) {
       String imageName = "frame-" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName); // Cargar cada imagen
         }
  }



//Metodos

void fondo(){                          //Fondo
  
  fondo = loadImage("fondo.jpg");
  image (fondo, 0, 0, width, height);   
}



void move(){
  
   if(keyPressed){
     if(keyCode == RIGHT){
       currentFrames++;
       if(currentFrames > 12){
         currentFrames=12;
       }
     }
     if(keyCode == LEFT){
       currentFrames--;
       if(currentFrames<0){
       currentFrames=0;
     }
   }
   }
}


void display(){          //Cañon
  //frameRate(20);
  image(images[currentFrames], x, y, ancho, largo);
}
}



  
  
  
  
  
  
  
  
