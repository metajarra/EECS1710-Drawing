import java.util.ArrayList;

ArrayList<fsupersponge> supersponges;

int camX; int camY; int camZ;
float camRX; float camRY;
int distance;

void setup() {
  size(1024, 1024, P3D);
  background(color(0, 0, 0));
   
   camX = width / 2;
   camY = height / 2;
   camZ = 1000;
   
   camRX = 0;
   camRY = 0;
   
   supersponges = new ArrayList<fsupersponge>();
   supersponges.add(new fsupersponge(27, new PVector(width / 2, height / 2, 0)));
    
  //ortho();
}

void keyPressed() {
    if(key == CODED) {
      if(keyCode == UP) {
        camZ -= 27;
      } else if(keyCode == DOWN) {
        camZ += 27;
      }
      
      if(keyCode == LEFT) {
        camX -= 27;
      } else if(keyCode == RIGHT) {
        camX += 27;
      }
      
      if(keyCode == SHIFT) {
        camY -= 27;
      } else if(keyCode == CONTROL) {
        camY += 27;
      }
    }
  }

void draw() {
  clear();
  
  if(mousePressed) {
    if(mouseX - width / 2 > 1) {
      camRX += 0.1;
    } else if(mouseX - width / 2 < 1) {
      camRX -= 0.1;
    }
    
    if(mouseY - height / 2 > 1) {
      camRY += 0.1;
    } else if(mouseY - height / 2 < 1) {
      camRY -= 0.1;
    }
  }
  
  camera(camX, camY, camZ, camX + camRX, camY + camRY, camZ - 10, 0, 1, 0);
      
  for(int i = 0; i < supersponges.size(); i++) {
    supersponges.get(i).sim();
  }
  
  for(int i = 0; i < 3; i++) {
    for(int j = 0; j < 3; j++) {
      for(int k = 0; k < 3; k++) {
        for(int l = 0; l < supersponges.size(); l++) {
          if(supersponges.get(l).sponges[i][j][k] != null && distanceTo(supersponges.get(l).sponges[i][j][k].position) < supersponges.get(l).sideLength * 20) {
            supersponges.get(l).sponges[i][j][k].fractal(supersponges);
          }
        }
      }
    }
  }
}

double distanceTo(PVector inPos) {
  PVector currentPos = new PVector(camX, camY, camZ);
  double diffX = currentPos.x - inPos.x;
  double diffY = currentPos.y - inPos.y;
  double diffZ = currentPos.z - inPos.z;
  
  return Math.sqrt(Math.pow(diffX, 2) + Math.pow(diffY, 2) + Math.pow(diffZ, 2));
}
