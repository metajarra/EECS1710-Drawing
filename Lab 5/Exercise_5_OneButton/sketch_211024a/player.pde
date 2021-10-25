class player extends movingObject {
  PImage sprite; PImage sprite2;
  PVector startPos;
  Boolean isGrounded;
  ball ball;
  scoreManager manager;
  
  player(PVector inPos, PVector inVel, PVector inAcc, PImage inSprite, PImage inSprite2, ball inBall, scoreManager inManager) {
    super(inPos, inVel, inAcc);
    startPos = new PVector(inPos.x, inPos.y);
    
    sprite = inSprite; sprite2 = inSprite2;
    isGrounded = true;
    
    ball = inBall;
    manager = inManager;
  }
  
  void sim() {
    if(position.y > startPos.y) {
      position.y = startPos.y;
      isGrounded = true;
    }
    
    if(isGrounded) {
      image(sprite, position.x, position.y);
    } else {
      image(sprite2, position.x, position.y);
    }
    
    
    if(isGrounded) {
      velocity.y = 0;
      acceleration.y = 0;
    }
    
    if(keyPressed) {
      jump();
    }
    
    if(ball.position.x < position.x + 50 && ball.position.x > position.x) {
      if(ball.position.y > position.y - 35 && ball.position.y < position.y + 165) {
        ball.bounce();
        manager.currentDefense = true;
      }
    }
    
    applyV();
    applyA();
  }
  
  void jump() {
    if(isGrounded) {
      velocity.y = -25;
      acceleration.y = 0.98;
      isGrounded = false;
    }
  }
}
