import java.util.ArrayList;

ArrayList<food> foods = new ArrayList<food>(1024);
PVector addFood;

int x;
hive h; PVector hivePos;

PShape foodSprite;
PShape targetSprite;
PShape antSprite;
PShape   hiveSprite;

void setup() {
  background(0, 0, 0);
  size(1024, 1024, P3D);
  
  x = 0;
  
  foodSprite = loadShape("food.svg");
  targetSprite = loadShape("indicator.svg");
  antSprite = loadShape("organism.svg");
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
  h = new hive(hivePos, hiveSprite, antSprite);
}

void draw() {
  clear();
  
  x++;
  if (x % 100 == 0 && x != 0) {
    h.addS();
    h.setTarget(h.scouts.get((x / 100) - 1), new PVector(int(random(width)), int(random(height))));
  }
  
  for (int i = 0; i < 1024; i++) {
    foods.get(i).render();
  }
  
  
  h.sim();
}
