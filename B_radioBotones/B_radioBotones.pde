/*
sketch usando una clase simple de botón tipo radio 
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */

String nombreBotones[] = {"segundos","minutos","horas", "días","meses","años"};
RadioBoton[] misRadioBotones = new RadioBoton[nombreBotones.length];


// SETUP() ------------------------------------------------
void setup() {
  size(500, 300);
  smooth();
  rectMode(CENTER);
  
  int xInicial = 75;
  int tamano = 20;
  int distanciaEntreBotones = 50;
  for (int i = 0; i < misRadioBotones.length; i++) {
    int x = xInicial + i * (tamano+distanciaEntreBotones);
    //RadioBoton(int xp, int yp, int sz, int id, RadioBoton[] o, String tL)
    misRadioBotones[i] = new RadioBoton(x, height/2, tamano, i, misRadioBotones, nombreBotones[i]);
  }
} // end setup()



// DRAW() ------------------------------------------------
void draw() {
  background(40);
  for (int i = 0; i < misRadioBotones.length; i++) {
    misRadioBotones[i].display();
  }
} // end draw()



// EVENTOS ------------------------------------------------
void mouseReleased() {
  for (int i = 0; i < misRadioBotones.length; i++) {
    misRadioBotones[i].clickSobreMi();
  }
}
