/*
clase de un slider de forma circular con límites
 
ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/



class ControlPolar {
  
  //variables globales al objeto ------------------
  float miX, miY;
  color miColor;
  float miSize;
  int miRadio = 400;
  int miAncho = 30;
  boolean estaEncima = false;
  float miAnguloActual = PI;
  float a;
  float miValorFinal, miValorActual;

  // constructor ----------------------------------
  ControlPolar (float _x, float _y) {
    miX = _x;
    miY = _y;
    miColor = color(20, 80, 50); // color terracota
    miValorFinal = 100;
  }

  // métodos ----------------------------------
  void display () {
    // para definir si el mosue está encima del arco
    float ditanciaDelMouse = dist(mouseX, mouseY, miX, miY);
    estaEncima = (ditanciaDelMouse > miRadio/2 - miAncho/2 && ditanciaDelMouse < miRadio/2 + miAncho/2  &&
      mouseY < miY+miRadio/2 - miAncho*1.3); // para recortar el pedazo de circulo de abajo

    // arco transparente que sigue a las agujas
    fill(255, 25); // blanco al 10%
    noStroke();
    arc(miX, miY, miRadio, miRadio, 3*PI/4, miAnguloActual);

    // arco del marco del slider polar
    noFill();
    stroke(miColor);
    strokeWeight(miAncho);
    arc(miX, miY, miRadio, miRadio, 3*PI/4, 9*PI/4); // posición inical y final de todo el slider [3*PI/4, 9*PI/4]
    
    // arco indicador, interior color mostaza
    float hue = map (miAnguloActual, 3*PI/4, 9*PI/4, 50,0); // mapea el HUE entre naranja y el rojo
    stroke(hue, 80, 80);
    strokeWeight(miAncho/2);
    arc(miX, miY, miRadio, miRadio, 3*PI/4, miAnguloActual);
    
    // aguja
    //coordenadas polares del fin de la aguja
    float agujaX = miX + miRadio/1.5 * cos (miAnguloActual);
    float agujaY = miY + miRadio/1.5 * sin (miAnguloActual);
    strokeWeight(1);
    stroke(255,128); // blanco 50%
    line(miX, miY, agujaX, agujaY);

    // texto central
    fill(255);
    textAlign(CENTER);
    miValorActual = map (miAnguloActual, 3*PI/4, 9*PI/4, 0,100);
    text("angulo actual: " + nf(miAnguloActual,0,2), miX, miY+20);
    text("valor actual: " + nf(miValorActual,0,2), miX, miY+35);
    
  } // end of render


  // eventos ----------------------------------
  void dragSobreMi() {
    if (estaEncima) {
      a = atan2(mouseY-miY, mouseX-miX); // coordenadas del mouse trasladados al centro de la pantalla
     
       // ajustes del ángulo para los límites del control polar
      if (a<0) a = PI + (PI-abs(a)); // cambia los valores negativos hacia el 1º y 2º cuadrante
      if (a>0 && a < PI/2) a = a +TWO_PI; // cuando el arco está en el 4º cuadrante
      if (a > 9*PI/4) a = 9*PI/4; // limite derecho del control polar
      miAnguloActual = a;
      
      // corrección del ángulo inicial de la aguja
      if (miAnguloActual < 3*PI/4) miAnguloActual=3*PI/4;
    }
  } // end of  dragSobreMi
  
  
} // end of class
