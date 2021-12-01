class fsponge {
  fvoxel[][][] voxels;
  
  Boolean canBeSimmed;  
  
  float sideLength;
  public PVector position;
  
  fsponge(float inSize, PVector inPos) {
    sideLength = inSize;
    position = new PVector(inPos.x, inPos.y, inPos.z);
    
    canBeSimmed = true;
    
    voxels = new fvoxel[3][3][3];    
  }
  
  void reset() {
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        for(int k = 0; k < 3; k++) {
          voxels[i][j][k] = new fvoxel(position, sideLength);
          if(i == 0) {
            voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x - sideLength, voxels[i][j][k].position.y, voxels[i][i][k].position.z);
            if(j == 1 && k == 1) {
             voxels[i][j][k] = null;
           }
          } else if(i == 2) {
            voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x + sideLength, voxels[i][j][k].position.y, voxels[i][j][k].position.z);
            if(j == 1 && k == 1) {
             voxels[i][j][k] = null;
           }
          }
          
          if(j == 0) {
           voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x, voxels[i][j][k].position.y - sideLength, voxels[i][j][k].position.z);
           if(i == 1 && k == 1) {
             voxels[i][j][k] = null;
           }
          } else if(j == 2) {
            voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x, voxels[i][j][k].position.y + sideLength, voxels[i][j][k].position.z);
            if(i == 1 && k == 1) {
             voxels[i][j][k] = null;
           }
          }
          
          if(k == 0) {
            voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x, voxels[i][j][k].position.y, position.z - sideLength);
            if(i == 1 && j == 1) {
             voxels[i][j][k] = null;
           }
          } else if(k == 2) {
            voxels[i][j][k].position = new PVector(voxels[i][j][k].position.x, voxels[i][j][k].position.y, position.z + sideLength);
            if(i == 1 && j == 1) {
             voxels[i][j][k] = null;
           }
          }
          
          if(i == 1 && j == 1 && k == 1) {
            voxels[i][j][k] = null;
          }
        }
      }
    }
  }
  
  void sim() {
    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 3; j++) {
        for(int k = 0; k < 3; k++) {
          if(voxels[i][j][k] != null && canBeSimmed) {
            voxels[i][j][k].sim();
          }
        }
      }
    }
  }
  
  void fractal(ArrayList<fsupersponge> supersponges) {
    if(canBeSimmed) {
      fsupersponge thisSuper = new fsupersponge(sideLength / 3, position);
      supersponges.add(thisSuper);
    }
    canBeSimmed = false;
  }
}
