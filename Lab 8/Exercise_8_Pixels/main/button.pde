class button extends voxel {
  matrix m;
  scoreManager sm;
  color c;
  
  button(PVector inPos, color inC, matrix inM, scoreManager inSM) {
    super(inC, inPos, 32);
    c = inC;
    m = inM;
    sm = inSM;
  }
  
  void check() {
    sim();
    
    if(get(mouseX, mouseY) == c && mousePressed) {
      if(c == color(255, 0, 0)) {
        m.sortRed();
        sm.sort = "amount of red";
      } 
      
      else if (c == color(0, 255, 0)) {
        m.sortGreen();
        sm.sort = "amount of green";
      }
      
      else if (c == color(0, 0, 255)) {
        m.sortBlue();
        sm.sort = "amount of blue";
      }
      
      else if (c == color(64, 64, 64)) {
        m.sortBright();
        sm.sort = "brightness";
      }
      
      else if (c == color(255, 128, 0)) {
        m.sortSat();
        sm.sort = "saturation";
      }
    }
  }
}
