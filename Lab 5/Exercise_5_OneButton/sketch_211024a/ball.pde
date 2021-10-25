class ball extends movingObject {
  PImage sprite;
  
  ball(PVector inPos, PVector inVel, PVector inAcc, PImage inSprite) {
    super(inPos, inVel, inAcc);
    
    sprite = inSprite;
  }
  
  void sim() {
    image(sprite, position.x, position.y);
    
    applyV();
    applyA();
  }
  
  void bounce() {
    velocity.x = velocity.x * -0.5;
  }
}
