color bg = color(0, 0, 0);

Boolean currentEncounter;
int outRand;

PImage glowfish;
PImage squidswim1;
PImage marinesnow;
PImage school1;
PImage school2;
PImage school3;

titleText title1;

swimmingObject fish;
swimmingObject squid;
swimmingObject _school1;
swimmingObject _school2;
swimmingObject _school3;

void setup() {
  fullScreen();
  background(bg);
  
  currentEncounter = false;
  outRand = -1;
  
  // image loading
  glowfish = loadImage("glowfish_1.png");
  squidswim1 = loadImage("squidswim1.png");
  marinesnow = loadImage("marinesnow.png");
  school1 = loadImage("school1.png");
  school2 = loadImage("school2.png");
  school3 = loadImage("school3.png");
  
  // titleText construction
  title1 = new titleText("ABYSSOPELAGIC ZONE", displayWidth / 2, displayHeight / 2, 75);
  
  fish = new swimmingObject(4.0, 160, 80, glowfish);
  squid = new swimmingObject(6.0, 320, 240, squidswim1);
  _school1 = new swimmingObject(6.0, int(displayWidth * 0.75), int(displayHeight * 0.75), school1);
  _school2 = new swimmingObject(3.0, int(displayWidth * 0.75), int(displayHeight * 0.75), school2);
  _school3 = new swimmingObject(1.0, int(displayWidth * 0.75), int(displayHeight * 0.75), school3);
  
  _school1.y = displayHeight/10;
  _school2.y = displayHeight/10;
  _school3.y = displayHeight/10;
}

void draw(){  
  // title section
  title1.display(); // displays "ABYSSOPELAGIC ZONE"
  
  // swimming fish
  if (title1.elapsed > 2 * title1.duration){
    //image(marinesnow, 0, 0, displayWidth, displayHeight);
    if (!currentEncounter) {
      outRand = int(random(3));
      randomEncounter(2);
      currentEncounter = true;
    }
    else {
      randomEncounter(2);
    }
  }
}

class titleText { // defines class for titleText, ie. disappearing text
  int x;
  int y;
  String text;
  public int duration;
  public int elapsed = 0;
  
  titleText(String inText, int inX, int inY, int inDuration) { // constructor
    text = inText;
    x = inX;
    y = inY;
    duration = inDuration;
  }
  
  void display() {
    elapsed++;
    
    if (elapsed < duration) { // displays text for duration
      textSize(96);
      textAlign(CENTER);
      
      text(text, x, y); // resets background
    } else {
      background(bg);
    }
  }
}

class swimmingObject{ // defines class for swimming object, eg. fish. this is done to have separate instances of a fish to refer to
  public int x;
  public int y;
  public float increment;
  public float inc2;
  
  int w;
  int h;
  
  PImage img;
  
  swimmingObject (float inIncrement, int inW, int inH, PImage inImg) {
    increment = inIncrement;
    inc2 = inIncrement;
    
    w = inW;
    h = inH;
    
    img = inImg;
    
    x = -inW;
    y = int(random(displayHeight));
  }
  
  void swim(){ // swims forward at a constant speed
    image(img, x, y, w, h);
    x += increment;
  }
  
  void pulseSwim(){ // swims forward in a pulsing way (imitating the swimming of a squid or octopus)
    image(img, x, y, w, h);
    increment -= 0.02;
    
    if (increment > 1) {
      x += increment;
    } else {
      x += increment;
      increment = inc2;
    }
  }
}

void randomEncounter(int inRand){
  switch(inRand){
    case 0: // fish
      if (fish.x - fish.w > displayWidth){
        fish.x = - fish.w;
        fish.y = int(random(displayHeight));
        currentEncounter = false;
      }
      else {
        fish.swim();
      }
      break;
    case 1: // squid
      if (squid.x - squid.w > displayWidth){       
        squid.x = - squid.w;
        squid.y = int(random(displayHeight));
        currentEncounter = false;
      }
      else {
        squid.pulseSwim();
      }
      break;
    case 2: // school of fish
      if (_school3.x - _school3.w > displayWidth){       
        _school1.x = - _school1.w;
        _school2.x = - _school2.w;
        _school3.x = - _school3.w;
        currentEncounter = false;
      }
      else {
        _school1.swim();
        _school2.swim();
        _school3.swim();
      }
      break;
    default:
      break;
  }
}
