/*
objeto simple diseñado para ser arrastrable
 mostrando cómo se arrastra un objeto
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */

class ObjetoArrastrable {

  //variables globales al objeto ------------------
  float miX, miY;
  float miTamagno;
  color miColor;
  boolean estaEncima, estaSeleccionado, estaCapturado, soloHizoClick;
  float offsetX, offsetY;

  // constructor ----------------------------------
  ObjetoArrastrable (float _x, float _y) {
    miX = _x;
    miY = _y;
    miTamagno = random(10, 25);
    miColor = color(20, random(100), random(50, 90));
    estaEncima = false;
    estaSeleccionado = false;
    estaCapturado = false;
    soloHizoClick = false; // por si el click se hizo solo para seleccionar y no para arrastrar
    offsetX = 0;
    offsetY = 0;
  }

  // métodos ----------------------------------
  void display() {
    // verifica si el mouse esta cerca del objeto y cambia su estado al hober
    float distancia = dist(miX, miY, mouseX, mouseY);
    if (distancia < miTamagno/2) estaEncima = true;
    else estaEncima = false;

    stroke(0, 0, 100);
    if (estaEncima) strokeWeight (2);
    else noStroke();

    fill(miColor);
    ellipse (miX, miY, miTamagno, miTamagno);
    noStroke();

    // seleccionado
    if (estaSeleccionado) {
      noFill();
      stroke (50, 100, 100, 0.3 );
      strokeWeight (2);
      ellipse (miX, miY, miTamagno*1.5, miTamagno*1.5);
    }
  } // end display()


  // eventos ----------------------------------
  void atrapandome () {
    if (estaEncima) {
      estaCapturado  = true;
      offsetX = mouseX-miX;
      offsetY = mouseY-miY;
      soloHizoClick = true;
    } else {
      estaCapturado = false;
    }
  }

  void arrastrandome () {
    if (estaCapturado) {
      miX = mouseX-offsetX;
      miY = mouseY-offsetY;
      soloHizoClick = false;
    }
  }

  void soltandome () {
    if (soloHizoClick) {
      estaSeleccionado = !estaSeleccionado;
      soloHizoClick = false;
    }  
    estaCapturado = false;
  } // end soltandome ()
  
  
  
} // end class
