void setup() {
  // blueRect();
  // blueRect(60, 60);
  // fuenfmalfuenf = quadrat(5);
  // print(fuenfmalfuenf); 
}

void blueRect() {
  fill(0, 0, 255);
  rect(20, 20, 50, 50);
}

void blueRect(float x, float y) {
  fill(0, 0, 255);
  rect(x, y, 50, 50);
}

int quadrat(int x) {
  return x * x;
}
