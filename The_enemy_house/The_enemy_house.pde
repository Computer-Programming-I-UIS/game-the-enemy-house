Enemy canon;
Explosion explo;
Car space;
Bala balin;
PImage fondo; 
PImage canonmenu;
PImage fondomenu, fondomenu1, fondomenu2, fondomenu3;
PFont letra, letra2;
float[] k = new float[4]; 
String advert = " ";
int menu = 0, menu2 = 0; 

void setup () {

  size (1200, 600);
  canon = new Enemy (75, 460, 100, 100);              //cañon
  explo = new Explosion();
  space = new Car();
  balin = new Bala();
  fondo = loadImage("fondo2.png");
  image(fondo, 0, 0);   
  fondo.resize(width, height);
  
  letra = createFont("NAPAV___.ttf", 55);           //Fuente 
  letra2 = createFont("XXII_DIRTY-ARMY.ttf", 50);   //Fuente2 
  
}

/*________________________________________________________________________________*/

void draw() {
  
  switch(menu){
    
  case 1:
  
  menu2 = menu;
 
  background(fondo);
  canon.move();
  canon.display(); //Cañon
  balin.show();
  explo.mostrar();
  space.move();
  break;
  
  
  case 0:
 
  
  case -1:
  menu2 = 0;
  background(fondo);
  k = menu (k[0]); //Función menú
  break;
  
  case -2:
  menu = salir();  
  break;
  
  case -3:
  exit();
  break;
  
  case -4:
  space.creditos();
  break;
  
  
  }
}

/*____________________________________________________________________________*/

void keyPressed(){
  
  if(key == ENTER && menu == 0){
    menu = 1;
  }
  
  if(key == 'c'|| key == 'C'  && k[3] == 0 && menu == -1){
    menu = -4;
  
    
      
      
  }
  
  
   if(key == ESC){
    
    key = 0;
    
      
    menu = -2; 
    if(menu2 == 0)
    advert = "SALIR DEL JUEGO?";
    else if (menu2 == 1)
    advert = "SALIR AL MENU PRINCIPAL?";
  }
   
  
  
  
}
  
/*____________________________________________________________________________*/

void mousePressed() {
  if ( menu == 1){
  balin.start(155, 400);
  explo.start(155, 450);}
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
  int x = 1100;
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
      image(imagesderecha[imageIndex], x, 490, 200, 200);
    } else {
      //frameRate(10);
      image(imagesizquierda[imageIndex], x, 490, 200, 200);
    }
    imageIndex = (imageIndex+1) % imagesderecha.length;
    x = x + vx;
    if (x > 1100) {
      vx = -10;
      irderecha = false;
    }
    if (x < 400) {
      vx = 10;
      irderecha = true;
    }
  }
  
/*_________________________________________________________________________________*/
  
  void creditos(){
   
  background(0);
  textFont(letra2);
  textSize(40);
  fill(133, 133, 133);
  textAlign(CENTER);
  text("CREDITOS ", width/2, height/2);
  textSize(20);
  textAlign(CORNER);
  text("VOLVER [V]", 35, 550);
  text("SALIR [ESC]", 35, 570);
  
  if(key == 'v' || key == 'V'){
    
           if(menu2 == 0){
            menu = 0;
            }      
           
  }
  }
  
  
  
  
}

/*____________________________________________________________________________*/
