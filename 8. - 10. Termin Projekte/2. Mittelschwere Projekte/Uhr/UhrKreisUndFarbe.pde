// Variabeln definieren - außerhalb von setup() und draw()
// da sie in beiden Funktionen verwendet werden
int stunde, minute, sekunde;


void setup(){
  //Fenstergröße und Hintergrundfarbe festlegen
  size(310,310);
  background(255);
  
    
  // Variabeln mit 0 initialisieren
  stunde = 0;
  minute = 0;
  sekunde = 0;
  
  // die Funktion draw() wird 2x pro Sekunde ausgeführt
  frameRate(2);
  
}

void draw(){
  // speichere in den Variablen die aktuelle Zeit
  stunde = hour();
  minute = minute();
  sekunde = second();
  
  // blauton und neueStunde deklarieren um Farbwechsel 
  // pro Stunde zu ermöglichen
  int blauton;
  int neueStunde;
  neueStunde=stunde;
  blauton = (255/12)*neueStunde;
  
  //steigende Werte für neueStunde von 0 bis 12 mit IF-Argument
  // somit steigender Wert von blauton
  // anschließend sinkender Wert für neueStunde und somit blauton
  // von 13 bis 23
  if (stunde <= 12) {
    neueStunde = stunde;   
    blauton = (255/12)*neueStunde;   
  } else {
      switch (stunde) {
        case 13: neueStunde=11;                 
                 break;
        case 14: neueStunde=10;                 
                 break;
        case 15: neueStunde=9;                
                 break;
        case 16: neueStunde=8;
                 break;
        case 17: neueStunde=7;
                 break;
        case 18: neueStunde=6;
                 break;
        case 19: neueStunde=5;
                 break;
        case 20: neueStunde=4;
                 break;
        case 21: neueStunde=3;
                 break;
        case 22: neueStunde=2;
                 break;
        case 23: neueStunde=1;
                 break;
      }
  }


  //den Stundenkreis erstellen und füllen
  blauton=(255/24)*(stunde+12);
  stroke(255);
  fill(0,(neueStunde*10),blauton);
  ellipse(155,155,300,300);
  
  // max Größe Minutenkreis
  stroke(255);
  fill(255,255,255,0);
  ellipse(155,155,240,240);
  // Minutenkreis
  noStroke();
  fill(255,255,255,90);
  ellipse(155,155,minute*4,minute*4);
  
  
  // max Größe Sekundenkreis
  stroke(255);
  fill(255,255,255,0);
  ellipse(155,155,120,120); 
  //Sekundenkreis
  noStroke();
  fill(255,255,255,90);
  ellipse(155,155,sekunde*2,sekunde*2); 
}
