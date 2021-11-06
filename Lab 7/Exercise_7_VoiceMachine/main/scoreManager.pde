class scoreManager {
  public int score;
  
  scoreManager(int inScore) {
    score = inScore;
  }
  
  void show() {
    textSize(36);
    String outText = "Score: " + score;
    text(outText, 20, 50);
  }
}
