class Score {
  PFont myFont;
  
  int score;
  int bestScore;
  
  boolean renderScore = true;
  
  void showScore(){
    fill(255,223,0);
    myFont = createFont("Pixeled", 16);
    textFont(myFont);
    text("score: " + score, 750, 25);
  }
  
   void renderScore(Boolean showScore){
    renderScore= showScore;
  }
  
  void addScore(){
  
    score = score + 5;
  }

// This function will show the best score 
    void showBestScore(){
    fill(255, 0, 0);
    bestScore = score;
    myFont = createFont("Pixeled", 16);
    textFont(myFont);
    text("Best Score: " + bestScore, 450, 450);
  }

//This function is a getter which will return the score
  int getScore(){
  
    return score;
  }

  //This function will reset the score
  void reset() {
   score = 0; 
  }
}
