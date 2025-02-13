// Paddle Class
class Paddle {
  PVector pos;

  Paddle() {
    pos = new PVector(width / 2, height - 12);
  }

  void display() {
    fill(255);
    noStroke();
    imageMode(CENTER);
    image(finger, pos.x, pos.y, 100, 50);
  }
  // Move paddle based on mouse position
  void move() {
    pos.x = constrain(mouseX, 50, width - 50); // Moving the paddle
  }
  // Check if the ball collides with the paddle
  boolean intersect(Ball b) {
    float p1 = pos.x - 50;
    float p2 = pos.x + 50;
    return (b.y + b.radius >= pos.y - 30) && (b.x >= p1 && b.x <= p2);
  }
}
