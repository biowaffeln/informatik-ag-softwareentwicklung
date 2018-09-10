void setup() {
  size(500, 500);
  textSize(32);
}

float paddleHeight = 200;
float ballX = 50;
float ballY = 50;
float xSpeed = 4;
float ySpeed = random(3, 5);

boolean gameOver = false;
int score = 0;

void draw() {
  
  background(20);
  
  if(gameOver) {
    textSize(64);
    text("game over", 20, 100);
    text("score: " + score, 20, 200);
    return;
  }
  
  text(score, 20, 50);
  
  ball(ballX, ballY);
  paddle(mouseY, paddleHeight);
  
  ballX += xSpeed;
  ballY += ySpeed;
  
  if(collision()) {
    xSpeed = Math.max(-30, -xSpeed - 0.5);
    paddleHeight = Math.max(100, paddleHeight - 4);
    score++;
  }
  else if(ballX <= 0) {
    xSpeed = -xSpeed;
  }
  else if(ballY <= 0) {
    ballY = 0;
    ySpeed = -ySpeed;
  }
  else if(ballY >= height) {
    ballY = height;
    ySpeed = -ySpeed;
  }
  else if(ballX > width) {
    gameOver = true;
  }
}

boolean collision() {
  return
    (ballX >= width - 40)
    && (ballX <= width - 37)
    && (ballY > mouseY - paddleHeight/2 - 5)
    && (ballY < mouseY + paddleHeight/2 + 5);
}

void paddle(float y, float pHeight) {
  rect(width - 40, y - pHeight/2, 20, pHeight );
}

void ball(float x, float y) {
  ellipse(x, y, 20, 20);
}
