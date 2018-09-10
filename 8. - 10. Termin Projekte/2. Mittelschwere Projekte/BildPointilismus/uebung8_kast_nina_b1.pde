
PImage img;
float randomEllipse;



void setup() {
  size(640, 480);
  img = loadImage("photo1.jpg");
  noStroke();
  background(255);
  
  
  
  for(int x=0;x<img.width;x=x+5)
  {
    for(int y=0;y<img.height;y=y+5)
    { 
      // Hinweis: Random Funktion verwenden zum die 
      // Position von x und y zu varieren
      float xf=x-5+random(5);
      float yf=y-5+random(10);
      color pix = img.get(x, y);
      fill(pix); 
      
      // Hinweis: Random Funktion verwenden zum die 
      // die Größe des Punkts zu varieren
      randomEllipse= random(5, 10);
      ellipse(xf, yf, randomEllipse, randomEllipse);
    }
  }
}

void draw() { 
  
}



