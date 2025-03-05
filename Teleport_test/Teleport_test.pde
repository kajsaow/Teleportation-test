Player player;

boolean wPressed, sPressed, aPressed, dPressed;
boolean mouseButtonPressed;
int runTime;

void setup() {
  size(600,600);
  background(150, 130, 150);

  rectMode(CENTER);

  player = new Player(50, 50, 5, 5, 50);
  
  runTime = millis();
}
void draw() {
  background(150, 130, 150);

  player.update();
 

}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    wPressed = true;
  }
  if (key == 's' || key == 'S') {
    sPressed = true;
  }
  if (key == 'a' || key == 'A') {
    aPressed = true;
  }
  if (key == 'd' || key == 'D') {
    dPressed = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    wPressed = false;
  }
  if (key == 's' || key == 'S') {
    sPressed = false;
  }
  if (key == 'a' || key == 'A') {
    aPressed = false;
  }
  if (key == 'd' || key == 'D') {
    dPressed = false;
  }
}

void mousePressed() {
  mouseButtonPressed = true;
}
void mouseReleased() {
  mouseButtonPressed = false;
}


  
