/*
clase de un slider de forma circular
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/

class ControlPolar {
  
  //variables globales al objeto ------------------
  float miX, miY;
  int miRadio = 400;
  int miAncho = 50;
  boolean estaEncima = false;
  float miAnguloActual = PI;
  float anguloAtan;

  // constructor ----------------------------------
  ControlPolar (float _x, float _y) {
    miX = _x;
    miY = _y;
  }

  // métodos ----------------------------------
  void display () {
    // para definir si el mosue está encima del arco
    float ditanciaDelMouse = dist(mouseX, mouseY, miX, miY);
    // define la zona sensible del control
    estaEncima = (ditanciaDelMouse < miRadio/2 && ditanciaDelMouse > miRadio/2 - miAncho); 

    // despliega la imagen que define el marco del slider polar
   image(fondoDelControl,0,0);
    
    // define cuál es el HUE seleccionado a partir del ángulo actual
    float hue = map (miAnguloActual, 0, TWO_PI, 0,360); // mapea el HUE entre naranha y el rojo puro
    color colorSeleccionado = color(hue, 100, 100);
    
    // dibuja el círuclo que funciona como el extremo de la aguja
    stroke(128); // color gris 50%
    strokeWeight(5);
    noFill();
    // coordenadas polares del centro del círculo
    float xDeBoton = miX + cos(miAnguloActual) * (miRadio/2 -20);
    float yDeBoton = miY + sin(miAnguloActual) * (miRadio/2 -20);
    ellipse (xDeBoton, yDeBoton, 20,20);
    
    
    // para dibujar la aguja
    //coordenadas polares del fin de la aguja
    float agujaX = miX + miRadio/1.5 * cos (miAnguloActual);
    float agujaY = miY + miRadio/1.5 * sin (miAnguloActual);
    strokeWeight(1);
    stroke(255,128); // color blanco 50% de transparencia
    line(miX, miY, agujaX, agujaY);
    
    
    // dibuja el círculo central que cambia de color con la selección
    noStroke();
    fill(colorSeleccionado);
    ellipse (miX, miY, 100,100);

    // textos superiores
    fill(255);
    textAlign(CENTER);
    text("angulo actual: " + nf(miAnguloActual,0,2), miX-90, 50);
    text("hue actual: " + nf(hue,0,2), miX+50, 50);
  } // end of render


  // eventos ----------------------------------
  void dragSobreMi() {
    if (estaEncima) {
      anguloAtan = atan2(mouseY-miY, mouseX-miX); // coordenadas del mouse trasladados al centro de la pantalla

      if (anguloAtan<0) anguloAtan = PI + (PI-abs(anguloAtan)); // cambia los valores negativos hacia el 1º y 2º cuadrante
      miAnguloActual = anguloAtan;  
    }
  } // end of  dragSobreMi
  
  
} // end of class
