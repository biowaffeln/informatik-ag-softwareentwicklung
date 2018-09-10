PImage meinBild1, meinBild2;
int anzahlPixel1, anzahlPixel2;
int schwellwert;

void setup()
{
  size(1000, 250); // in das Fenster passen 2 Bilder

  // erzeuge zwei "leere" RGB Bild
  meinBild1 = loadImage("stonehenge.jpg"); //500x250
  meinBild2 = createImage(500, 250, RGB);

  // Breite x Höhe ergibt die Pixelanzahl
  anzahlPixel1 = meinBild1.width * meinBild1.height;
  anzahlPixel2 = meinBild2.width * meinBild2.height;

  // lade die Bilder
  meinBild1.loadPixels();
  meinBild2.loadPixels();

  schwellwert = 50;
  
  updateImage();
}

void draw()
{
}

void updateImage() {
  
  FilterBild();
  //fill(255,255,255);
  
  // Zeige das Bild1 an der Stelle 0,0 an
  meinBild1.updatePixels();
  image(meinBild1, 0, 0);  

  // Zeige das Bild2 an der Stelle 500,0 an
  meinBild2.updatePixels();
  image(meinBild2, 500, 0);
  textSize(12);
  text ("Schwellwert (ändern mit +/-): " + schwellwert, 500, 12);
}


void FilterBild()
{
  int x, y;
  float edge1, edge2;
  color pix, pixLinks, pixOben;

  // Kanten erkennen
  // beginne y bei 1 damit wir den vergeleich zwischen y und y-1 machen können
  for ( x = 1; x < meinBild2.width; x++) 
  { 
    for ( y = 1; y < meinBild2.height; y++) 
    {

      pix= color(meinBild1.pixels[index1(x, y)]);
      pixLinks= color(meinBild1.pixels[index1(x-1, y)]);
      pixOben= color(meinBild1.pixels[index1(x, y-1)]);

      edge1 = abs(brightness(pix)-brightness(pixLinks));
      edge2 = abs(brightness(pix)-brightness(pixOben));

      float pixelBrightness = 0;

      // Schwellwert für die Kantenerkennung festlegen
      if (edge1 > schwellwert || edge2 > schwellwert) {
        pixelBrightness = 255;
      } else {
        pixelBrightness = 0;
      }

      meinBild2.pixels[index2(x, y)] = color(pixelBrightness);
    }
  }
}

void keyPressed() {
  if (key == '+') {
    schwellwert = schwellwert +1;
    
  }
  if (key == '-') {
    schwellwert = schwellwert -1;
  }
  updateImage();
}


// bei gegebem x und y liefert die Funktion den Index (die Position des Pixels) im Array wieder
int index1(int x, int y)
{
  int r= x + y*meinBild1.width;
  return r;
} 

// bei gegebem x und y liefert die Funktion den Index (die Position des Pixels) im Array wieder
int index2(int x, int y)
{
  int r= x + y*meinBild2.width;
  return r;
} 

