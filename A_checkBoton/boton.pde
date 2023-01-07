/*
sketch demostrando una clase simple de botón tipo check 
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */

class ClaseBotonCheck {
  //variables globales al objeto ------------------
  int miX, miY, miAncho, miAlto;
  boolean presionado = false;
  boolean estaSobreMi;
  String miTitulo;

  // constructor ----------------------------------
  ClaseBotonCheck(int mX, int mY, int mAncho, int mAlto, String mSt) {
    miX = mX;
    miY = mY;
    miAncho = mAncho;
    miAlto = mAlto;
    miTitulo = mSt;
  } // end constructor

  // métodos ----------------------------------
  // dibujando los botones según su estado
  void display () {
    // boolena para hacer ver el "hover", en este caso para áreas circulares
    estaSobreMi = dist(mouseX, mouseY, miX, miY) < miAlto/2;

    if (!presionado) { // estado en reposo-------------------------------------
      if (estaSobreMi) { // estado en reposo CON hover
        fill(65, 250, 125);
      } else { // estado en reposo SIN hober
        fill(45, 160, 100);
      }
    } else { // estado presionado----------------------------------------------
      if (estaSobreMi) { // presionado CON hover
        fill(150, 255, 200);
      } else { // presionado SIN hober    
        fill(65, 250, 125);
      }
    }
    noStroke();
    ellipse(miX, miY, miAlto, miAlto);

    if (!presionado) fill(150);else fill (250);
    text(miTitulo, miX+miAlto*0.75, miY+4);
  } // end display
  
  // eventos ----------------------------------
  void clickSobreMi () {
    if (estaSobreMi) presionado = !presionado;
  } // end estaSobreMi ()
  
}// end ClaseCheckBoton
