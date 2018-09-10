//Variablen werden deklariert
float randomPos;
int ballPos;
PImage hintergrund;
PImage cursorImg;
int clickCounter, pcCounter;
char pressedKey;

//setup-Methode
void setup(){
  //Fenstergrößer festlegen
  size(500, 270);
 
  //initialisiert Ball Position
  ballPos=0;
  
  //setze den Cursor als Zielkreuz
  cursorImg = loadImage("zielkreuz.png");
  cursor(cursorImg, 5, 5);
  
  //initialisiert randomPos für zufällige x-Koordinate mit 10
  randomPos = 10;
  
  //Zeichenfarbe für Text 
  fill(255,255,255);
  
  //setzt Counter auf 0
  clickCounter = 0;
  pcCounter = 0;
  
  //Lade den Hintergrund
  hintergrund = loadImage("mondhintergrund.jpg");

  
  // Textgröße
  textSize(30);
  //schreibt Text auf Startbildschirm
  text ("press 's' to start the game", 40, 80);

}

//Hauptprogramm
void draw(){
  
  //wird ausgeführt, wenn 's' gedrückt wird
  if (pressedKey == 's') {
    
    //neue Position (Bewegung nach unten)
    ballPos = ballPos + 3;
  
    //außerhalb des Fensters? dann neuer Ball und Punkt für PC
    if (ballPos > 270) {
      randomPos = random (10, 490);
      ballPos=0;
      pcCounter = pcCounter + 1;
    }
  
    image(hintergrund, 0, 0);
    // Lade den Hintergrund
    hintergrund = loadImage("mondhintergrund.jpg");
  
      
     //Textgröße
    textSize(10);
    text ("to pause the game, press any key beside 's'", 10, 260);
  
    //Textgröße
    textSize(15);
    text("player:"+clickCounter, 5, 20);
    text("computer:"+pcCounter, 400, 20);
  
    // Ball zeichnen
    ellipse(randomPos,ballPos,20,20); 
  }
}


//Methode gibt 'pressedKey' Wert der gedrückten Taste
void keyPressed() {
  pressedKey = key;
}


//Methode wenn Maustaste gedrückt wird
void mousePressed() {
  //bei Treffer Punkt für Spieler und neuer Ball
  if (((randomPos >= mouseX) && (randomPos-20 <= mouseX)) && ((ballPos >= mouseY) && (ballPos-20 <= mouseY))) {
    randomPos = random (10, 490);
    ballPos=0;
    clickCounter = clickCounter +1;
  }
}
