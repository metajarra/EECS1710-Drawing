class ballSpawner {
  PVector spawnPoint;
  PVector spawnVel;
  
  public ball ball;
  scoreManager manager;
  public int score;
  
  ballSpawner( ball inBall, scoreManager inManager) {
    spawnPoint = new PVector(width + 100, 0);
    spawnVel = new PVector(-40, -5);
    
    ball = new ball(inBall.position, inBall.velocity, inBall.acceleration, inBall.sprite);
    manager = inManager;
  }
  
  void sim() {   
    if(ball.position.y > height + 3000) {    
      spawnRand();
    }
  }
  
  void spawnRand() {
    spawnPoint.y = int(random(height / 2)) + 50;
    spawnVel.x = (int(random(15)) * -1) - 25;
    
    ball.position = new PVector(spawnPoint.x, spawnPoint.y);
    ball.velocity = new PVector(spawnVel.x, spawnVel.y);
    
    
    if(manager.currentGoal && manager.score > 0) {
      manager.score--;
    } else if (manager.currentDefense) {
      manager.score++;
    }
    
    manager.currentGoal = false;
    manager.currentDefense = false;
  }
}
