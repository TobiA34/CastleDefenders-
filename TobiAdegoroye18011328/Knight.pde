class Knight {    //<>//

  Devil devil;

  PImage[] knightWalk = new PImage[10];
  PImage[] knightAttack =new PImage[7];
  PImage knightAid;

  float x, y, speedX, speedY, w, h;
  float  aidX = 20, aidY = 5;
  int walkCounter;
  int attackCounter;

  int strength = 20;
  int aid = 0;

  Boolean renderKnightWalk = false;
  Boolean renderKnight = false;
  Boolean renderKnightAttack = false;
  Boolean hasCollided = false;

  Knight() {
    this.x = 650;
    this.y = 300;
    this.w = 30;
    this.h = 50;
    this.speedX = random(20);
    this.speedY = 1;

    knightAid = loadImage("knightAid.png");

    knightWalk[0] = loadImage("knightWalk1.png");
    knightWalk[1] = loadImage("knightWalk2.png");
    knightWalk[2] = loadImage("knightWalk3.png");
    knightWalk[3] = loadImage("knightWalk4.png");
    knightWalk[4] = loadImage("knightWalk5.png");
    knightWalk[5] = loadImage("knightWalk6.png");
    knightWalk[6] = loadImage("knightWalk7.png");
    knightWalk[7]= loadImage("knightWalk8.png");
    knightWalk[8] = loadImage("knightWalk9.png");
    knightWalk[9] = loadImage("knightWalk10.png");

    knightWalk[0].resize(30, 50);
    knightWalk[1].resize(30, 50);
    knightWalk[2].resize(30, 50);
    knightWalk[3].resize(30, 50);
    knightWalk[4].resize(30, 50);
    knightWalk[5].resize(30, 50);
    knightWalk[6].resize(30, 50);
    knightWalk[7].resize(30, 50);
    knightWalk[8].resize(30, 50);
    knightWalk[9].resize(30, 50);

    knightAttack[0] = loadImage("knightAttack1.png");
    knightAttack[1] = loadImage("knightAttack2.png");
    knightAttack[2] = loadImage("knightAttack3.png");
    knightAttack[3] = loadImage("knightAttack4.png");
    knightAttack[4] = loadImage("knightAttack5.png");
    knightAttack[5]  = loadImage("knightAttack6.png");
    knightAttack[6] = loadImage("knightAttack7.png");
  }

  void update() {
    move();
    renderAttack();
  }

  //This function will show the strenght
  void showStrength() {
    textSize(15);
    text("Strength: " + strength, 140, 25);
    if (strength <= 1 ) {
      strength += 1;
    }
  }

  //Whis function will show the aid on the screen
  void showAid() {
    knightAid.resize(45, 40);
    image(knightAid, aidX, aidY);
  }
  void setAid() {
    aid += 1;
  }
  
  //When the game is started then it will reset the aid
  void resetAid() {
    aid = 0;
  }

  //When the game is started then it will reset the strength
  void resetStrength() {
    strength = 20;
  }

  //This checks to see if the mouse has been clicked near the aid picture and if it has then it will add the strength to the knight
  void mouseClicked() {
    if ( mouseX > aidX && mouseX < (aidX + knightAid.width) &&
      mouseY > aidY && mouseY < (aidY + knightAid.height)) {
      if (mousePressed) {
        addStrength();
      }
    }
  }

 //This function will subtract strenght
  void subtractStrength() {
    strength -= 4;
  }

  //This function will add strength to the character 
  void addStrength() {
    delay(60);
    strength += getAid();
    delay(60);
  }


//This function will do some logic for example the attackCounter is divided by the 20 updates per frame then modulo 7 which is stored in animationFrame then i set the image by using the devil walk and passing the animationFrame as a paramater then i set the x and y
  void renderAttack() {
    int animationFrame = (attackCounter/20)%7;
    if (renderKnightWalk) {
      image(knightAttack[animationFrame], x, y);
    }
    attackCounter++;
  }

//This function will do some logic for example the walkCounter is divided by the 20 updates per frame then modulo 10 which is stored in animationFrame then i set the image by using the devil walk and passing the animationFrame as a paramater then i set the x and y
  void renderWalk() {
    int animationFrame = (walkCounter/20)%10;
    if (renderKnightWalk) {
      image(knightWalk[animationFrame], x, y);
    }
    walkCounter++;
  }

 //This method will return the knight x position
  float getX() {
    return this.x;
  }

 //This method will return the knight y position
  float getY() {
    return this.y;
  }

  //This method will return the knight w position
  float getW() {
    return this.w;
  }

   //This method will return the knight h position
  float getH() {
    return this.h;
  }

 //This method will return the knight aid
  int getAid() {
    return aid;
  }

  //This function will draw the knight walk if it is true or it won't draw the knight walk if it is false
  void drawKnightWalk(Boolean drawKnightWalk) {
    renderKnightWalk= drawKnightWalk;
  }
  
  //This function will draw the knight attack if it is true or it won't draw the knight attack if it is false
  void drawKnightAttack(Boolean drawKnightAttack) {
    renderKnightAttack = drawKnightAttack;
    renderAttack();
  }
  
  //This function will draw the knight  if it is true or it won't draw the knight  if it is false
  void drawKnight(Boolean drawKnight) {
    renderKnight = drawKnight;
    renderWalk();
  }

  // This function will check to see if the knight is colliding with an object and it will return the variable hasCollided which is set to false by defualt
  boolean isColliding() {

    return this.hasCollided;
  }

 // This function checks to see if the knight is colliding with the devil
  boolean isTouching(Devil devil) {

    this.hasCollided = false;

    if (this.x < devil.getX() + devil.getW() &&
      this.x + this.w > devil.getX() &&
      this.y < devil.getY() + devil.getH() &&
      this.h + this.y > devil.getY()) {

      this.hasCollided = true;
      drawKnightWalk(false);
      subtractStrength();
      setAid();
      return true;
    }

    return false;
  }

  // This function moves the knight by using the lerp function and use the mouseX and mouseY as the target
  void move( ) {
    smooth();
    x = lerp(x, mouseX, 0.060);

    smooth();
    y = lerp(y, mouseY, 0.060);
  }
}
