class food {
  PVector pos;
  PShape sprite;
  
  food(PVector inPos, PShape inSprite) {
    pos = new PVector(inPos.x, inPos.y);
    sprite = inSprite;
  }
  
  void render() {
    shape(sprite, pos.x, pos.y, 4, 4);
  }
}
