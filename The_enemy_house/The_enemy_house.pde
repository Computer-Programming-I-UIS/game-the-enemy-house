Enemy canon;
Explosion explo;
Car space;
PImage fondo; 

void setup () {

  size (1020, 600);
  canon = new Enemy (105, 462, 100, 100);              //cañon
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
  //explo.mostrar();
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
      if (keyCode == DOWN) {
        currentFrames++;
        if (currentFrames > 12) {
          currentFrames=12;
        }
      }
      if (keyCode == UP) {
        currentFrames--;
        if (currentFrames<0) {
          currentFrames=0;
        }
      }
    }
  }


  void display() {          //Cañon

    frameRate(20);
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
    //frameRate(10);
    imageMode(CENTER);
  }

  void move() {
     
    if (irderecha) {
      //frameRate(10);
      image(imagesderecha[imageIndex], x, 460, 200, 200);
      
    } else {
      //frameRate(10);
      image(imagesizquierda[imageIndex], x, 460, 200, 200);
    }
    imageIndex = (imageIndex+1) % imagesderecha.length;
    x = x + vx;
    if (x > 890) {
      vx = -10;
      irderecha = false;
    }
    if (x < 300) {
      vx = 10;
      irderecha = true;
    }
  }
}
