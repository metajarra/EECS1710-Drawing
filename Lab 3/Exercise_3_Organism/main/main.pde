import java.util.ArrayList;

ArrayList<food> foods = new ArrayList<food>(1024);
PVector addFood;

int x;
hive h; PVector hivePos;

PShape foodSprite;
PShape targetSprite;
PShape antSprite;
PShape gathererSprite;
PShape hiveSprite;

dataDisplay scoutNum;
dataDisplay gathererNum;
dataDisplay foodStored;
dataDisplay foodFound;

void setup() {
  background(0, 0, 0);
  size(1024, 1024, P3D);
  
  x = 0;
  
  foodSprite = loadShape("food.svg");
  targetSprite = loadShape("indicator.svg");
  antSprite = loadShape("organism.svg");
  gathererSprite = loadShape("gatherer.svg");
  hiveSprite = loadShape("indicator.svg");
  
  addFood = new PVector(0, 0);
  for (int i = 0; i < 1024; i++) {
    if (i % 16 == 0) {
      addFood.x = int(random(897)) + 64;
      addFood.y = int(random(897)) + 64;
    } 
    
    else {
      addFood.x = int(random(40)) - 20 + addFood.x;
      addFood.y = int(random(40)) - 20 + addFood.y;
    }
    
    foods.add(new food(addFood, foodSprite));
  }
  
  hivePos = new PVector(int(random(width)), int(random(height)));
  h = new hive(hivePos, hiveSprite, antSprite, gathererSprite);
  
  scoutNum = new dataDisplay(new PVector(10, height - 40), "Number of scouts: ", h.scouts.size());
  gathererNum = new dataDisplay(new PVector(10, height - 20), "Number of gatherers: ", h.gatherers.size());
  foodStored = new dataDisplay(new PVector(10, height - 80), "Total food stored: ", int(h.foodGathered));
  foodFound = new dataDisplay(new PVector(10, height - 60), "Total food found: ", int(h.foodKnown));
}

void draw() {
  clear();
 
  for (int i = 0; i < 1024; i++) {
    foods.get(i).render();
  }
    
  h.sim();
  
  scoutNum.data = h.scouts.size();
  scoutNum.show();
  
  gathererNum.data = h.gatherers.size();
  gathererNum.show();
  
  foodStored.data = int(h.foodGathered);
  foodStored.show();
  
  foodFound.data = int(h.foodKnown);
  foodFound.show();
}
