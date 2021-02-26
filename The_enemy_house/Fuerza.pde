class Box {
  boolean exist=false;
  float x, y;          //posición
  
  Box() {
  }
  
  
  
  
  void start(float posX, float posY){
    
    if (!exist) {
    exist=true;
    cvel = new PVector(0,0); //Velocidad
    x = posX;
    y = posY;
  }
  }
  
  void see(){
     if (exist) {  
       yep = fza == 1 ? 1 : (fza == 35 ? -1:yep); //Calculo de fuerza, min 10, max 50
        fza+=yep;
        
        
        for(int i = 1; i <= width; i++){
          if(!vehit(rx+i*(fza/5)*cvel.x, ry+i*(fza/5)*cvel.y+0.01*fza/10*pow(i, 2), 1, 1,1,grilla)&& !vehit(rx+i*(fza/5)*cvel.x, ry+i*(fza/5)*cvel.y+0.01*fza/10*pow(i, 2), 1, 1,4,grilla)&&!vehit(rx+i*(fza/5)*cvel.x, ry+i*(fza/5)*cvel.y+0.01*fza/10*pow(i, 2), 1, 1,5,grilla))
          ellipse(rx+i*(fza/5)*cvel.x, ry+i*(fza/5)*cvel.y+0.01*fza/10*pow(i, 2), a/10, l/10);
          else
          break;
        }
  
        rectMode(CORNER);
        
     
        fill(252, 77, 18);
        rect(x,y,60,30);
        fill(0);
        rect(x+4, y+4, 48, 22);
        fill(188,0,0);
        rect(x+4, y+4, 12+fza, 30-8); 
     }
  }
    
  }
  
  boolean vehit(float x,float y,float a,float l,float t, float grilla[][]){ //Verificar hitbox en una zona
  boolean check = false;
  if(x+a < width+100 && x > -100 && y+l < height + 100 && y > -100){
    for(int i = abs(round(x)); i <= abs(round(x+a)); i++){
      
        for(int j = abs(round(y)); j <= abs(round(y+l)); j++){
          if(grilla[i][j] == t){ //Si encuentra alguno con el valor requerido, se devuelve el valor true
            check = true;
            break;
          }
        }
      
    }
  }
  return check;
}
  
