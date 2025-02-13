// Block Class
class Block {
  float x, y;
  color c;
  int index;

  Block(float x, float y, int index) {
    c = color(0);
    this.x = x;
    this.y = y;
    this.index = index;
  }
  // Display word on block
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(x, y, 60, 20);
    fill(255);
    textAlign(CENTER);
    textFont(blockFont);
    textSize(12);
    text(words[index], x, y); // Assign words to blocks
  }
  // Check if the ball collides with the block
  boolean intersect(Ball b) {
    float p1 = x - 30;
    float p2 = x + 30;
    return (b.y + b.radius > y && b.y + b.radius <= y + 20) && (b.x >= p1 && b.x <= p2);
  }
}
