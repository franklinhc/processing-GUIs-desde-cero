/*
sketch para mostrar el uso de un slider de forma circular con límites
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

ControlPolar miControl;

// SETUP() ------------------------------------------------
void setup(){
  size (600,600);
  colorMode (HSB, 360, 100, 100);
  miControl = new ControlPolar(300,300);
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
