/*
sketch para mostrar el uso de un slider de rango
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

SliderDeRango miSliderDeRango;

// SETUP() ------------------------------------------------
void setup(){
  size (600,600);
  //SliderDeRango (float _x, float _y, float _aC, float _at, float _vMin, float _vMx, String _mT)
  miSliderDeRango = new SliderDeRango (50, 300, 500, 10, 0, 100, "unidad");
} // end setup()


// DRAW() ------------------------------------------------
void draw (){ 
  background(51);
  miSliderDeRango.display();
} // end draw()


// EVENTOS ------------------------------------------------
void mouseDragged() {
    miSliderDeRango.arrastrandome(mouseX, mouseY);
}

void mouseReleased(){
    miSliderDeRango.soltandome();
}
