//Referenced the tutorial of Comsmos, https://m.blog.naver.com/cosmosjs/221164955455

//Words to avoid
//As a foreigner, I always have a
//fear of using the wrong(violent)
//Vocabularies according to my
//Ignorance.

//This is a word block breaking game
//Educating me terms and words to avoid

//Block falls when the ball hits the words
//And if the falling words hit the player,
//Player gets damage.

Ball ball;
Paddle paddle;
ArrayList<Block> blocks;

boolean gameStart = false;
boolean gameFinished = false;

String message;
String[] words;
PFont title;
PFont blockFont;
PImage finger;

void setup() { // Load words from a text file
  String[] lines = loadStrings("block.txt"); // Get the list of the words.
  String wordsList = join(lines, " ");
  words = split(wordsList, " ");  // Split the list to make the words into an array.
  size(600, 400);
  smooth();

  paddle = new Paddle();
  ball = new Ball();
  blocks = new ArrayList<Block>();
  // Create blocks in multiple rows
  for (int i = 0; i < 10; i++) {
    blocks.add(new Block((60 * i) + 30, 80, i));  // First row
    blocks.add(new Block((60 * i) + 30, 100, i + 10)); // Second row
    blocks.add(new Block((60 * i) + 30, 120, i + 20)); // Third row
    blocks.add(new Block((60 * i) + 30, 140, i + 30)); // Fourth row
  }
  // Load fonts and images
  title = loadFont("BradleyHandITC-48.vlw");
  blockFont = loadFont("Arial-BoldMT-12.vlw");
  finger = loadImage("finger.png");

  message = "Words to Avoid";
}

void draw() {
  background(0);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  textFont(title);
  text(message, width / 2, 50);

  // Move and display the paddle (controlled by the mouse)
  paddle.move();
  paddle.display();

  // Display blocks and check for collisions
  for (int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i); //Blocks need index for assignment of different words.
    block.display();
    // If the ball hits a block, remove it
    if (block.intersect(ball)) {
      ball.yspeed *= -1;  // Change direction
      blocks.remove(i);  // Remove block
      i--;   // Adjust index after removal

      if (blocks.isEmpty()) { // If all blocks are removed, restart the game
        gameStart = false;
        setup();
        message = "Stage Clear!";
      }
    }
  }

  // Move and display the ball if the game has started
  if (gameStart) {
    ball.display();
    ball.move();
    // Check if the ball collides with the paddle
    if (paddle.intersect(ball)) {
      ball.yspeed *= -1; // When ball lands on the paddle, change its direction
    }
  }
}
// Start the game when the mouse is clicked
void mousePressed() {
  if (!gameStart) {
    gameStart = true;
    message = "Shhhhhhh.....";
  }
}
