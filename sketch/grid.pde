void drawGrid(int rows, int cols, int cellSize) {
  float gridWidth = cols * cellSize;
  float gridHeight = rows * cellSize;
  float half = cellSize / 2;

  float startX = (width - gridWidth) / 2;
  float startY = (height - gridHeight) / 2;

  int n = 0;

  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      float x = startX + (col * cellSize);
      float y = startY + (row * cellSize);

      int game = table.getInt(n, "game");
      int win = table.getInt(n, "win");
      float accuracy = table.getFloat(n, "accuracy");

      color c = (win == 1) ? winColor : lossColor;

      boolean isMouseInRect = mouseX > x - half && mouseX < x + half && mouseY > y - half && mouseY < y + half;

      if (isMouseInRect) {
        c = lerpColor(c, color(0), 0.4);
        displayGameData(game, win, accuracy);
      }

      fill(c);
      rect(x, y, cellSize, cellSize);

      float lineY = map(accuracy, 0, 100, y + half, y - half);

      line(x - half, lineY, x + half, lineY);

      if (isAverageAccuracyOn) {
        drawAverageAccuracyGrid(x, y, half);
      }

      n++;
    }
  }
}

void drawAverageAccuracyGrid(float rectX, float rectY, float half) {
  float y = map(getAverageAccuracy(), 0, 100, rectY + half, rectY - half);

  pushStyle();
  stroke(255);
  line(rectX - half, y, rectX + half, y);
  popStyle();
}
