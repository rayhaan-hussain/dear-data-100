void drawAxis(int leftMargin, int rightMargin, int bottomMargin, int topMargin) {
  fill(0);
  stroke(0);
  line(leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin); // x-axis
  line(leftMargin, height - bottomMargin, leftMargin, topMargin); // y-axis

  // Label x-axis
  float textX = (leftMargin + (width - rightMargin)) / 2;
  float textY = (height - bottomMargin) + 40;
  textAlign(CENTER, CENTER);
  text("Game", textX, textY);

  for (int i = 0; i <= maxGames; i += 10) {
    float x = map(i, 0, maxGames, leftMargin, width - rightMargin);
    float y = (height - bottomMargin) + 15;

    // Short line to mark number on axis
    if (i != 0) {
      line(x, height - bottomMargin, x, (height - bottomMargin) + 8);
    }
    
    pushStyle();
    
    textAlign(CENTER, TOP);
    text(i, x, y);
    
    popStyle();
  }

  // Label y-axis
  float yCenter = ((height - bottomMargin) + topMargin) / 2;

  pushMatrix(); // Save current coordinate system so it can be restored later
  translate(leftMargin - 50, yCenter); // Set origin to new coordinate
  rotate(-HALF_PI); // Rotate coordinate system 90deg anti-clockwise
  text("Accuracy (%)", 0, 0);
  popMatrix(); // Restore normal coordinate system

  for (int i = 0; i <= 100; i += 10) {
    float x = leftMargin - 15;
    float y = map(i, 0, 100, height - bottomMargin, topMargin);

    if (i != 0) {
      line(leftMargin, y, leftMargin - 5, y);
    }
    
    pushStyle();
    
    textAlign(RIGHT, CENTER);
    text(i, x, y);
    
    popStyle();
  }
}
