class bird extends movingObject {
  PImage sprite;
  
  bird(PVector inPos, PVector inVel, PVector inAcc, PImage inSprite) {
    super(inPos, inVel, inAcc);
    sprite = inSprite;
  }
  
  void sim() {
    jump(); 
    
    applyV();
    applyA();
    
    image(sprite, position.x, position.y, 85, 60);
    //ellipse(position.x, position.y, 50, 50);
  }
  
  void jump() {
    if(amp > 0.01) {
      super.velocity = new PVector(0, -amp * 200);
    }
  }
}
