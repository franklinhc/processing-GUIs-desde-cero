/*
sketch usando una clase simple de botón tipo check 
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */


ClaseBotonCheck miBoton1, miBoton2, miBoton3;

// SETUP() ------------------------------------------------
void setup(){
  size(300,300);  //int mX, int mY, int mAncho, int mAlto, String mSt
  miBoton1 = new ClaseBotonCheck (75, 100, 30, 30, "boton 1");
  miBoton2 = new ClaseBotonCheck (75, 150, 30, 30, "boton 2");
  miBoton3 = new ClaseBotonCheck (75, 200, 30, 30, "boton 3");
}


// DRAW() ------------------------------------------------
void draw(){
  background(64); //gris 25%
  miBoton1.display();
  miBoton2.display();
  miBoton3.display();
}


// EVENTOS ------------------------------------------------
void mouseReleased() {
  miBoton1.clickSobreMi();
  miBoton2.clickSobreMi();
  miBoton3.clickSobreMi();
}
