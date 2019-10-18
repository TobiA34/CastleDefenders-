
PFont startScreenFont;
PImage photo;

int walkCounter;

boolean renderStartScreen = true;

class StartScreen {
  
  
  void renderStartScreen(Boolean drawStartScreen) {
    renderStartScreen = drawStartScreen;
    photo = loadImage("knight.png");
    photo.resize(80, 150);
    image(photo, 420, 50);
    fill(255, 223, 0);
    startScreenFont = createFont("Pixeled", 28);
    textFont(startScreenFont);
    text("Devil Defenders", 290, 250);
    textSize(28);
    startScreenFont = createFont("Pixeled", 20);
    textFont(startScreenFont);
    text("click anywhere on the screen to Start Game", 150, 400);
    startScreenFont = createFont("Pixeled", 15);
    textFont(startScreenFont);
    text("goal: try to defend the castle and stop the devil invasion", 155, 500);
  }
  
}
