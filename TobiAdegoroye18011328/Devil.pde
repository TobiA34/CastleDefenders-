class Devil{

  PImage[] devilWalk = new PImage[4];

  int counter;
  float x, y, w, speedX, h, speedY;
  Boolean renderDevil = false;  
  
  int targetX =770;
  int targetY = 150;
  //I have set this variable to private because i don't want the user to change the health of the devil
  private int devilLives = 3;

  Devil(float x, float y, float w, float speedX, float h, float speedY) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speedX = speedX;
    this.speedY = speedY;

    devilWalk[0] = loadImage("DevilWalk1.png");
    devilWalk[1] = loadImage("DevilWalk2.png");
    devilWalk[2] = loadImage("DevilWalk3.png");
    devilWalk[3] = loadImage("DevilWalk4.png");
   
    devilWalk[0].resize(50, 70);
    devilWalk[1].resize(50, 70);
    devilWalk[2].resize(50, 70);
    devilWalk[3].resize(50, 70);

  }

   
  //Reset devil health 
  void resetDevilHealth() {
    devilLives = 100;
  }

 //Subtract devil health
  void subtractDevilHealth() {
    devilLives = devilLives - 1;
  }

 

  void update() {
    move();
    render();
  }


  //This will check if the devil is off the screen then it will reset it's position
  boolean isOffScreen() {
    return (x >= 1000);
  }


  void move() {
    if (isOfScreen() == true) {
      x += speedX;
    } else {
      x = 0;
    }
    //This allows the devil to move to the castle
    lerp(random(100,700),targetX,0.01);
     lerp(random(100,700),targetY,0.01);
    
  }
  


//This function will do some logic for example the counter is divided by the 20 updates per frame then modulo 4 which is stored in animationFrame then i set the image by using the devil walk and passing the animationFrame as a paramater then i set the x and y
void render() {
   int animationFrame = (counter/20)%4;
       if (renderDevil) {
      image(devilWalk[animationFrame], x, y);
    }
  counter++;
}


//This collision method we check to see if the devil is touching the castle
boolean isTouching(Castle castle) {

  if (this.x < castle.getX() + castle.getW() &&
    this.x + this.w > castle.getX() &&
    this.y < castle.getY() + castle.getH()+ 500 &&
    this.h + this.y > castle.getY()) {
 
    return true;
  }
  return false;
}

//This method will draw the devil on the screen if the boolean is true
void drawDevil(Boolean drawDevil) {
  renderDevil= drawDevil;
}

//This method will return the devil x position
float getX() {
  return this.x;
}

//This method will return the devil width
float getW() {
  return this.w;
}

//This method will return the devil height
float getH() {
  return h;
}

//This method will return the devil y position
float getY() {
  return y;
}

//This method will return the devil lives
float getLives(){
  return devilLives;
}

//This method will check if the devil is off the screen and return it to its position
boolean isOfScreen() {
  return x + w <= width - 50;
}
}
