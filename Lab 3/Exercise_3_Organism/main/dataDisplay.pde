class dataDisplay {
  PVector pos;
  String text;
  public int data;
  
  dataDisplay(PVector inPos, String inText, int inData) {
    pos = new PVector(inPos.x, inPos.y);
    text = inText;
    data = inData;
  }
  
  void show() {
    String outText = text + data;
    text(outText, pos.x, pos.y);
  }
}
