

class Bala {

  //Atributos 

  float vo;            //velocidad inicial
  float alpha;         //ángulo de tiro
  float vx, vy;        //velocidades en X y Y
  float g;             //valor de la gravedad
  float x, y;          //posición

  float perdida;       //porcentaje de energía que pierde en cada rebote

  int rPelota;         //radio de la pelota

  boolean exist=false;

  //constructor

  Bala() {
  }
  void start(float posX, float posY) {
    if (!exist) {
      exist=true;

      rPelota = 18;

      vo = 20;
      alpha = 50;
      g = 0.8;
      x = posX;
      y = posY;
      //calculamos las velocidades en X y Y
      vx = vo * cos(radians(alpha));
      vy = vo * sin(radians(alpha));
      noStroke();
      smooth();
      perdida = 0.25;
    }
  }

  void show() {

    if (exist) {  

      //Disminuye la velodidad en Y dependiendo del valor de la gravedad
      vy -= g;
      y -= vy;
      x += vx;

      //Rrebote en los extremos 



      //extremo inferior
      if (y > 510 - rPelota) {
        //reposicionamos la pelota
        y = 510 - rPelota;
        //invertimos y disminuinos la velocidad en Y
        vy = -perdida * vy;
        //disminuimos la velocidad en X
        vx = perdida * vx;
      }


      //limite y rebote extremo derecho
      if (x > width - rPelota) {
        x = width - rPelota;
        vx = -perdida * vx;
        vy = perdida * vy;
      }

      //limite y rebote extremo izquierdo
      if (x < rPelota) {
        x = rPelota;
        vx = -perdida * vx;
        vy = perdida * vy;
      }

      // Dibujar bala
      fill(0);
      ellipse(x, y, 2*rPelota, 2*rPelota);
      if ( y >= 480){
        exist = false;}
    }
  }
}
