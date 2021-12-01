class fsupersponge {
  public fsponge[][][] sponges;
  
  float sideLength;
  public PVector position;
  
  fsupersponge(float inSize, PVector inPos) {
    
    sideLength = inSize;
    position = new PVector(inPos.x, inPos.y, inPos.z);
    
    sponges = new fsponge[3][3][3];    
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        for(int k = 0; k < 3; k++) {
          sponges[i][j][k] = new fsponge(sideLength, new PVector(position.x, position.y, position.z));
          println("created a new sponge", i, j, k);
          if(i == 0) {
            sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x - sideLength * 3, sponges[i][j][k].position.y, sponges[i][i][k].position.z);
            sponges[i][j][k].position = new PVector(position.x - sideLength * 3, sponges[i][j][k].position.y, sponges[i][j][k].position.z);
            println("SPONGE" , i, j, k, "MOVED TO", sponges[i][j][k].position);
            if(j == 1 && k == 1) {
             sponges[i][j][k] = null;
           }
          } else if(i == 2) {
            sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x + sideLength * 3, sponges[i][j][k].position.y, sponges[i][j][k].position.z);
            if(j == 1 && k == 1) {
             sponges[i][j][k] = null;
           }
          }
          
          if(j == 0) {
           sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x, sponges[i][j][k].position.y - sideLength * 3, sponges[i][j][k].position.z);
           if(i == 1 && k == 1) {
             sponges[i][j][k] = null;
           }
          } else if(j == 2) {
            sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x, sponges[i][j][k].position.y + sideLength * 3, sponges[i][j][k].position.z);
            if(i == 1 && k == 1) {
             sponges[i][j][k] = null;
           }
          }
          
          if(k == 0) {
            sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x, sponges[i][j][k].position.y, position.z - sideLength * 3);
            if(i == 1 && j == 1) {
             sponges[i][j][k] = null;
           }
          } else if(k == 2) {
            sponges[i][j][k].position = new PVector(sponges[i][j][k].position.x, sponges[i][j][k].position.y, position.z + sideLength * 3);
            if(i == 1 && j == 1) {
             sponges[i][j][k] = null;
           }
          }
          
          if(i == 1 && j == 1 && k == 1) {
            sponges[i][j][k] = null;
          }
          
          //println("sponge", i, j, k, "moved to position", sponges[i][j][k].position);
          if(sponges[i][j][k] != null) {
            sponges[i][j][k].reset();
          }
        }
      }
    }
  }
  
  void sim() {
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        for(int k = 0; k < 3; k++) {
          if(sponges[i][j][k] != null) {
            sponges[i][j][k].sim();
          }
        }
      }
    }
  }
}
