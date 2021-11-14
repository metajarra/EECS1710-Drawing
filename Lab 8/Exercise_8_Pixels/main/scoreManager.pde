class scoreManager {
  public String sort;
  
  scoreManager(String inSort) {
    sort = inSort;
  }
  
  void show() {
    String outText = "Currently sorting by: " + sort;
    textSize(24);
    fill(255, 255, 255);
    text(outText, 20, 50, 500);
  }
}
