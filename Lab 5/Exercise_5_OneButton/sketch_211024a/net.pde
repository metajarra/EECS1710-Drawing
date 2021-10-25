class net {
  PImage sprite;
  PVector position;
  PVector line;
  
  ball ball;
  scoreManager manager;
  
  net(PImage inSprite, PVector inPos, PVector inLine, ball inBall, scoreManager inManager) {
    sprite = inSprite;
    
    position = new PVector(inPos.x, inPos.y);
    line = new PVector(inLine.x, inLine.y);
    
    ball = new ball(inBall.position, inBall.velocity, inBall.acceleration, inBall.sprite);
    manager = inManager;
  }
  
  void sim() {
    image(sprite, position.x, position.y);
    collisionDetect();
  }
  
  void collisionDetect() {
    if(ball.position.x < line.x && ball.position.x > line.x / 2 & ball.position.y > position.y && ball.position.y < 836) {
      manager.currentGoal = true;
    } else if (ball.position.x < line.x / 2 && ball.position.x > 0 && ball.position.y > position.y + (position.y * 0.6) && ball.position.y < 836) {
      manager.currentGoal = true;
    }
  }
}
