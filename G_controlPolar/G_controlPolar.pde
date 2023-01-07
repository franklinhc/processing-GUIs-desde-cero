/*
sketch para mostrar el uso de un slider de forma circular
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

ControlPolar miControl;
PImage fondoDelControl;

// SETUP() ------------------------------------------------
void setup(){
  size (600,600);
  colorMode (HSB, 360, 100, 100);
  miControl = new ControlPolar(width/2,height/2);
  // carga la imagen que sirve de base para el control
  fondoDelControl = loadImage("circulo cromatico.png");
} // end setup()


// DRAW() ------------------------------------------------
void draw(){
  background(52);
  miControl.display();
} // end draw()


// EVENTOS ------------------------------------------------
void mouseDragged() {
  miControl.dragSobreMi();
}

void mouseReleased(){
    miControl.dragSobreMi();
} // end of mouseReleased
