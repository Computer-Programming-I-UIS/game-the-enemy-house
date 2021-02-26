import processing.sound.*;

Box fuerza;
Enemy canon;
//Explosion explo;
Car space;
Bala balin;
PImage fondo, fondo2; 
PImage canonmenu, canonplay, balas, carrotutorial, canondisparo, barrapotencia, fuego;
PImage fondomenu, fondomenu1, fondomenu2, fondomenu3;
PFont letra, letra2;
float[] k = new float[4]; 
String advert = " ";
int menu = 0, menu2 = 0, modo=0; 
SoundFile menusong, gameplaysong;
float   yep = 0;         
float   rx, ry, fza= 35;
PVector cvel;
float   grilla[][] = new float[1250] [1250]; //Grilla que representa el hitbox
float   a = 10, l = 10;


void setup () {

  size (1200, 600);
  canon = new Enemy (75, 460, 100, 100);              //cañon
  fuerza = new Box();
  //explo = new Explosion();
  space = new Car();
  balin = new Bala();
  fondo = loadImage("fondo22.png");
  image(fondo, 0, 0);   
  fondo.resize(width, height);
  fondo2 = loadImage("fondo2.png");
  image(fondo2, 0, 0);
  fondo2.resize(width, height);
  letra = createFont("NAPAV___.ttf", 55);           //Fuente 
  letra2 = createFont("XXII_DIRTY-ARMY.ttf", 50);   //Fuente2 
  menusong = new SoundFile(this, "menusong.wav");
  gameplaysong = new SoundFile(this, "gameplaysong.wav");
}

/*________________________________________________________________________________*/

void draw() {

  switch(menu) {

  case 1:

    if (!gameplaysong.isPlaying()) {
      gameplaysong.play(1);
      gameplaysong.amp(0.5);
    }
    if (menusong.isPlaying()) {
      menusong.stop();
    }

    menu2 = menu;
    background(fondo2);
    canon.move();
    canon.display(); //Cañon
    balin.show();
    //explo.mostrar();
    space.move();
    fuerza.see();
    fuerza.start(50, 530);
    if ( (balin.x+balin.rPelota) >= (space.x-space.anchoMedios) && (balin.x-balin.rPelota) <= (space.x+space.anchoMedios) && (balin.y+balin.rPelota) >= (space.y - space.alturaMedios) &&  (balin.y-balin.rPelota) <= (space.y + space.alturaMedios) ) {

      space.vivo = false;
    }

    break;


  case 0:


  case -1:
    menu2 = 0;
    background(fondo);

    if (!menusong.isPlaying()) {
      menusong.play();
      menusong.amp(0.5);
    }
    if (gameplaysong.isPlaying()) {
      gameplaysong.stop();
    }

    k = menu (k[0], k[1]); //Función menú
    break;

  case -2:
    menu = salir();  
    break;

  case -3:
    exit();
    break;
  }
}

/*____________________________________________________________________________*/

void keyPressed() {

  if (key == ENTER && menu == 0) {
    menu = 1;
  }
  if (menu != 1 ) {
    if (key == 'c'|| key == 'C' && menu==0 && modo == 0) {
      modo = 1;
      menu = -1;
    }
  }

  if (menu != 1) {
    if (key == 't' || key == 'T' && menu == 0 && modo == 0) {
      modo = 2;
      menu = -1;
    }
  }

  if (key == ESC) {
    key = 0;   
    menu = -2; 
    if (menu2 == 0)
      advert = "SALIR DEL JUEGO?";
    else if (menu2 == 1) 
      advert = "SALIR AL MENU PRINCIPAL?";
    text("culeo", 150, 150);
  }
}

/*____________________________________________________________________________*/

//void mousePressed() {
//  if ( menu == 1){
//  fuerza.start(40, 530);
//}
//}
/*______________________________________________________________________________*/

void mouseReleased() {
  if (menu==1) {
    balin.start(155, 400);
    //explo.start(155, 450);
  }
}

/*______________________________________________________________________________*/

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






/*_______________________________________________________________________________*/


class Car {

  int maxImages = 2;
  int imageIndex = 0;
  int x = 1100, y = 490;
  int vx = 15;
  boolean irderecha = false;
  boolean vivo = true;
  int anchoMedios, alturaMedios;

  PImage  imagesderecha; 
  PImage  imagesizquierda;

  Car(){
    
      imagesderecha = loadImage("frame_0.png");
      imagesizquierda = loadImage("Prame_0.png");
    
    //frameRate(10);
    //anchoMedios = imagesderecha[0].width/2;
    //alturaMedios = imagesderecha[0].height/2;
    anchoMedios = 100;
    alturaMedios = 100;
    imageMode(CENTER);
  }

  void move() {
    if (vivo) {
      if (irderecha) {
        //frameRate(10);
        image(imagesderecha, x, y, 200, 150);
      } else {
        //frameRate(10);
        image(imagesizquierda, x, y, 200, 150);
      }
     // imageIndex = (imageIndex+1) % imagesderecha.length;
      x = x + vx;
      if (x > 1100) {
        vx = -8;
        irderecha = true;
      }
      if (x < 400) {
        vx = 8;
        irderecha = false;
      }
    }
  }
}
