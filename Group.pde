
class Group {
  Country countries;
  PFont groupFont;
  
  void writeTextGroups() {
    char[] letters = {'A', 'B', 'C', 'D'};
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
}
