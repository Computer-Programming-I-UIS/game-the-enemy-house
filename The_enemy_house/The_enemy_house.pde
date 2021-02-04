Enemy canon;

void setup (){
  PImage fondo; 
  fondo = loadImage("fondo.jpg");
  image (fondo, 0, 0, width, height); 
  size (1000, 600);
  canon = new Enemy (500, 300);              //cañon
 
}

void draw(){
  
  canon.display();
}


//Clase

class Enemy{
  
  //Atributos
  
  float x, y;          //Posicion
  float speed = 5.5;   //Velocidada de mov
  
//Constructor
  
  Enemy ( float posX, float posY){
    
    x = posX;
    y = posY;     
  }

//Metodos

void display(){
  
  PImage img2;
  
  img2 = loadImage ("canon11.png");
  image (img2, 100, 350, 200, 200);
  
}
}
  
