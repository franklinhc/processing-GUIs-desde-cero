/*
objeto simple diseñado para ser arrastrable solo en un rango horizontal
 mostrando cómo se arrastra un objeto
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */

class ObjetoArrastrable {

  // variables globales al objeto ------------------
  float miX, miY;
  float miAlto, miAncho;
  color miColor;
  boolean estaEncima, estaCapturado;
  float offsetX, offsetY;

  // constructor ----------------------------------
  ObjetoArrastrable (float _x, float _y) {
    miX = _x;
    miY = _y;
    miAlto = 15;
    miAncho = 100;
    miColor = color(150, random(50), random(70, 100));
    estaEncima = false;
    estaCapturado = false;
    offsetX = 0;
  }

  // métodos ----------------------------------
  void display() {
    // verifica si el mouse esta cerca del objeto y cambia su estado al hover
    boolean mouseDentro = (mouseX > miX && mouseX < miX+miAncho && mouseY > miY && mouseY < miY+miAlto);
    if (mouseDentro) estaEncima = true;
    else estaEncima = false;
    
    stroke(0, 0, 100); // contorno blanco en HSB
    // si estaEncima usa contorno, sino no tiene contorno
    if (estaEncima) strokeWeight (1);
    else noStroke();

    // dibuja el rectángulo
    fill(miColor);
    rect(miX, miY, miAncho, miAlto);
  } // end display()


  // eventos ----------------------------------
  void atrapandome () {
    if (estaEncima) {
      estaCapturado  = true;
      offsetX = mouseX-miX;
    } else {
      estaCapturado = false;
    }
  }

  void arrastrandome () {
    if (estaCapturado) {
      miX = mouseX-offsetX;
    }
  }

  void soltandome () {
    estaCapturado = false;
  }  
  
} // end class
