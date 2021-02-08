Enemy canon;
Explosion explo;

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



  
  
  
  
  
  
  
  
