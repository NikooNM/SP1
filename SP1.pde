import java.util.ArrayList; //<>//

Country objCountry = new Country();
Group objGroup = new Group();

void setup() {
  size(910, 580);
  objCountry.loadImages(true);
}

void draw() {
  background(0, 51, 102);
  drawManyRectangles();
  objGroup.writeTextGroups();
  objCountry.writeCountryNames();
  objCountry.createFlags();
  drawWhiteVerticalLine();
  drawColoredRects();
}

//Tegner rektanglerne
void drawManyRectangles() {
  rectMode(CORNERS);
  fill(255);
  for (int i = 0; i < 4; i++) {

    int x1, x2, yStart;
    if (i < 2) {
      x1 = 10;
      x2 = 440;
    } else {
      x1 = 470;
      x2 = 900;
    }

    yStart = (i % 2 == 0) ? 40 : 330;
    drawSingleRect(yStart, x1, x2);
  }
}

//En metode, der tegner en enkelt gruppes rektangler
void drawSingleRect(int yValue, int xOne, int xTwo) {
  for (int i = 0; i < 4; i++) {
    rect(xOne, yValue, xTwo, yValue += 50);
    yValue += 10;
  }
}

//Tegner rektangler for enden af de hvide rektangler
void drawColoredRects() {
  rectMode(CORNER);
  int stX = 420;
  int secondStX = 880;
  int stY = 40;
  int y;

  for (int i = 0; i < 8; i++) {

    y = stY + (i * 60);

    if (i >= 4) {
      y = stY + (i * 60) + 50;
    }

    if (i < 4) {
      fill(0, 204, 255);
      noStroke();
      rect(stX, y, 20, 50);
      rect(secondStX, y, 20, 50);
    } else {
      fill(255, 255, 0);
      noStroke();
      rect(stX, y, 20, 50);
      rect(secondStX, y, 20, 50);
    }
  }
}

//En simpel metode, der tegner en hvid lodret streg i sketch'en.
void drawWhiteVerticalLine() {
  rectMode(CORNER);
  fill(255);
  rect(width/2 - 3, 0, 6, height);
}
