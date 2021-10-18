class hive {
  ArrayList<gatherer> gatherers = new ArrayList<gatherer>();
  ArrayList<scout> scouts = new ArrayList<scout>();
  
  ArrayList<PVector> foodPos = new ArrayList<PVector>();
  ArrayList<food> foodStores = new ArrayList<food>();

  PVector pos;
  PShape sprite;
  PShape antSprite;
  
  int foodGathered;
  int foodKnown;
  
  hive(PVector inPos, PShape inSprite, PShape inAnt) {
    pos = new PVector(inPos.x, inPos.y);
    sprite = inSprite;
    antSprite = inAnt;
  }
  
  void sim() {
    shape(sprite, pos.x - 2, pos.y - 2, 8, 8);
    
    for (int i = 0; i < scouts.size() - 1; i++) {
      scouts.get(i).sim();
      if (scouts.get(i).pos.x == pos.x && scouts.get(i).pos.y == pos.y) {
        setTarget(scouts.get(i), new PVector(random(width + 1), random(height + 1)));
        scouts.get(i).foodFound = false;
      }
    }
    
    /*
    for (int i = 0; i < gatherers.size() - 1; i++) {
      gatherers.get(i).sim();
      if (gatherers.get(i).pos.x == pos.x && gatherers.get(i).pos.y == pos.y) {
        int x = int(random(foodPos.size()));
        
        setTarget(gatherers.get(i), new PVector(foodPos.get(x).x, foodPos.get(x).y));
      }
    }*/
  }
  
  void addG() {
    gatherers.add(new gatherer(pos, antSprite, gatherers.size()));
  }
  
  void addS() {
    scouts.add(new scout(pos, antSprite, scouts.size(), this));
  }
  
  void setTarget(ant a, PVector targetSet) {
    a.target = targetSet;
  }
}
