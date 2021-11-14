import java.lang.Math;

matrix m;

button red; // this button sorts by amount of red per voxel
button green; // this button sorts by amount of green per voxel
button blue; // this button sorts by amount of blue per voxel
button brightness; // this button sorts by brightness of voxel
button saturation; // this button sorts by saturation of voxel

scoreManager s;

PImage test1;
PImage test2;
PImage test3;
PImage test4;

color[][] colours;

void setup() {
  background(255, 255, 255);
  size(1024, 1024, P3D);
  
  colours = new color[128][128];
  
  test1 = loadImage("picassotest.jpg");
  test1.resize(128, 128);
  
  test2 = loadImage("greatwavetest.jpg");
  test2.resize(128, 128);
  
  test3 = loadImage("starrynighttest.jpg");
  test3.resize(128, 128);

  test4 = loadImage("r2d2test.jpg");
  test4.resize(128, 128);
  
  image(test3, 0, 0); // hello, this is the line of code to modify to show the other images. change "test1" here to test2-test4 to display and process a different image
  
  for(int i = 0; i < 128; i++) {
    for(int j = 0; j < 128; j++) {
      colours[i][j] = get(i, j);
    }
  }
  
  m = new matrix(colours);
  m.start();
  m.sortSat();
  
  s = new scoreManager("saturation");
  
  red = new button(new PVector((width - width / 16), (height - height / 16), 500), color(255, 0, 0), m, s);
  green = new button(new PVector((width - width / 16), (height - 2 * (height / 16)), 500), color(0, 255, 0), m, s);
  blue = new button(new PVector((width - width / 16), (height - 3 * (height / 16)), 500), color(0, 0, 255), m, s);
  brightness = new button(new PVector((width - width / 16), (height - 4 * (height / 16)), 500), color(64, 64, 64), m, s);
  saturation = new button(new PVector((width - width / 16), (height - 5 * (height / 16)), 500), color(255, 128, 0), m, s);  
  
  ortho();
}

void draw() {
  background(255, 255, 255);
  
  camera((mouseX * 2) - width / 2, (mouseY * 2) - height / 2, 1000, width / 2, height / 2, 0, 0, 1, 0);
  
  m.sim();
  
  red.check();
  green.check();
  blue.check();
  brightness.check();
  saturation.check();
  
  s.show();
  fill(255, 255, 255);
  text("Try out the other images by modifying the code!", 20, 100, 499);
}
