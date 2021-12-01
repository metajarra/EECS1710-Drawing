class fvoxel {
  color drawColour;
  public PVector position;
  float sideLength;
  
  fvoxel(PVector inPos, float inSize) {
    drawColour = color(255, 255, 255);
    position = new PVector(inPos.x, inPos.y, inPos.z);
    sideLength = inSize;
  }
  
  void sim() {
    translate(position.x, position.y, position.z);
    fill(drawColour);
    box(sideLength);
    translate(-position.x, -position.y, -position.z);
  }
}
