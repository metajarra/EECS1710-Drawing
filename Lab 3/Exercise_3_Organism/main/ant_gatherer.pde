class gatherer extends ant {
  Boolean foodStored;
  
  gatherer(PVector inPos, PShape inSprite, int inIndex) {
    super(inPos, inSprite, inIndex);
    
    target = new PVector();
    foodStored = false;
  }
  
  void sim() {
    
  }
}
