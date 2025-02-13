// Ball Class
class Ball {
  float x, y, xspeed, yspeed, radius;

  Ball() {
    x = random(width);
    y = height - 25;
    xspeed = 4;
    yspeed = -4;
    radius = 5;
  }

  void move() {
    x += xspeed;
    y += yspeed;
    // Bounce off the walls
    if (x > width || x < 0) xspeed *= -1;
    if (y < 0) yspeed *= -1;
    // If the ball falls below the screen, restart the game
    if (y > height) {
      gameStart = false;
      setup(); // Reset game
      message = "Game Over";
    }
  }

  void display() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(x, y, radius * 2, radius * 2);
  }
}
