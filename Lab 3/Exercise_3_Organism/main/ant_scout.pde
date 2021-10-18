class scout extends ant {
  colourVector c1;
  colourVector c2;
  colourVector c3;
  colourVector c4;
  
  public Boolean foodFound;
  Boolean searchFreeze;
  hive h;
  
  int timer;
  
  scout(PVector inPos, PShape inSprite, int inIndex, hive inHive) {
    super(inPos, inSprite, inIndex);
    
    h = inHive;
    
    target = new PVector();
    foodFound = false;
    searchFreeze = false;
    
    timer = 0;
  }
  
  void sim() {   
    render();
    moveTo(target);
    search();
    
    if(pos.x == target.x && pos.y == target.y && target.x != origin.x && target.y != origin.y) {
      returnToHive(); 
    }
    
    if(foodFound) {
      returnToHive();
    }
  }
  
  void search() {   
    color _c1 = get(int(pos.x) + 6, int(pos.y) + 2);
    color _c2 = get(int(pos.x) - 2, int(pos.y) + 2);
    color _c3 = get(int(pos.x) + 2, int(pos.y) + 6);
    color _c4 = get(int(pos.x) + 2, int(pos.y) - 2);

    c1 = new colourVector(_c1, new PVector(int(pos.x) + 6, int(pos.y) + 2));
    c2 = new colourVector(_c2, new PVector(int(pos.x) - 2, int(pos.y) + 2));
    c3 = new colourVector(_c3, new PVector(int(pos.x) + 2, int(pos.y) + 6));
    c4 = new colourVector(_c4, new PVector(int(pos.x) + 2, int(pos.y) - 2));

    color cref = color(10, 255, 0);

    if(searchFreeze) {
      timer++;
      if(timer >= 50) {
        searchFreeze = false;
      }
    }

    if(!searchFreeze) {
        if(c1.c == cref) {
        h.foodPos.add(new PVector(c1.pos.x, c1.pos.y)); 
        foodFound = true;
      } else if (c2.c == cref) {
        h.foodPos.add(new PVector(c2.pos.x, c2.pos.y));
        foodFound = true;
      } else if (c3.c == cref) {
        h.foodPos.add(new PVector(c3.pos.x, c3.pos.y));
        foodFound = true;      
      } else if (c4.c == cref) {
        h.foodPos.add(new PVector(c4.pos.x, c4.pos.y));
        foodFound = true;
      }
    }    
    
    for(int i = 0; i < h.foodPos.size() - 1; i++) {      
      if(c1.posEquals(h.foodPos.get(i)) 
      || c2.posEquals(h.foodPos.get(i)) 
      || c3.posEquals(h.foodPos.get(i))
      || c4.posEquals(h.foodPos.get(i)))
      {
        foodFound = false; 
        searchFreeze = true;
        timer = 0;
      }
    }
  }
}

class colourVector {
  color c;
  PVector pos;
  
  colourVector(color inC, PVector inPos) {
    c = inC;
    pos = new PVector(inPos.x, inPos.y);
  }
  
  Boolean posEquals(PVector inTest) {
    if (inTest.x == pos.x && inTest.y == pos.y) {
      return true;
    } else {
      return false;
    }
  }
}
