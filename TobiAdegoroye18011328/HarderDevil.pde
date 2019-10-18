class HarderDevil extends Devil{
  //I have inherited the devil x,y,w,h,speedX,speedY so that i don't have to repeat code
  HarderDevil(float x, float y, float w, float h, float speedX, float speedY ){
    super( x, y,  w, h,speedX, speedY);
       
    devilWalk[0].resize(80,120);
    devilWalk[1].resize(80,120);
    devilWalk[2].resize(80,120);
    devilWalk[3].resize(80,120);
  }
  
 //Here i have inherited the function move from the devil class
   void move(){
     super.move();
  }
  
   //Here i have inherited the function resetHealth from the devil class
  void resetHealth(){
      super.resetDevilHealth();
  }
  
  void update(){
    super.update();
  }
  
   //Here i have inherited the function subtractDevilHealth from the devil class
  void subtractDevilHealth(){
      super.subtractDevilHealth();
  }


void render() {
   super.render();
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

 //This method will check if the devil is off the screen and return it to its position
boolean isOfScreen() {
  return x + w <= width - 50;
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

 }
