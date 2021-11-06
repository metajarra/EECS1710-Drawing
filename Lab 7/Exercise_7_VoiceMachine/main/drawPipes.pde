class drawPipes {
  PImage pipeUp;
  PImage pipeDown;
  
  PVector position;
  PVector velocity;
  
  drawPipes(PImage inSpriteUp, PImage inSpriteDown) {
    pipeUp = inSpriteUp;
    pipeDown = inSpriteDown;
    
    position = new PVector();
    velocity = new PVector(-5, 0);
  }
  
  void reset() {
    position = new PVector(width + 200, int(random(height / 5) + (2 * (height / 5))));
  }
    
  void sim() {
    applyV();
    
    image(pipeUp, position.x, position.y - 650, 180, 500);
    image(pipeDown, position.x, position.y + 150, 180, 500);
    
    if(position.x < -200) {
      reset();
    }
  }
  
  void applyV() {
    PVector outPos = new PVector();
    outPos.x = position.x + velocity.x;
    outPos.y = position.y + velocity.y;
    
    position = new PVector(outPos.x, outPos.y);
  }
}
