class Player {
  float xpos, ypos;
  float xSpeed, ySpeed;
  float playerSize;
  
  float teleportDestinationX, teleportDestinationY;

  int teleportStartTime;
  int teleportCircleSize;
  int teleportDelay;

  boolean teleporting;



  Player (float _xpos, float _ypos, float _xSpeed, float _ySpeed, float _playerSize) {
    xpos = _xpos;
    ypos = _ypos;

    xSpeed = _xSpeed;
    ySpeed = _ySpeed;

    playerSize = _playerSize;

    teleportCircleSize = 100;

    teleporting = false;
    teleportDelay = 1000;

    teleportDestinationX = 0;
    teleportDestinationY = 0;
    
  }



  void wallCollision() {
    if (xpos > width - playerSize/2) { // Wall collision to the Right
      xpos = width - playerSize/2 - 1 ;
    } else if (xpos < 0 + playerSize/2) { // Wall collision to the Left
      xpos = 0 + playerSize/2;
    }
    if (ypos > height - playerSize/2) { // Wall collision at the Bottom
      ypos = height - playerSize/2 - 1;
    } else if (ypos < 0 + playerSize/2) { // Wall collision at the top
      ypos = 0 + playerSize/2;
    }
  }

  void move() {

    float moveFactor = 1;

    if ((wPressed || sPressed) && (aPressed || dPressed)) { // If moving diagnoly
      moveFactor = 1 / sqrt(2);
    }



    if (wPressed) ypos -= ySpeed * moveFactor; // Moving Up
    if (sPressed) ypos += ySpeed * moveFactor; // Moving Down
    if (aPressed) xpos -= xSpeed * moveFactor; // Moving Left
    if (dPressed) xpos += xSpeed * moveFactor; // Moving Right

    wallCollision();
  }

  void update() {
    move();
    display();
    teleport();
  }

  void display() {
    pushMatrix();

    translate(xpos, ypos);
    fill (50, 200, 155); // Player Color
    rect(0, 0, playerSize, playerSize);

    popMatrix();
  }

  void teleport() {
    if (mouseButtonPressed) {
      teleportStartTime = millis();

      teleporting = true;

      teleportDestinationX = mouseX;
      teleportDestinationY = mouseY;
    }
    if (teleporting) {

      fill(#F0F27A);
      ellipse(teleportDestinationX, teleportDestinationY, teleportCircleSize, teleportCircleSize);
      teleportCircleSize -= (teleportDelay/1000);
    }
    if (millis() - teleportStartTime > teleportDelay & teleporting == true) {
      
      xpos = teleportDestinationX;
      ypos = teleportDestinationY;
      
      teleporting = false;
      teleportCircleSize = 100;
    }




    println("Teleport Start Time:", teleportStartTime,"ms");
    println("Teleport delay:", millis() - teleportStartTime,"ms");
    println("Mouse button pressed", mouseButtonPressed);
    println();
  }
}
