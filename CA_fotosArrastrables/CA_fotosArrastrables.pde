/*
sketch para mostrar cómo se arrastra un objeto que contiene una foto
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

int cantidadDeObjetos = 6;
ObjetoArrastrable [] misObjetos = new ObjetoArrastrable [cantidadDeObjetos];

PImage[] imagenes;

// SETUP() ------------------------------------------------
void setup() {
  size (600, 600);
  colorMode (HSB, 360, 100, 100, 1); // rangos del hue, saturación, luminosidad y transparencia
  imageMode(CENTER);
  rectMode(CENTER);

  // cargando las fotos en una lista
  imagenes = new PImage[6]; // creates array that can hold 3 PImage objects
  imagenes[0] = loadImage("dalia 75x75.jpg");
  imagenes[1] = loadImage("de loto 75x75.jpg");
  imagenes[2] = loadImage("gardenia 75x75.jpg");
  imagenes[3] = loadImage("margarita 75x75.jpg");
  imagenes[4] = loadImage("rosa 75x75.jpg");
  imagenes[5] = loadImage("tulipan 75x75.jpg");
  
  // creando los objetos en posiciones random con su respectiva foto asociada
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i] = new ObjetoArrastrable ( random (width), random(height), imagenes[i]);
  }
} // end setup()



// DRAW() ------------------------------------------------
void draw () {
  background(15);
  // dibujando los objetos
  for (int i = 0; i < cantidadDeObjetos; i++) {
    misObjetos[i].display();
  }
} // end setup()



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
