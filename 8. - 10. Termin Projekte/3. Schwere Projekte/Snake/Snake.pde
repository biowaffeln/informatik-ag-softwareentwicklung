//Setup

void setup(){
  size(800,600);
  background(0); //schwarz
  frameRate(20);
  fill(255); //weiß
  noStroke();
  
  snakeX[0] = (int)(Math.random() * xSize/2); //Anfang in der linken Hälfte, so
                                              //dass Spieler reagieren kann.
  snakeY[0] = (int)(Math.random() * ySize);
}

int xSize = 40; //Anzahl an Zellen in X-Richtung
int ySize = 30; //Anzahl an Zellen in y-Richtung
int cellSize = 20; //Größe einer Zelle, (xSize * cellSize = PixelBreite)

//Schlangeneigenschaften
int snakeLength = 1;
int[] snakeX = new int[snakeLength];
int[] snakeY = new int[snakeLength];
int[] enteredCell; //Zelle die von der Schlange betreten wird.
String snakeDirection = "right";

//Apfel
int[] apple = generateApple();

boolean keyLock = false;
boolean gameOver = false;


//GameLoop
void draw(){
  if(!gameOver){ //solange noch nicht Game Over
    background(0);
    
    fill(255,0,0); //male den Apfel rot
    drawCell(apple);
    fill(255);
  
    enteredCell = enterCell(); //welche Zelle wird betreten
  
    String cellIs = checkCell(enteredCell); //ist in der betretenen Zelle etwas
    
    moveSnake();
    drawSnake();
    
    //führe Aktionen aus, abhängig davon was in der Zelle ist
    if(cellIs == "apple"){
      apple = generateApple();
      growSnake();
    }else if(cellIs == "border" || cellIs == "snake"){
     gameOver = true;
     print("Game Over");
    }
    
    keyLock = false; //setze den keyLock zurück, so dass Richtung wieder geändert werden kann
  }
}


//Eingabeerkennung
void keyPressed(){
  if(!keyLock){ //keyLock sorgt dafür, dass die Richtung pro Frame nur einmal geändert werden kann
                //sonst kann es dazu führen, dass die Schlange sich um 180° dreht
    switch(keyCode){
      case UP:
      if(snakeDirection != "down"){ //verhintert, dass sich die Schlange um 180° dreht
        snakeDirection = "up";
        }
        break;
      case DOWN:
        if(snakeDirection != "up"){
        snakeDirection = "down";
        }
        break;
      case RIGHT:
        if(snakeDirection != "left"){
        snakeDirection = "right";
        }
        break;
      case LEFT:
        if(snakeDirection != "right"){
        snakeDirection = "left";
        }
        break; //eigentlich überflüssig
    }
    keyLock = true; //setzte den keyLock auf "true" um zu verhindern, dass die Richtung nochmal geändert werden kann
  }
}

//Funktionen

int[] enterCell(){
  int[] nextCell = new int[2]; //initialisiere neue Zelle
  
  switch(snakeDirection){
    case "up": 
      nextCell[0] = snakeX[0];
      nextCell[1] = snakeY[0] - 1; //bei "up" wird die Zelle oberhalb des Kopfes der Schlange gewählt.
      break;
    case "down":
      nextCell[0] = snakeX[0];
      nextCell[1] = snakeY[0] + 1; //analog zu "siehe bei up"
      break;
    case "left":
      nextCell[0] = snakeX[0] - 1;
      nextCell[1] = snakeY[0];
      break;
    case "right":
      nextCell[0] = snakeX[0] + 1;
      nextCell[1] = snakeY[0];
  }
  
  return nextCell;
} 

String checkCell(int[] cell){
  //schaue nach Apfel
  if(cell[0] == apple[0] && cell[1] == apple[1]){ //prüfe ob die Zelle die Gleiche ist, wie die des Apfels
    return "apple";
  //schaue nach Rand
  }else if(cell[0] < 0 || cell[0] >= xSize){ //prüfe ob der linke oder rechte Rand erreicht ist
    return "border";
  }else if(cell[1] < 0 || cell[1] >= ySize){ //prüfe ob der obere oder untere Rand erreicht ist
    return "border";
  }
  
  //schaue ob selbst gefressen
  for(int i = 0 ; i < snakeLength; i++){
    if(cell[0] == snakeX[i] && cell[1] == snakeY[i]){ //prüfe ob die Zelle mit einer Zelle der Schlange übereinstimmt
      return "snake";
    }
  }
  
  return "empty";
}

int[] generateApple(){
  int[] cell = new int[2];
  
  //wähle zufällige Zelle für Apfel
  cell[0] = (int)(Math.random() * xSize);
  cell[1] = (int)(Math.random() * ySize);
  
  return cell;
}

void moveSnake(){
  
  for(int i = snakeLength - 1 ; i > 0 ; i--){ //verschiebe die Werte im Array um ein Feld nach hinten.
    snakeX[i] = snakeX[i-1];
    snakeY[i] = snakeY[i-1];
  }
  //da es für das erste Feld kein vorheriges gibt, kommt hier die betretene Zelle hin.
  snakeX[0] = enteredCell[0];
  snakeY[0] = enteredCell[1];
}

void growSnake(){
  snakeLength = snakeLength + 1; 
  
  int[] newSnakeX = new int[snakeLength]; //erstelle ein neues Array, das um eins länger ist.
  int[] newSnakeY = new int[snakeLength];  
  
  for( int i = 0; i < snakeLength - 1 ; i++){
    newSnakeX[i] = snakeX[i]; //fülle das neue mit dem alten Array. (das letzte Feld wird beim nächsten frame durch move Snake gefüllt)
    newSnakeY[i] = snakeY[i];
  }
  
  snakeX = newSnakeX; //überschreibe altes Array mit dem Neuen.
  snakeY = newSnakeY;
}
//Zeichenfunktionen

void drawCell( int[] cell){
    int x = cell[0] * cellSize + cellSize/2; //Pixel-Koordinaten werden aus der Zelle herausgerechnet.
    int y = cell[1] * cellSize + cellSize/2;  
    ellipse(x,y,20 ,20);
}

void drawSnake(){
  for( int i = 0; i < snakeLength; i++){
    int[] cell = {snakeX[i], snakeY[i]}; //führe drawCell für jede Zelle der Schlange einmal aus.
    drawCell(cell);
  } 
}
