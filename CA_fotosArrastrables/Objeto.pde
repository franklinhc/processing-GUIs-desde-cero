/*
objeto conteniendo una foto para ser arrastrable
mostrando cómo se arrastra una foto

ph.d. franklin hernández-castro tec costa rica | HfG gmuend
www.skizata.com
junio 2022
*/

class ObjetoArrastrable {

  //variables globales al objeto ------------------
  float miX, miY;
  float miTamagno;
  boolean estaEncima, estaSeleccionado, estaCapturado, soloHizoClick;
  float offsetX, offsetY;
  PImage miImagen;



  // constructor ----------------------------------
  ObjetoArrastrable (float _x, float _y, PImage _mI) {
    miX = _x;
    miY = _y;
    miImagen = _mI;
    miTamagno = 75; // tamaño de las imágenes
    estaEncima = false;
    estaSeleccionado = false;
    estaCapturado = false;
    soloHizoClick = false;
    offsetX = 0;
    offsetY = 0;
  } // en del constructor



  // métodos ----------------------------------
  void display() {
    // verifica si el mouse esta cerca del objeto y cambia su estado al hober
    // boolena para hacer ver el "hover", en este caso para áreas cuadradas
    estaEncima = mouseX>miX-miTamagno / 2 && mouseX<miX+miTamagno / 2 && mouseY>miY-miTamagno / 2 && mouseY<miY+miTamagno / 2;
    
    // despliega la imagen
    image(miImagen, miX, miY);
    
    // si está encima dibuja un contorno blanco y delgado
    stroke(0, 0, 100); // blanco en HSB
    noFill(); // pues borraría la imagen
    if (this.estaEncima) strokeWeight (2);
    else noStroke();
    strokeWeight (1);
    rect (miX, miY, miTamagno+5, miTamagno+5);

    // si está seleccionado dibuja un contorno rojo y grueso
    if (estaSeleccionado) {
      noFill();
      stroke (0, 100, 100, 0.5 ); // rojo puro pero con 50% de transparencia
      strokeWeight (4);
      rect (miX, miY, miTamagno+5, miTamagno+5);
    }
  }  // end display

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
  }
} // fin de la clase
