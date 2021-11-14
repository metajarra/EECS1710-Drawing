class voxel {
  public color Colour;
  public PVector position;
  int size;
  
  voxel(color inC, PVector inPos, int inSize) {
    Colour = inC;
    position = new PVector(inPos.x, inPos.y, inPos.z);
    size = inSize;
  }
  
  void sim() {
    translate(position.x, position.y, position.z);
    fill(Colour);
    box(size);
    translate(-position.x, -position.y, -position.z);
  }
}
