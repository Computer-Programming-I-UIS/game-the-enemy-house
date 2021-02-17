float[] menu(float k, float c){
  
 
  canonmenu = loadImage("canonmenu.png");           //Imagen cañon menu       
  fondomenu1 = loadImage("muro222.png");            //imagen muro
  fondomenu2 = loadImage("muro77.png");             //Imagen hueco
  fondomenu3 = loadImage("muro7.png");              //Imagen ladrillos
  canonplay = loadImage("frame-0010.png");
  carrotutorial = loadImage("frame_0.png");
  barrapotencia = loadImage("barra.png");
  fuego = loadImage("explo.png");
  balas = loadImage("balas.png");
  float speed= 2;
  
  
     image(fondomenu3, 300,  260, 700, 700); 
     image (fondomenu2, 310, 320, 500, 500);  
     image(canonmenu, 310, 320, 300, 300);
     image(fondomenu1, 900, 270, 500, 500);
     
     
     textSize(25);
     fill( 237, 214, 34);
     textAlign(CENTER);
     textFont(letra2);
     text("EMPEZAR [ENTER]", 850, 260);
     text("COMO JUGAR [T]", 850, 310);
     text("CREDITOS [C]", 850, 360);
     text("SALIR [ESC]", 850, 410);
     fill(0);
     textFont(letra);
     text("THE ENEMY CAR", 850, 180);
     
     
    if(menu == -1 && modo == 1){
    background(0);
    pushMatrix();
    fill(133, 133, 133);
    translate( width/2, -c+height/2);
    textFont(letra2); 
    textAlign(CENTER);
    textSize(40); 
    text("THE ENEMY CAR", 0, 0);
    textSize(20);
    text("Creditos", 0, height/4.5);
    text("A huaban.com plataforma para descargan ilustraciones", 0, height/3.5);
    text("A freepong.es plataforma para descargar imagenes png", 0, height/3);
    text("Al usuario _petal de huaban.com, creador de la imagen de fondo", 0, 230);
    text("A fonts2u.com plataforma para descargar fuentes", 0, 260);
    text("Al usuario font-face de fonts2u.com, creador de la fuente ''napalm vergio''", 0, 290);
    text("Al usuario LECTER_JOHNSON de fonts2u.com, creador de la fuente ''XXII-ARMY''", 0, 320);
    text("A freesound.org plataforma para descargar audios", 0, 350);
    text("Al usuario DDmyzik de freesound.org, creador del audio del menu", 0, 380);
    text("Al usuario FoolBoyMedia de freesound.org, creador del audio del gameplay", 0, 410);
    popMatrix();
    c = c+speed;
    textSize(20);
    text("VOLVER [V]", 65, 550);
    text("SALIR DEL JUEGO [ESC]", 113, 570);
    
    if(key == 'v' || key == 'V' && menu2 == 0){
    menu = 0;
    }  
  }
  
  
  if(menu == -1 && modo == 2){
    background(0);
    textFont(letra2);
    fill(133, 133, 133);
    textSize(20);
    text("JUGAR [ENTER]", 80, 560);
    text("VOLVER [V]", 68, 580);
     image(canonplay, 200,  140, 150, 150);    
     text("cambia el angulo del", 170, 230);
     text(" canon con las teclas W y S", 190, 250); 
     image(balas, 540, 160, 150, 150);
     text("Tienes cinco oportunidades para disparar", 540, 250);   
     image(barrapotencia, 960, 150, 150, 150); 
     text("Oprime click derecho para ajustar el ", 980, 230);
     text("indicador de fuerza prediciendo el recorrido del objetico", 970, 250);
     image(canonplay, 400,  395, 150, 150);
     image(fuego, 480, 345, 70, 70);
     text("Suelta el click para disparar", 400, 490);
     image(carrotutorial, 800, 410, 200, 200); 
     text("Elimina el objetivo con tres impactos", 800, 490);
     
    
    if( key == ENTER){
      menu = 1;
    }if( key == 'v' || key == 'V' && menu2 == 0){
      menu = 0;
    }
    }   
     float [] back = {k, c};
     return back;
}
     


/*____________________________________________________________________________*/


int salir(){

  background(0);
  textFont(letra2);
  textSize(40);
  fill(133, 133, 133);
  text("DESEA " + advert, width/2, height/2);
  text("SI[Y] / NO[N]", width/2, height/2+50);
  
  
       if(key == 'y' || key == 'Y'){
         key=0;
         if(menu2 == 0){
           return advert.equals("SALIR DEL JUEGO?") ? -3:1;
         }else if(menu2 == 1){           
           return advert.equals("SALIR DEL JUEGO?") ? -3:0; }
         }else if(key == 'n' || key == 'N'){
           if(menu2==0){
           return 0;}
           else if (menu2 == 1){
           return 1;}
         }return -2;

}
