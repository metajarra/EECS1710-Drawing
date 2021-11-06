class movingObject {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  movingObject(PVector inPos, PVector inVel, PVector inAcc) {
    position = new PVector(inPos.x, inPos.y);
    velocity = new PVector(inVel.x, inVel.y);
    acceleration = new PVector(inAcc.x, inAcc.y);
  }
  
  void applyV() {
    PVector outPos = new PVector();
    outPos.x = position.x + velocity.x;
    outPos.y = position.y + velocity.y;
    
    position = new PVector(outPos.x, outPos.y);
  }
  
  void applyA() {
    PVector outVel = new PVector();
    outVel.x = velocity.x + acceleration.x;
    outVel.y = velocity.y + acceleration.y;
    
    velocity = new PVector(outVel.x, outVel.y);
  }
}
