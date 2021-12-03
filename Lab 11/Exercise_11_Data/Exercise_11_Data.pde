int[] lines;

void setup() {
  lines = new int[8];
  lines[0] = 86;
  lines[1] = 203;
  lines[2] = 67 + 27 + 142 + 16 + 13 + 76 + 76;
  lines[3] = 156;
  lines[4] = 20 + 40 + 27 + 31 + 59 + 35 + 45;
  lines[5] = 24 + 38 + 39 + 27 + 13 + 22;
  lines[6] = 43 + 77 + 73 + 14 + 18;
  lines[7] = 86 + 80 + 18 + 91;
  //lines[8] = 28;
  
  size(1024, 1024);
  background(0, 0, 0);
}

void draw() {
  clear();
  for(int i = 0; i < lines.length; i++) {
    rect((width / 16) * (i * 2 - 1) + width / 16 + width / 36, height - (height / 16) - lines[i], width / 16, lines[i]);
    textSize(24);
    text("Project: " + (i + 1) + "\nLines of\ncode: " + lines[i], 
    (width / 16) * (i * 2 - 1) + width / 16 + width / 36, 
    height - (height / 8) - (height / 32) - lines[i]);
  }
}
