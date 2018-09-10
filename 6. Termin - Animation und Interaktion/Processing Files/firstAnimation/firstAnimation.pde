void setup() {
  size(500, 500);
  // hier, oder in draw?
  background(30);
}

float x = 10;

void draw() {
  // 1. zeichnen
  rect(x, 230, 40, 40);
  // 2. bewegen
  x = x + 3;
}
