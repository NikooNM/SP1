class Country {
  PImage[] countryFlags;
  String[][] flagNames = {{"RUSSIA", "SAUDIARABIA", "EGYPT", "URUGUAY"},
    {"PORTUGAL", "SPAIN", "MOROCCO", "IRAN"},
    {"FRANCE", "AUSTRALIA", "PERU", "DENMARK"},
    {"ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"}};
  char[] lettersAToD = {'A', 'B', 'C', 'D'};
  boolean loadImages;

  Country() {
    this.countryFlags = new PImage[16];
  }

  //Indlæser billeder af flagene i data-mappen
  PImage[] loadImages(boolean loadImages) {
    if (loadImages) {
      int counterForCF = 0;
      this.countryFlags = new PImage[16];
      for (int i = 0; i < (this.flagNames).length; i++) {
        for (int j = 0; j < 4; j++) {
          if ((this.flagNames[i][j]).equals("IRAN")) {
            this.countryFlags[counterForCF] = loadImage("persia.png");
          } else {
            this.countryFlags[counterForCF] = loadImage((this.flagNames[i][j]).toLowerCase() + ".png");
          }
          counterForCF++;
        }
      }
    }
    return this.countryFlags;
  }

  //En metode, der tegner flagene for venstre eller højre side af billedet
  void createFlags() {
    boolean isLeft;
    imageMode(CORNERS);
    for (int i = 0; i < 4; i += 2) {
      if (this.lettersAToD[i] == 'A') {
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

  //Metode, der skriver landenavnene i felterne:
  void writeCountryNames() {
    PFont countryFont = createFont("GillSansMT.ttf", 35);
    textFont(countryFont);
    textAlign(LEFT, CENTER);
    fill(0, 51, 102);
    int x, y;
    flagNames[0][1] = "SAUDI ARABIA";

    for (int i = 0; i < 4; i++) {
      y = (i % 2 == 0) ? 65 : 360;
      x = (i < 2) ? 120 : 580;
      for (int j = 0; j < 4; j++) {
        text(flagNames[i][j], x, y);
        if (j == 3) {
          y += 110;
        } else {
          y += 60;
        }
      }
    }
  }
}
