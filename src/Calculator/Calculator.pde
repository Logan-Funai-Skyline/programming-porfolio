//Logan Funai | 15 Sept 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[15];
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;

void setup() {
  size(210, 250);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  displayVal = "0.0";
  textSize(15);
  rectMode(CENTER);
  numButtons[0] = new Button(150, 30, 0, '0');
  numButtons[1] = new Button(60, 110, 0, '1');
  numButtons[2] = new Button(90, 110, 0, '2');
  numButtons[3] = new Button(120, 110, 0, '3');
  numButtons[4] = new Button(150, 110, 0, '4');
  numButtons[5] = new Button(30, 70, 0, '5');
  numButtons[6] = new Button(180, 70, 0, '6');
  numButtons[7] = new Button(60, 30, 0, '7');
  numButtons[8] = new Button(90, 30, 0, '8');
  numButtons[9] = new Button(120, 30, 0, '9');
  opButtons[0] = new Button(180, 30, 0, '÷');
  opButtons[1] = new Button(30, 30, 0, '×');
  opButtons[2] = new Button(30, 110, 0, '+');
  opButtons[3] = new Button(180, 110, 0, '-');
  opButtons[4] = new Button(120, 150, 0, '±');
  opButtons[5] = new Button(90, 150, 0, '.');
  opButtons[6] = new Button(50, 150, 20, 'R');
  opButtons[7] = new Button(160, 150, 20, '=');
  opButtons[8] = new Button(75, 190, 0, '√');
  opButtons[9] = new Button(135, 190, 0, '²');
  opButtons[10] = new Button(75, 220, 0, 's');
  opButtons[11] = new Button(105, 220, 0, 'c');
  opButtons[12] = new Button(135, 220, 0, 't');
  opButtons[13] = new Button(105, 190, 0, '%');
  opButtons[14] = new Button(175, 205, 30, '←');
}

void draw() {
  background((float(displayVal)/100)-1000, float(displayVal)*10+120, float(displayVal));
  drawDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  fill(240);
  rect(105, 70, 110, 40);
  fill(0);
  textAlign(RIGHT);
  text(displayVal, width-55, 75);
  //println(displayVal); //If you want it to write at the button
}

void mouseReleased() {
  //Update display with button clicked by user
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) { //== true is not nessecary just showing why it works
      handleEvent(numButtons[i].val, true);
    }
  }
  //Loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      handleEvent(opButtons[i].val, false);
    }
  }
  //Display variables
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("left:" + left);
  println("Op:" + op);
}
//    if (opButtons[i].val == '=') {
//      // Perform a calculation
//      performCalc();
//    } else if (opButtons[i].val == '+') {
//      displayVal = str(opButtons[i].val);
//      left = !left;
//      op = opButtons[i].val;
//    } else if (opButtons[i].val == '-') {
//      displayVal = str(opButtons[i].val);
//      left = !left;
//      op = opButtons[i].val;
//    } else if (opButtons[i].val == '÷') {
//      displayVal = str(opButtons[i].val);
//      left = !left;
//      op = opButtons[i].val;
//    } else if (opButtons[i].val == '×') {
//      displayVal = str(opButtons[i].val);
//      left = !left;
//      op = opButtons[i].val;
//    }
//  }
//}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  displayVal = str(result);
  left = !left;
  l = result;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent('3', true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent('0', true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent('-', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  } else if (keyCode == 10 || keyCode == 61) {
    handleEvent('=', false);
  } else if (keyCode == 106) {
    handleEvent('×', false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent('÷', false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent('.', false);
  } else if (keyCode == 83) {
    handleEvent('s', false);
  } else if (keyCode == 67) {
    handleEvent('c', false);
  } else if (keyCode == 84) {
    handleEvent('t', false);
  } else if (keyCode == 82) {
    handleEvent('R', false);
  } else if (keyCode == 8) {
    handleEvent('←', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum) {
    //Do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    //Do operator stuff
    char clicked = val;

    if (clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' || clicked == '×' || clicked == '÷') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'R') {
      //reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      newEntry = true;
      displayVal = "0.0";
    } else if (clicked == '²') {
      //square value in display
      if (left == true) {
        l = sq(l);
        displayVal = str(l);
      } else {
        r = sq(r);
        displayVal = str(r);
      }
    } else if (clicked == '√') {
      //square root of value in display
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == 's') {
      //sine of value in display
      if (left == true) {
        l = sin(l);
        displayVal = str(l);
      } else {
        r = sin(r);
        displayVal = str(r);
      }
    } else if (clicked == 'c') {
      //cosine of value in display
      if (left == true) {
        l = cos(l);
        displayVal = str(l);
      } else {
        r = cos(r);
        displayVal = str(r);
      }
    } else if (clicked == 't') {
      //tangent of value in display
      if (left == true) {
        l = tan(l);
        displayVal = str(l);
      } else {
        r = tan(r);
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      //goes to decimals
      if (left == true) {
        if (!displayVal.contains(".")) {
          displayVal += '.';
        }
      } else {
        if (!displayVal.contains(".")) {
          displayVal += '.';
        }
      }
    } else if (clicked == '%') {
      //tangent of value in display
      if (left == true) {
        l = l/100;
        displayVal = str(l);
      } else {
        r = r/100;
        displayVal = str(r);
      }
    } else if (clicked == '←') {
      //backspace
      if (displayVal.length() > 0) {
        displayVal = displayVal.substring(0, displayVal.length() - 1);
      }
    }
  }
}
