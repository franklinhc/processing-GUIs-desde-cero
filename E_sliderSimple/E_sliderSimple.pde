/*
sketch para mostrar el uso de un slider 
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

SliderSimple miSlider;

// SETUP() ------------------------------------------------
void setup(){
  size (600,600);
  // SliderSimple (float _x, float _y, float _aC, float _at, float _vMin, float _vMx, float _vI, String _mT)
  miSlider = new SliderSimple (50, 300, 500, 10, 0, 100, 50, "porcentaje");
} // end setup()


// DRAW() ------------------------------------------------
void draw (){ 
  background(51);
  miSlider.display();
} // end draw()


// EVENTOS ------------------------------------------------
void mousePressed() {
    miSlider.atrapandome();
}

void mouseDragged() {
    miSlider.arrastrandome();
}

void mouseReleased(){
    miSlider.soltandome();
}
