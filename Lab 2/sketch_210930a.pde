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
titleText title2;
titleText title3;
titleText title4;
titleText title5;
titleText title6;
titleText title7;

swimmingObject fish;
swimmingObject squid;
swimmingObject _school1;
swimmingObject _school2;
swimmingObject _school3;

void setup() {
  size(1024, 1024, P3D);
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
  title1 = new titleText("ABYSSOPELAGIC ZONE", width / 2, height / 2, 75);
  title2 = new titleText("This program has 3 types of random encounter:", width/2, height/2 - 36, 150);
  title3 = new titleText("squid, fish, and school of fish (for parallax)", width/2, height/2 + 36, 150);
  title4 = new titleText("To activate a specific encounter,", width/2, height/2 - 36, 150);
  title5 = new titleText("modify the 'outRand' variable in the code", width/2, height/2 + 36, 150);
  title6 = new titleText("Otherwise, they will spawn randomly", width/2, height/2, 75);
  title7 = new titleText("Please do not fullscreen this program", width/2, height/2, 75);
  
  fish = new swimmingObject(4.0, 160, 80, glowfish);
  squid = new swimmingObject(6.0, 320, 240, squidswim1);

  _school3 = new swimmingObject(2.2, int(1820), int(1024), school3);
  _school2 = new swimmingObject(4.0, int(3640), int(1024), school2);
  _school1 = new swimmingObject(6.0, int(5460), int(1024), school1);
  
  
  _school3.y = 0;
  _school2.y = 0;
  _school1.y = 0;
}

void draw(){  
  // title section
  title1.display(); // displays "ABYSSOPELAGIC ZONE"
  if (title1.elapsed > 2 * title1.duration) {
    title2.display(); title3.display();
  } if (title2.elapsed > 1.5 * title2.duration) {
    title4.display(); title5.display();
  } if (title4.elapsed > 1.5 * title4.duration) {
    title6.display();
  } if (title6.elapsed > 2 * title6.duration) {
    title7.display();
  } if (title7.elapsed > 2 * title7.duration) {
    //image(marinesnow, 0, 0, width, height);
    if (!currentEncounter) {
      outRand = int(random(4)); // THIS IS THE OUTRAND VARIABLE. For fish, have it equal 1. For squid, have it equal 2. For a school of fish, have it equal 3. THIS IS THE OUTRAND VARIABLE
      randomEncounter(outRand);
      currentEncounter = true;
    }
    else {
      randomEncounter(outRand);
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
      textSize(48);
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
    y = int(random(height - h));
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
      if (fish.x - fish.w > width){
        fish.x = - fish.w;
        fish.y = int(random(height - fish.h));
        currentEncounter = false;
      }
      else {
        fish.swim();
      }
      break;
    case 1: // squid
      if (squid.x - squid.w > width){       
        squid.x = - squid.w;
        squid.y = int(random(height - squid.h));
        currentEncounter = false;
      }
      else {
        squid.pulseSwim();
      }
      break;
    case 2: // school of fish
      if (_school2.x == 2000){       
        _school1.x = - _school1.w;
        _school2.x = - _school2.w;
        _school3.x = - _school3.w;
        currentEncounter = false;
      }
      else {
        _school3.swim();
        _school2.swim();
        _school1.swim();
      }
      break;
    case 3:
      if (fish.x - fish.w > width){
        fish.x = - fish.w;
        fish.y = int(random(height - fish.h));
        currentEncounter = false;
      }
      else {
        fish.swim();
      }
      break;
    default:
      break;
  }
}
