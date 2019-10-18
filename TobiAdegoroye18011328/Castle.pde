class Castle {
  PImage[] fire = new PImage[4];
  PImage castle;
  float x;
  float y;
  float w;
  float h;
 

  boolean renderCastle = false;
  boolean renderCastleHealth = false;
  boolean renderFire = false;
  // I have set this variable to private because i don't want the user to change the health of the castle
  private int castleHealth = 100;
  int counter;

  Castle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    castle = loadImage("castle.png");
    fire[0] = loadImage("fire1.png");
    fire[1] = loadImage("fire2.png");
    fire[2] = loadImage("fire3.png");
    fire[3] = loadImage("fire4.png");
  }

  // This will reset the castle health
  void resetCastleHealth() {
    castleHealth = 100;
  }

  // This will render the castle
  void render() {
    castle.resize(230, 400);
    image(castle, x, y);
  }

  // Return the castle x
  private float getX() {
    return this.x;
  }

  // Return the castle y 
  private float getY() {
    return this.y;
  }

  // Return the castle w 
  private float getW() {
    return this.w;
  }

  // Return the castle h
  private float getH() {
    return this.h;
  }

  // Return the  castle health
  private int getCastleHealth() {
    return castleHealth;
  }

  // Return the  castle health
  void showCastleHealth() {
    text("castle health: " + castleHealth, 400, 25);
  } 

  // Subtract castle health
  void subtractCastleHealth() {
    castleHealth -= 8;
  }

  // Draw the castle if it is true or false
  private void drawCastle(Boolean drawCastle) {
    renderCastle= drawCastle;
    castle.resize(230, 400);
    image(castle, x, y);
  }

  //Draw castle health if it is true or not
  private void drawCastleHealth(Boolean drawCastleHealth) {
    renderCastleHealth = drawCastleHealth;
    text("castle health: " + castleHealth, 400, 25);
  }

  //This method will show the fire on the screen
  private void updateFire() {
    postionFire();
  }

  //This method will postion the fire
  private void postionFire() {
    if (getCastleHealth() <= 45) {
      renderFire(true, 830, 190);
      renderFire(true, 830, 390);
      renderFire(true, 860, 340);
    }
    if (getCastleHealth() <= 20) {
      renderFire(true, 850, 250);
      renderFire(true, 806, 450);
    }
    if (getCastleHealth() <= 5) {
      renderFire(true, 860, 450);
      renderFire(true, 810, 250);
      renderFire(true, 890, 460);
    }
  }

  //This method will render the fire if it is true and it will set the x and y position and the fire sequence
  private void renderFire(boolean drawFire, int x, int y) {
    renderFire = drawFire;
    if (counter < 10) {
      fire[0].resize(50, 70);
      image(fire[0], x, y);
    } else if (counter < 30) {
      fire[1].resize(50, 70);
      image(fire[1], x, y);
    } else if (counter < 50) {
      fire[2].resize(50, 70);
      image(fire[2], x, y);
    } else if (counter < 70) {
      fire[3].resize(50, 70);
      image(fire[3], x, y);
    } else { 
      counter = 0;
    }

    counter += 1;
  }
}
