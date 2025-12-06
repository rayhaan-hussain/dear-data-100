void plotGraph(int leftMargin, int rightMargin, int bottomMargin, int topMargin) {
  for (TableRow row : table.rows()) {
    int game = row.getInt("game");
    int win = row.getInt("win");
    float accuracy = row.getFloat("accuracy");

    float x = map(game, 1, maxGames, leftMargin, width - rightMargin);
    float y = map(accuracy, 0, 100, height - bottomMargin, topMargin);
    int d = 6;

    if (win == 1) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    noStroke();
    circle(x, y, d);

    if (dist(mouseX, mouseY, x, y) < d / 2) {
      stroke(0);
      circle(x, y, d + 6);
      displayGameData(game, win, accuracy);
    }
  }

  stroke(0);

  if (isAverageAccuracyOn) {
    drawAverageAccuracyGraph(leftMargin, rightMargin, bottomMargin, topMargin);
  }
}

void displayGameData(int game, int win, float accuracy) {
  String result = (win == 1) ? "Win" : "Loss";

  fill(0);
  pushStyle();
  
  textAlign(LEFT, CENTER);
  text("Game: " + game, 50, 50);
  text("Result: " + result, 50, 75);
  text("Accuracy: " + accuracy + "%", 50, 100);
  
  popStyle();
}

void drawAverageAccuracyGraph(int leftMargin, int rightMargin, int bottomMargin, int topMargin) {
  float avg = getAverageAccuracy();
  float y = map(avg, 0, 100, height - bottomMargin, topMargin);

  line(leftMargin, y, width - rightMargin, y);

  fill(0);
  text(nf(avg, 0, 1), (width - rightMargin) + 40, y);
}

float getAverageAccuracy() {
  float totalAccuracy = 0;

  for (TableRow row : table.rows()) {
    float accuracy = row.getFloat("accuracy");
    totalAccuracy += accuracy;
  }

  float avg = totalAccuracy / table.getRowCount();
  return (float) round(avg * 10) / 10; // format to 1 decimal place
}
