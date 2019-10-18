 //<>//
Castle castle;
Devil devil;
HarderDevil harderDevil;
StartScreen startScreen;
Score score;
GameOverScreen gameOverScreen;



ArrayList devilCollection , harderDevilCollection;
 

Knight knight;

Boolean gameOver = false;
Boolean startGame = false;
Boolean restartGame = false;


void setup() {

  castle = new Castle(770, 150, 100, 100);
  devilCollection = new ArrayList();
  harderDevilCollection = new ArrayList();
  startScreen = new StartScreen();
  gameOverScreen = new GameOverScreen();
  score = new Score();
  createDevils(3);
  knight = new Knight();
  background(0);
  size(1000, 600);
} 

void draw() {

  if (gameOver) {

    background(0);
    showGameOver();
    score.showBestScore();
    return;
  }

  if (!startGame) {
    startScreen.renderStartScreen(true); // this will render that start screen if it is true
  } else {

    background(0);
    textSize(30);
    score.showScore();
    knight.showStrength();
    castle.drawCastleHealth(true);
    castle.drawCastle(true);
    knight.drawKnight(true);
    knight.showAid();
    knight.renderWalk();
    knight.mouseClicked();

    if (castle.getCastleHealth() <= 50) {
      castle.updateFire();
    } 

    // this checks to see if the castle health is 0 then it will set game over to true
    if (castle.getCastleHealth() <= 0) {
      gameOver = true;
    }

    // this checks to see if i is less than the devil collection size if it is then it will get the devil at the index and render the devil
    for (int i = 0; i < devilCollection.size(); i++) {
      Devil devil = (Devil) devilCollection.get(i);
      devil.update();
      devil.renderDevil = true;

     // This is the collison detection for the knight touching the devil then it will remove the devil out of the arraylist
      if (knight.isTouching(devil)) {

        devil.drawDevil(false);
        score.addScore();

        // this removes the devil at the index
        devilCollection.remove(i);

        SpawnDevils();
        knight.renderAttack();
        IncreaseDifficulty();
       
      } else {

        knight.drawKnightWalk(true);
      }
      
      // if the devil is touching the castle then it will remove the devil out of the arraylist and subtract the health of the castle
      if (devil.isTouching(castle)) {
        devil.x = 700; 
        devilCollection.remove(i);
        castle.subtractCastleHealth();
        SpawnDevils();
      }
    }
    // this will move the knight amywhere on the screen
    if (mousePressed == true) {
      knight.move();
    }
  }
}

// this function creates a devil and all you have to do is pass a number through the parameter
private void createDevils(int numberOfDevils) {
   // i am checking to see if i is less than number of devils if it is then it will create a new devil on the screen in a random position
  for (int i = 0; i < numberOfDevils; i++) {
    Devil devil = new Devil(30, random(93, 475), 20, random(1.2, 2), 100, 1);
    // This will add the devil to the array list
    devilCollection.add(devil);
  }
}

// this function creates a harder devil and all you have to do is pass a number through the parameter
private void createHarderDevils(int numberOfHarderDevils){
     // i am checking to see if i is less than number of devils if it is then it will create a new devil on the screen in a random position
  for (int i = 0; i < numberOfHarderDevils; i++) {
    HarderDevil harderDevil = new HarderDevil(30, random(90, 475), 20, 4, 100, 1);
    // This will add the devil to the array list
    devilCollection.add(harderDevil);
  }
}

private void SpawnDevils() {
  // if the size of the devil collection is less than or equal to 2 then it will add some new devils
  if (devilCollection.size() <= 2) {
    createDevils(5);
  }
}

// this function will show game over screen
private void showGameOver() {
  gameOverScreen.renderGameOverScreen(false);
  knight.drawKnight(false);
  knight.drawKnightWalk(false);
}

//This will resetart the game and it will reset everything in the game
private void restartGame() {
  castle.resetCastleHealth();
  gameOver = false;
  startGame = true;
  knight.drawKnightWalk(true);
  score.reset();
  devilCollection.clear();
  knight.resetStrength();
  knight.resetAid();
  createDevils(5);
}

void mouseClicked() {
// this if statement checks to see if start game is not true then when the user click the screen it will start the game 
  if (!startGame) {
    startGame = true;
    knight.drawKnightWalk(true);
  }
  // if game over is true then when the user clicks on the screen it will restart the game
  else if (gameOver) {
    restartGame();
  }
}

// This function will add new harder devils depending on the player score
void IncreaseDifficulty(){
 if (score.getScore() >= 300 && score.getScore() <= 320) {
          createHarderDevils(1);
        } 
        
        else if (score.getScore() >= 500 && score.getScore() <= 520) {
          createHarderDevils(1);
        } 
        else if (score.getScore() >= 600 && score.getScore() <= 620) {
          createHarderDevils(2);
        } 
        else if (score.getScore() >= 800 && score.getScore() <= 820) {
          createHarderDevils(2);
        } 
        else if (score.getScore() >= 900 && score.getScore() <= 920) {
          createHarderDevils(2);
        } 
        else if(score.getScore() >= 1000 && score.getScore() <= 1020){
           createHarderDevils(3);
        }
}
