float[] menu(float k){
  
  canonmenu = loadImage("canonmenu.png");           //Imagen cañon menu       
  fondomenu1 = loadImage("muro222.png");            //imagen muro
  fondomenu2 = loadImage("muro77.png");             //Imagen hueco
  fondomenu3 = loadImage("muro7.png");              //Imagen ladrillos
  
     image(fondomenu3, 300,  260, 700, 700); 
     image (fondomenu2, 310, 320, 500, 500);  
     image(canonmenu, 310, 320, 300, 300);
     image(fondomenu1, 900, 270, 500, 500);
     
     
     textSize(25);
     fill( 173, 158, 19);
     textAlign(CENTER);
     textFont(letra2);
     text("EMPEZAR [ENTER]", 850, 300);
     text("CREDITOS [C]", 850, 350);
     text("SALIR [ESC]", 850, 400);
     fill(0);
     textFont(letra);
     text("THE ENEMY CAR", 850, 180);
    
     

     
     
     float [] back = {k};
     return back;
}
     
/*____________________________________________________________________________*/

  
 

/*____________________________________________________________________________*/


int salir(){
  
  background(0);
  textFont(letra2);
  textSize(40);
  fill(133, 133, 133);
  text("DESEA " + advert, width/2, height/2);
  text("SI[Y] / NO[N]", width/2, height/2+50);
  
       if(key == 'y' || key == 'Y'){
         //key=0;
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
