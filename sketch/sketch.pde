Table table;
int leftMargin, rightMargin, bottomMargin, topMargin;
int maxGames;
int rows, cols, cellSize;
color winColor, lossColor;
boolean isAverageAccuracyOn;
String mode;

void setup() {
  size(900, 800);
  table = loadTable("chess_data.csv", "header");
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  // Set margins
  leftMargin = 100;
  rightMargin = 100;
  bottomMargin = 50;
  topMargin = 150;

  // Grid variables
  rows = 10;
  cols = 10;
  cellSize = 50;

  winColor = color(0, 255, 0);
  lossColor = color(255, 0, 0);

  maxGames = table.getRowCount();
  isAverageAccuracyOn = false;

  mode = "grid";

  println(getAverageAccuracy());
}

void draw() {
  background(240);

  if (mode.equals("graph")) {
    drawAxis(leftMargin, rightMargin, bottomMargin, topMargin);
    plotGraph(leftMargin, rightMargin, bottomMargin, topMargin);
  } else if (mode.equals("grid")) {
    drawGrid(rows, cols, cellSize);
  }
  
  drawKeybinds();
}

void keyPressed() {
  handleKeybinds();
}
