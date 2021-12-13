import themidibus.*;
import java.util.ArrayList;

ArrayList<Layer> layers;

ToneLine line;
Boolean moving;

void setup() {
  size(1024, 1024);
  background(0, 0, 0);
    
  layers = new ArrayList<Layer>();
  layers.add(new Layer(new PVector(width / 6, height / 6))); // create drawLayer with 66% width and height of window
    
  line = new ToneLine(new PVector(0, 5 * (height / 6)), new PVector(width, 5 * (height / 6)));
  moving = false;
  
  textSize(24);
  textAlign(CENTER);
}

void draw() {
  clear();
  
  fill(255, 255, 255);
  rect(width / 6, height / 6, int(width * 0.66), int(height * 0.66)); // illusion of drawLayer: projects a white rectangle with same dimensions as drawLayer

  text("Try clicking or drawing!", 140, 40);

  // setup play and pause buttons
  rect(21 * (width / 24), height / 6, width / 12, height / 12);
  rect(21 * (width / 24), 7 * (height / 24), width / 12, height / 12);
  fill(64, 64, 64);

  text("PLAY", 22 * (width / 24), 5 * height / 24);
  text("PAUSE", 22 * (width / 24), 8 * (height / 24));

  if(mouseInRect(21 * (width / 24), height / 6, width / 12, height / 12) && mousePressed) {
    moving = true;
  }  else if(mouseInRect(21 * (width / 24), 7 * (height / 24), width / 12, height / 12) && mousePressed) {
    moving = false;
  }
  
  for(int i = 0; i < layers.size(); i++) {
    layers.get(i).sim(); // simulate each layer in layers[]
    layers.get(i).moving = moving;
  }
  
  if(layers.get(layers.size() - 1).position.y > height / 6) {
    layers.add(new Layer(new PVector(width / 6, layers.get(layers.size() - 1).position.y - int(height * 0.66)))); // once the top edge of a layer goes below the rectangle, add another
  }
  if(layers.get(0).position.y > height) {
    layers.remove(0); // if a layer is no longer visible, remove it
  }
  
  line.checkForRedPixelsAndPlay(); // self explanatory
}

public Boolean mouseInRect(int xPos, int yPos, int xDimension, int yDimension) { // checks if mouse is in bounds of given rectangle
  Boolean xIn = false; Boolean yIn = false; Boolean in = false;
  if(mouseX > xPos && mouseX < xPos + xDimension) {
    xIn = true;
  }
  
  if(mouseY > yPos && mouseY < yPos + yDimension) {
    yIn = true;
  }
  
  if(xIn && yIn) {
    in = true;
  }
  
  return in;
}
