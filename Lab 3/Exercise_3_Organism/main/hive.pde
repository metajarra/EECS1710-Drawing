class hive {
  ArrayList<gatherer> gatherers = new ArrayList<gatherer>();
  ArrayList<scout> scouts = new ArrayList<scout>();
  
  ArrayList<PVector> foodPos = new ArrayList<PVector>();

  PVector pos;
  PShape sprite;
  PShape antSprite;
  PShape gathererSprite;
  
  public float foodGathered;
  public float foodVisited;
  float foodKnown;
  
  hive(PVector inPos, PShape inSprite, PShape inAnt, PShape inGatherer) {
    pos = new PVector(inPos.x, inPos.y);
    sprite = inSprite;
    antSprite = inAnt;
    gathererSprite = inGatherer;
    
    foodGathered = 100;
  }
  
  void sim() {
    shape(sprite, pos.x - 2, pos.y - 2, 8, 8);
    
    if(gatherers.size() == 0 && foodPos.size() >= 1) {
      println("STARTING GATHER");
      foodGathered += 10; addG(); addG();
    }
    
    foodKnown = foodPos.size();
    
    for (int i = 0; i < scouts.size() - 1; i++) {
      scouts.get(i).sim();
      if (scouts.get(i).pos.x == pos.x && scouts.get(i).pos.y == pos.y) {
        setTarget(scouts.get(i), new PVector(random(width + 1), random(height + 1)));
        scouts.get(i).foodFound = false;
      }
    }
    
    for (int i = 0; i < gatherers.size() - 1; i++) {
      gatherers.get(i).sim();
      if (gatherers.get(i).pos.x == pos.x && gatherers.get(i).pos.y == pos.y) {
        int x = int(random(foodPos.size()));
        
        setTarget(gatherers.get(i), new PVector(foodPos.get(x).x, foodPos.get(x).y));
      }
    }
    
    
    if (foodVisited >= foodKnown * 0.8 && foodGathered >= 5) {
      addS(); foodGathered -= 5;
    } else if (foodGathered >= 5 && foodKnown >= 1) {
      addG(); foodGathered -= 5;
    }
  }
  
  void addG() {
    gatherers.add(new gatherer(pos, gathererSprite, gatherers.size(), this));
    int x = int(random(foodPos.size()));
    setTarget(gatherers.get(gatherers.size() - 1), new PVector(foodPos.get(x).x, foodPos.get(x).y));
    //println("spawned gatherer", gatherers.size() - 1);
  }
  
  void addS() {
    scouts.add(new scout(pos, antSprite, scouts.size(), this));
    setTarget(scouts.get(scouts.size() - 1), new PVector(random(width + 1), random(height + 1)));
    //println("spawned scout", scouts.size() - 1);
  }
  
  void setTarget(ant a, PVector targetSet) {
    a.target = targetSet;
  }
}
