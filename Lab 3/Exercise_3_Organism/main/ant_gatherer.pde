class gatherer extends ant {
  Boolean foodStored;
  hive h;
  
  gatherer(PVector inPos, PShape inSprite, int inIndex, hive inHive) {
    super(inPos, inSprite, inIndex);
    
    h = inHive;
    
    target = new PVector();
    foodStored = false;
  }
  
  void sim() {
    render();
    moveTo(target);
    
    if(pos.x == target.x && pos.y == target.y) {
      returnToHive();
    }
    
    if(pos.x == origin.x && pos.y == origin.y) {
      h.foodGathered += 2.5;
      h.foodVisited += 1;
    }
  }
}
