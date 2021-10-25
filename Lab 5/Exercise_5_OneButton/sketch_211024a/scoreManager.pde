class scoreManager {
  public int score;
  public Boolean currentGoal;
  public Boolean currentDefense;
  PImage goal;
  PImage defense;
  
  scoreManager(PImage inGoal, PImage inDefense) {
    goal = inGoal;
    defense = inDefense;
    
    currentGoal = false;
    currentDefense = false;
  }
  
  void show() {
    textSize(36);
    String outText = "Score: " + score;
    text(outText, 20, 50);
    text("Press SPACE to jump", 20, 96);
    if(currentDefense) {
      defense(); 
    } else if(currentGoal) {
      goal();
    }
  }
  
  void goal() {
    image(goal, 0, 0);
  }
  
  void defense() {
    image(defense, 0, 0);
  }
}
