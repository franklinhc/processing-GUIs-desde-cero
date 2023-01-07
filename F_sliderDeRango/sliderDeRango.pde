/*
slider de rango diseñado para uso general
 
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | junio 2022
 www.skizata.com
 */


class SliderDeRango {
  
  //variables globales al objeto ------------------
  float miX, miY, miAncho, miAlto;
  float miValorMinimo, miValorMaximo;
  String miTitulo;
  float posBotonXizquierdo, posBotonXderecho, miValorDerecho, miValorIzquierdo;
  boolean estaEncimaDerecho, estaEncimaIzquierdo, estaEncimaCentro;
  boolean estaCapturadoDerecho, estaCapturadoIzquierdo, estaCapturadoCentro;
  float offsetXizquierdo, offsetXderecho, offsetXcentro;
  int tamagnoDeTexto;

  // constructor -----------------------------------
  SliderDeRango (float _x, float _y, float _aC, float _at, float _vMin, float _vMx, String _mT) {
    miX = _x;
    miY = _y;
    miAncho = _aC;
    miAlto = _at;
    miValorMinimo = _vMin;
    miValorMaximo = _vMx;
    miTitulo = _mT;

    //la posición horizontal de los botones son una relación de su valor y el ancho del slider
    posBotonXizquierdo = map(miValorMinimo, miValorMinimo, miValorMaximo, miX, miX+miAncho);
    posBotonXderecho = map(miValorMaximo, miValorMinimo, miValorMaximo, miX, miX+miAncho);

    // posiciones iniciales a los extremos de cada lado∫
    miValorIzquierdo = miValorMinimo;
    miValorDerecho = miValorMaximo;
  
    // variables de cada boton inician en falso
    estaEncimaIzquierdo = false;
    estaEncimaDerecho = false;
    estaEncimaCentro = false;

    estaCapturadoIzquierdo = false;
    estaCapturadoDerecho = false;
    estaCapturadoCentro = false;

    offsetXizquierdo = 0;
    offsetXderecho = 0;
    offsetXcentro = 0;

    tamagnoDeTexto=14;
  }



  // métodos -----------------------------------
  void display() {
    estaSobreAlgunElemento (mouseX, mouseY);

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

    // botón izquierdo
    fill(255, 255, 155, 40);
    if (estaEncimaDerecho) fill(255, 255, 155, 150);
    strokeWeight(1);
    stroke(255, 255, 155);
    rect(posBotonXizquierdo - miAlto, miY, miAlto, miAlto);
    line(posBotonXizquierdo, miY - 10, posBotonXizquierdo, miY + miAlto + 10);

    // botón derecho
    fill(255, 255, 155, 40);
    if (estaEncimaIzquierdo) fill(255, 255, 155, 150);
    strokeWeight(1);
    rect(posBotonXderecho, miY, miAlto, miAlto);
    line(posBotonXderecho, miY - 10, posBotonXderecho, miY + miAlto + 10);

    // boton central
    fill(255, 255, 155, 40);
    noStroke();
    if (estaEncimaCentro) fill(255, 255, 155, 90);
    float anchoRec = posBotonXderecho - posBotonXizquierdo;
    rect(posBotonXizquierdo, miY, anchoRec, miAlto);

    // líneas de los límites del slider
    strokeWeight(2);
    fill(255, 255, 255, 150);
    line(miX, miY - 1, miX, miY + miAlto + 1);
    line(miX + miAncho, miY - 1, miX + miAncho, miY + miAlto + 1);

    // texto tiutlo
    textSize(12);
    fill(250, 250, 250);
    textAlign(CENTER);
    text(miTitulo, miX + (miAncho / 2), miY - 10);

    //texto valores
    textSize(10);
    textAlign(RIGHT); // nf(miValorActual, 0, 2)
    text(nf(miValorIzquierdo, 0, 2), posBotonXizquierdo-3, miY + miAlto + 25);
    textAlign(LEFT);
    text(nf(miValorDerecho, 0, 2), posBotonXderecho+5, miY + miAlto + 25);
  } // end display()


  // función que verifica si el mouse está encima de alguno de los botones
  void estaSobreAlgunElemento (float checkX, float checkY) {
    // verifica botón izquierdo
    estaEncimaDerecho = (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXizquierdo - miAlto && checkX < posBotonXizquierdo);

    // verifica botón derecho
    estaEncimaIzquierdo = (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXderecho && checkX < posBotonXderecho + miAlto);

    // verifica botón central
    estaEncimaCentro = (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXizquierdo && checkX < posBotonXderecho);
  }






  // eventos -----------------------------------

  void arrastrandome (float checkX, float checkY) {
    // boton izquierdo ----------------------------------------------------------------
    if (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXizquierdo - miAlto && checkX < posBotonXizquierdo) {
      estaCapturadoIzquierdo = true;
      offsetXcentro = posBotonXizquierdo - checkX;
    }
    if (estaCapturadoIzquierdo) {
      if (checkX > miX - miAncho && checkX < posBotonXderecho) {
        if (checkX > miX) posBotonXizquierdo = checkX + offsetXcentro;
        else posBotonXizquierdo = miX;
        miValorIzquierdo = map(posBotonXizquierdo, miX, miX + miAncho, miValorMinimo, miValorMaximo);
      }
    }

    // boton derecho ----------------------------------------------------------------
    if (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXderecho && checkX < posBotonXderecho + miAlto) {
      estaCapturadoDerecho = true;
      offsetXcentro = posBotonXderecho - checkX;
    }
    if (estaCapturadoDerecho) {
      if (checkX > miX && checkX < miX+miAncho+miAlto) {
        if (checkX < miX + miAncho) posBotonXderecho = checkX + offsetXcentro;
        else posBotonXderecho = miX+miAncho;
        miValorDerecho = map(posBotonXderecho, miX, miX + miAncho, miValorMinimo, miValorMaximo);
      }
    }

    // boton central ----------------------------------------------------------------
    if (checkY > miY && checkY < miY + miAlto &&
      checkX > posBotonXizquierdo && checkX < posBotonXderecho &&
      !estaCapturadoCentro) {
      estaCapturadoCentro = true;
      offsetXderecho = posBotonXderecho - checkX;
      offsetXizquierdo = posBotonXizquierdo - checkX;
    }

    if (estaCapturadoCentro) {
      if (posBotonXizquierdo >= miX) {
        posBotonXizquierdo = checkX + offsetXizquierdo;
        miValorIzquierdo = map(posBotonXizquierdo, miX, miX + miAncho, miValorMinimo, miValorMaximo);
      }
      if (posBotonXderecho <= miX + miAncho) {
        posBotonXderecho = checkX + offsetXderecho;
        miValorDerecho = map(posBotonXderecho, miX, miX + miAncho, miValorMinimo, miValorMaximo);
      }
      if (posBotonXizquierdo < miX) {
        posBotonXizquierdo = miX;
        miValorIzquierdo = miValorMinimo;
      }
      if (posBotonXderecho > miX + miAncho) {
        posBotonXderecho = miX + miAncho;
        miValorDerecho = miValorMaximo;
      }
    }
  } // end arrastrandome ()


  void soltandome () {
    estaCapturadoDerecho = false;
    estaCapturadoIzquierdo = false;
    estaCapturadoCentro = false;
    offsetXizquierdo = 0;
    offsetXderecho = 0;
    offsetXcentro = 0;
  }
} // end class SliderSimple
