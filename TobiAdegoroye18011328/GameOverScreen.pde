 
PFont myFont;
PImage knightHasDied, gameOverImage;
 
boolean renderGameOverScreen = true;

class GameOverScreen {


  //Show the game over screen 
  void renderGameOverScreen(boolean  drawGameOverScreen) {
    renderGameOverScreen= drawGameOverScreen;
    knightHasDied = loadImage("knightDead.png");
    knightHasDied.resize(90, 100);
    image(knightHasDied, 440, 20);
    gameOverImage = loadImage("gameOver.png");
    gameOverImage.resize(1000, 600);
    image(gameOverImage, 0, -100);
    textSize(65);
    fill(255, 0, 0);
     
    myFont = createFont("Pixeled", 16);
    textFont(myFont);
    text("click anywhere on the screen to restart Game", 260, 400);
  }
}
