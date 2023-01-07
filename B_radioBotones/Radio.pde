/*
sketch demostrando una clase simple de botón tipo radio
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */

class RadioBoton {
  //variables globales al objeto ------------------
  int miX, miY; // posición
  int tamagno; // tamaño del botón
  boolean presionado = false;
  boolean encima = false;
  int miID; // número de identificación de cada botón
  String miTitulo;
  RadioBoton[] hermanos; // lista con todos los botones "hermanos"

  // constructor ----------------------------------
  RadioBoton(int xp, int yp, int sz, int id, RadioBoton[] o, String tL) {
    miX = xp;
    miY = yp;
    tamagno = sz;
    miTitulo = tL;
    hermanos = o;
    miID = id;
  }


  // métodos ----------------------------------

  // dibujando los botones según su estado
  void display() {
    // boolena para hacer ver el "hover", en este caso para áreas cuadradas
    encima = mouseX>miX-tamagno / 2 && mouseX<miX+tamagno / 2 && mouseY>miY-tamagno / 2 && mouseY<miY+tamagno / 2;

    // dibujando el cuadrado base
    noStroke();
    if (encima) { // si está el mouse encima
      fill(65, 250, 125);
    } else { // modo reposo SIN el mouse encima
      fill(45, 160, 100);
    }
    rect(miX, miY, tamagno, tamagno);

    // dibujando el cuadrado en caso de presionado, se le hace el contorno
    if (presionado) {
      stroke(150, 255, 200);
      strokeWeight(3);
      rect(miX, miY, tamagno, tamagno);
    }

    // para el título del botón que está abajo del mismo
    if (!presionado) fill(150);
    else fill (250);
    textAlign(CENTER);
    text(miTitulo, miX, miY+tamagno+2);
  }  // end display


  // eventos ----------------------------------
  // si se hace click encima del botón desactiva los demás y devuelve el estado
  void clickSobreMi() {
    if (encima) {
      presionado = !presionado;
      for (int i = 0; i < hermanos.length; i++) {
        if (i != miID) {
          hermanos[i].presionado = false;
        }
      }
    }
  }
  
} // fin de la clase
