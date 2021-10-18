class ant {
  public PVector pos;
  PShape sprite;
  int index;
  public PVector target;
  PVector origin;

  ant(PVector inPos, PShape inSprite, int inIndex) {
    pos = new PVector(inPos.x, inPos.y);
    sprite = inSprite;
    index = inIndex;

    target = new PVector();
    origin = new PVector(pos.x, pos.y);
  }

  void render() {
    shape(sprite, pos.x, pos.y, 4, 4);
  }

  void returnToHive() {
    target.x = origin.x;
    target.y = origin.y;
  }

  void moveTo(PVector target) {
    PVector newPos = new PVector();
    PVector relativePos = new PVector();

    relativePos.x = target.x - pos.x;
    relativePos.y = target.y - pos.y;

    if (relativePos.x > 0) {
      if (relativePos.x > 0.5) {
        newPos.x = pos.x + 0.5;
      } else {
        newPos.x = pos.x + relativePos.x;
      }
    } else if (relativePos.x < 0) {
      if (relativePos.x < -0.5) {
        newPos.x = pos.x - 0.5;
      } else {
        newPos.x = pos.x + relativePos.x;
      }
    } else {
      newPos.x = pos.x;
    }

    if (relativePos.y > 0) {
      if (relativePos.y > 0.5) {
        newPos.y = pos.y + 0.5;
      } else {
        newPos.y = pos.y + relativePos.y;
      }
    } else if (relativePos.y < 0) {
      if (relativePos.y < -0.5) {
        newPos.y = pos.y - 0.5;
      } else {
        newPos.y = pos.y + relativePos.y;
      }
    } else {
      newPos.y = pos.y;
    }

    pos = newPos;
  }
}
