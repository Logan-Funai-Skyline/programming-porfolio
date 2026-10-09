class Button {
  //Member Variables
  float x, y, w, h, wider;
  char val;
  boolean hover;
  color c1, c2;

  //Constructor
  Button(float x, float y, float wider, char val) {
    this.x = x;
    this.y = y;
    this.wider = wider;
    w = 20;
    h = 20;
    this.val = val;
    hover = false;
    c1 = color(95);
    c2 = color(190);
  }

  //Member Methods
  void display() {
    rectMode (CENTER);
    textAlign(CENTER);
    if(hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    stroke(190);
    rect(x, y, w+wider, h, 4);
    stroke(0);
    fill(128, 256, 128);
    textSize(15);
    text(val, x, y+5);
  }


  void mouseOver(float tempX, float tempY) {
    if(tempX > x-(w+wider)/2 && tempX < x+(w+wider)/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
