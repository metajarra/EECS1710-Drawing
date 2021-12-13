class Layer { 
  public PGraphics graphics;
  public PVector position;
  public int layerPosY;
  
  public Boolean moving;
  
  PVector lastMousePos; // records position of mouse in previous frame
  PVector mousePos; // gets position of mouse in current frame
  
  Layer(PVector inPos) {
    graphics = createGraphics(int(width * 0.66), int(height * 0.66));
    position = new PVector(inPos.x, inPos.y);
    layerPosY = int(position.y);
    
    moving = false;
    
    lastMousePos = new PVector();
    mousePos = new PVector();
    
    graphics.beginDraw();
    graphics.background(0, 0); // sets background to transparent
    graphics.endDraw();
  }
  
  void sim() {
    mousePos.x = mouseX - width / 6; // get mouse x position, adjust to align with drawLayer
    mousePos.y = mouseY - layerPosY; // get mouse y position, adjust to align with drawLayer
    
    graphics.beginDraw();
    
    position.y = layerPosY;
    
    graphics.stroke(color(255, 0, 0));
    graphics.strokeWeight(4);
    
    if(mousePressed 
    && mouseInRect(width / 6, height / 6, int(width * 0.66), int(height * 0.66)) 
    && mouseInRect(int(position.x), int(position.y), int(width * 0.66), int(height * 0.66))) {
      graphics.line(mousePos.x, mousePos.y, lastMousePos.x, lastMousePos.y); // draw line from previous to current mouse position
    }
    
    if(moving) {
      layerPosY++;
    }
    
    graphics.endDraw();
    
    image(graphics, position.x, position.y);
    
    // setup lastMousePos positions
    lastMousePos.x = mousePos.x;
    lastMousePos.y = mousePos.y;
  }
}
