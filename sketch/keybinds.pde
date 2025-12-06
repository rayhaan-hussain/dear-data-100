void handleKeybinds() {
  if (key == 't' || key == 'T') {
    isAverageAccuracyOn = !isAverageAccuracyOn;
  }

  if (key == 'g' || key == 'G') {
    mode = mode.equals("grid") ? "graph" : "grid";
  }
}

void drawGraphKeybinds() {
  fill(0);

  text("T - toggle average accuracy line", 800, 50);
}

void drawGridKeybinds() {
  fill(0);

  text("T - toggle average accuracy line", 800, 50);
}

void drawKeybinds() {
  fill(0);
  
  String otherMode = mode.equals("grid") ? "graph" : "grid";
  
  text("T - toggle average accuracy line", 800, 50);
  text("G - switch to " + otherMode + " mode", 800, 100);
}
