/*
sktech para mostrar cómo se arrastra un objeto
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

int cantidadDeObjetos = 12;
ObjetoArrastrable [] misObjetos = new ObjetoArrastrable [cantidadDeObjetos];


// SETUP() ------------------------------------------------
void setup() {
  size (600, 600);
  // uso del modo HSB para mayor facilidad de uso del color
  // rangos clásicos hue 360, saturación 100, luminosidad 100, transparencia 1
  colorMode (HSB, 360, 100, 100, 1);

  //creando los objetos en posiciones random
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i] = new ObjetoArrastrable ( random (width), random(height) );
  }
} // end setup()


// DRAW() ------------------------------------------------
void draw () {
  background(15);
  // dibujando los objetos
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i].display();
  }
} // end draw()



// EVENTOS ------------------------------------------------
void mousePressed() {
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i].atrapandome();
  }
} // end of mousePressed

void mouseDragged() {
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i].arrastrandome();
  }
} // end of mouseDragged

void mouseReleased() {
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i].soltandome();
  }
} // end of mouseReleased
