import java.util.ArrayList; //<>//

//Erklærer og initialiserer variabler i global scope:
PFont groupFont;
PFont countryFont;

char[] lettersAToD = {'A', 'B', 'C', 'D'};

PImage[] countryFlags;
String[][] flagNames = {{"RUSSIA", "SAUDIARABIA", "EGYPT", "URUGUAY"},
  {"PORTUGAL", "SPAIN", "MOROCCO", "IRAN"},
  {"FRANCE", "AUSTRALIA", "PERU", "DENMARK"},
  {"ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"}};

void setup() {
  size(910, 580);
  loadImages();
}

void draw() {
  background(0, 51, 102);
  drawManyRectangles();
  writeTextGroups(lettersAToD);
  writeCountryNames(flagNames);
  createFlags();
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
  for (int i = 0; i < flagNames.length; i++) {
    rect(xOne, yValue, xTwo, yValue += 50);
    yValue += 10;
  }
}

//Skriver navnet på grupperne med fed tekst, fx "GROUP A"
void writeTextGroups(char[] letters) {
  groupFont = createFont("GillSansMTBold.ttf", 25);
  textFont(groupFont);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < 4; i++) {
    if (letters[i] == 'A' || letters[i] == 'C') {

      fill(0, 204, 255);
      if (letters[i] == 'A') {
        text("GROUP " + Character.toString(letters[i]), width/4, 20);
      } else {
        text("GROUP " + Character.toString(letters[i]), width-227, 20);
      }
    } else {
      fill(255, 255, 0);
      if (letters[i] == 'B') {
        text("GROUP " + Character.toString(letters[i]), width/4, 310);
      } else {
        text("GROUP " + Character.toString(letters[i]), width-227, 310);
      }
    }
  }
  fill(255);
}

//Metode, der skriver landenavnene i felterne:
void writeCountryNames(String[][] flagsDoubleArray) {
  countryFont = createFont("GillSansMT.ttf", 35);
  textFont(countryFont);
  textAlign(LEFT, CENTER);
  fill(0, 51, 102);
  int x, y;
  flagsDoubleArray[0][1] = "SAUDI ARABIA";

  for (int i = 0; i < 4; i++) {
    y = (i % 2 == 0) ? 65 : 360;
    x = (i < 2) ? 120 : 580;
    for (int j = 0; j < 4; j++) {
      text(flagsDoubleArray[i][j], x, y);
      if (j == 3) {
        y += 110;
      } else {
        y += 60;
      }
    }
  }
}

//Indlæser billeder af flagene i data-mappen
void loadImages() {
  int counterForCF = 0;
  countryFlags = new PImage[16];
  for (int i = 0; i < flagNames.length; i++) {
    for (int j = 0; j < 4; j++) {
      if (flagNames[i][j].equals("IRAN")) {
        countryFlags[counterForCF] = loadImage("persia.png");
      } else {
        countryFlags[counterForCF] = loadImage((flagNames[i][j]).toLowerCase() + ".png");
      }
      counterForCF++;
    }
  }
}

//En metode, der afgør om billederne skal indsættes på venstre eller højre side.
void createFlags() {
  boolean isLeft;
  imageMode(CORNERS);
  for (int i = 0; i < flagNames.length; i += 2) {
    if (lettersAToD[i] == 'A') {
      isLeft = true;
      insertAnyImgVertical(countryFlags, isLeft);
    } else {
      isLeft = false;
      insertAnyImgVertical(countryFlags, isLeft);
    }
  }
}

//Indsætter billederne på venstre eller højre side.
void insertAnyImgVertical(PImage[] groupFlags, boolean isLeft) {
  int counterY1 = 41;
  int counterY2 = 90;
  for (int i = 0; i < 8; i++) {

    if (isLeft == true) {
      image(groupFlags[i], 10, counterY1, 100, counterY2);

      if (i != 3) {
        counterY1 += 60;
        counterY2 += 60;
      } else {
        counterY1 += 110;
        counterY2 += 110;
      }
    } else {
      image(groupFlags[i+8], 470, counterY1, 560, counterY2);

      if ((i+8) != 11) {
        counterY1 += 60;
        counterY2 += 60;
      } else {
        counterY1 += 110;
        counterY2 += 110;
      }
    }
  }
}

/*
void drawColoredRects(int x, int y) {
 for (int i = 0; i < flagNames.length; i++) {
 rect(x, y, 20, 50);
 y += 10;
 }
 }
 
 void drawManyColoredRects() {
 rectMode(CORNER);
 
 for (int i = 0; i < 4; i++) {
 
 int x, y;
 if (i < 2) {
 x = 420;
 fill(0, 204, 255);
 noStroke();
 } else {
 x = 880;
 fill(255, 255, 0);
 noStroke();
 }
 y = (i % 2 == 0) ? 40 : 330;
 drawColoredRects(x, y);
 }
 }
 */

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
