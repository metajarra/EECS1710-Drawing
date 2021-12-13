class ToneLine {
  // these points define the line
  public PVector point1;
  public PVector point2;
  
  MidiBus bus;

  // these ArrayLists describe the X and Y coordinates of every pixel which is intersected by the line
  ArrayList<Integer> pixelsX;
  ArrayList<Integer> pixelsY;
  
  ToneLine(PVector inPoint1, PVector inPoint2) {
    point1 = new PVector(inPoint1.x, inPoint1.y);
    point2 = new PVector(inPoint2.x, inPoint2.y);
    
    pixelsX = new ArrayList<Integer>();
    pixelsY = new ArrayList<Integer>();
    
    MidiBus.list();
    bus = new MidiBus(this, -1, 2); // the output device here (third arg) should be a midi mapper - by default on my computer it is set to "Microsoft MIDI Mapper"
    
    getPixelsOnLine();
  }
  
  // continually checks the intersected pixels to see if any are red - if so, play a corresponding tone
  void checkForRedPixelsAndPlay() {   
    for(int i = 0; i < pixelsX.size(); i++) {
      if(get(pixelsX.get(i), pixelsY.get(i)) == color(255, 0, 0)) {
        bus.sendNoteOn(0, pixelsX.get(i) / 10, 150);
      }
    }
  }
  
  // called on startup. finds the coordinates of intersected pixels and adds them to pixelsX and pixelsY
  void getPixelsOnLine() {
    PVector checkPos = new PVector(point1.x, point1.y);
    
    // travels incrementally along the line from point1 to point2
    for(int i = 0; i < int(distance(point1, point2)); i++) {
      pixelsX.add(int(getNextPixel(checkPos, point1, point2).x));
      pixelsY.add(int(getNextPixel(checkPos, point1, point2).y));
      checkPos = getNextPixel(checkPos, point1, point2);
    }
  }
  
  // return the distance between two points
  float distance(PVector point1, PVector point2) {
    double dist; double distX; double distY;
    
    distX = point1.x - point2.x;
    distY = point1.y - point2.y;
    
    dist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));

    return (float)dist; // very strange casting double to float here
  }
  
  // increments along the line by a short distance (~0.3x the width of a pixel, depending on the equation of the line)
  // when a new pixel is found, return the vector coordinates
  PVector getNextPixel(PVector checkPos, PVector startPos, PVector endPos) {
    Boolean isOnNewPixel = false;
    PVector newCheckPos = new PVector(checkPos.x, checkPos.y);
    
    while(!isOnNewPixel) {
      PVector distanceVect = new PVector(
      startPos.x - endPos.x,
      startPos.y - endPos.y);
      
      if(Math.abs(distanceVect.x) > Math.abs(distanceVect.y)) { // if the x distance is greater than y distance
        distanceVect.x = distanceVect.x / (distanceVect.x * 5); // increment both proportionally to x distance
        distanceVect.y = distanceVect.y / (distanceVect.x * 5);
      } else{                                                   // otherwise increment proportionally to y distance
        distanceVect.x = distanceVect.x / (distanceVect.y * 5);
        distanceVect.y = distanceVect.y / (distanceVect.y * 5);
      }
      
      newCheckPos.x += distanceVect.x;
      newCheckPos.y += distanceVect.y;
      
      if(newCheckPos.x > checkPos.x + 1  // if has moved by 1 pixel in any direction
      || newCheckPos.x < checkPos.x - 1
      || newCheckPos.y > checkPos.y + 1
      || newCheckPos.y < checkPos.y - 1) {
        isOnNewPixel = true;
      }
    }
    
    return newCheckPos;
  }
}
