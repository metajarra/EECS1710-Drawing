class matrix {
  voxel[][] voxels;
  public color[][] colours;
  
  matrix(color[][] inColours) {
    voxels = new voxel[128][128];
    colours = inColours;
  }
  
  void start() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j] = new voxel(colours[i][j], new PVector(i * 8, j * 8, 0), 8);
      }
    }
  }
  
  void sim() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].sim();
      }
    }
  }
  
  void sortRed() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, red(voxels[i][j].Colour));
      }
    }
  }
  
  void sortGreen() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, green(voxels[i][j].Colour));
      }
    }
  }
  
  void sortBlue() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, blue(voxels[i][j].Colour));
      }
    }
  }
  
  void sortBright() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, brightness(voxels[i][j].Colour));
      }
    }
  }
  
  void sortSat() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, saturation(voxels[i][j].Colour));
      }
    }
  }
  
  void sortHue() {
    for(int i = 0; i < 128; i++) {
      for(int j = 0; j < 128; j++) {
        voxels[i][j].position = new PVector(voxels[i][j].position.x, voxels[i][j].position.y, hue(voxels[i][j].Colour));
      }
    }
  }
}
