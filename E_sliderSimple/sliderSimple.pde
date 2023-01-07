/*
slider simple diseñado para uso general

ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
www.skizata.com
*/


class SliderSimple {
  
  //variables globales al objeto ------------------
  float miX, miY, miAncho, miAlto;
  float miValorMinimo, miValorMaximo, miValorInicial;
  String miTitulo;
  float posBotonX, miValorActual, offsetX;
  boolean estaEncima, estaCapturado;
  int tamagnoDeTexto;

  // constructor -----------------------------------
  SliderSimple (float _x, float _y, float _aC, float _at, float _vMin, float _vMx, float _vI, String _mT) {
    miX = _x;
    miY = _y;
    miAncho = _aC;
    miAlto = _at;
    miValorMinimo = _vMin;
    miValorMaximo = _vMx;
    miValorInicial = _vI;
    miTitulo = _mT;
    miValorActual = miValorInicial;
    tamagnoDeTexto=14;

    //la posición horizontal del botón es siempre una relación de su valor y el ancho del slider
    posBotonX = map(miValorInicial, miValorMinimo, miValorMaximo, miX, miX+miAncho);

    // variables para arrastrar y soltar el botón del slider
    estaEncima  = false;
    estaCapturado = false;
    offsetX = 0;
  }


  // métodos -----------------------------------
  void display() {
    // verifica si el mouse esta cerca del boton y cambia su estado al hober
    float distancia = dist(posBotonX, miY+miAlto/2, mouseX, mouseY);
    if (distancia < miAlto) estaEncima = true;
    else estaEncima = false;

    // dibuja las líneas de los cuartos del slider
    fill(255, 255, 255, 150);
    stroke(255, 255, 155);
    strokeWeight(2);
    float primerCuarto = miAncho * 0.25;
    float mitad = miAncho * 0.5;
    float tercerCuarto = miAncho * 0.75;
    line(miX + primerCuarto, miY - 1, miX + primerCuarto, miY + miAlto + 1);
    line(miX + mitad, miY - 1, miX + mitad, miY + miAlto + 1);
    line(miX + tercerCuarto, miY - 1, miX + tercerCuarto, miY + miAlto + 1);

    // dibujando el rectángulo de fondo
    noStroke();
    fill(80, 80, 80);
    rect(miX, miY, miAncho, miAlto);

    // dibujando el boton del slider
    fill(255, 255, 155, 40);
    if (estaEncima) fill(255, 255, 155, 90);
    strokeWeight(1);
    stroke(255, 255, 155);
    rect(posBotonX - miAlto/2, miY, miAlto, miAlto);

    // dibujando el título del slider
    noStroke();
    textSize(tamagnoDeTexto);
    fill(250, 250, 250);
    textAlign(CENTER);
    text(miTitulo, miX + (miAncho / 2), miY - 10);

    // dibujando el valor
    textSize(tamagnoDeTexto-2);
    textAlign(CENTER);
    text(nf(miValorActual, 0, 2), posBotonX-3, miY + miAlto + 25);
  } // end display()


  // eventos -----------------------------------

  void atrapandome () {
    if (estaEncima) {
      estaCapturado  = true;
      offsetX = mouseX-posBotonX;
    } else {
      estaCapturado = false;
    }
  }

  void arrastrandome () {
    if (estaCapturado) {
      posBotonX = mouseX + offsetX;
      // definiendo los límites horizontales del slider
      if (posBotonX < miX ) posBotonX = miX;
      if (posBotonX > miX  + miAncho) posBotonX = miX  + miAncho;
      // posicionando el botón de slider en su lugar
      miValorActual = map(posBotonX, miX, miX + miAncho, miValorMinimo, miValorMaximo);
    }
  }

  void soltandome () {
    estaCapturado = false;
  }
} // end class SliderSimple
