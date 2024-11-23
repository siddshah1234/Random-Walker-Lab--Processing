// Siddhant Shah
// Computer Science Programming II
// 11/22/2024
// Project Name: Random Walker Lab
// Extras: Canvas Boundaries, Multiple Walkers, Interactive Features

// initializing global variables
PGraphics pg;

// customizable walker variable to easily change amount of walkers
int walkeramount = 5;

// arrays to store x and y positions of the walkers 
int[] x = new int[walkeramount];
int[] y = new int[walkeramount];

// array to store the color of each walker
color[] colors = new color[walkeramount];
// variable to store speed of the walkers
int speed = 1;

void setup() {
  frameRate(3000); // setting the frame rate
  fullScreen(); // enabling full screen mode
  background(0); // setting the background color to black
  noStroke(); // disable strokes
  pg = createGraphics(displayWidth, displayHeight); // initialize graphics variable

  // initialize the positions and colors of the walkers
  for (int i = 0; i < walkeramount; i++) {
    // start the walkers in the center of the screen
    x[i] = width / 2;
    y[i] = height / 2;
    // assign a random color to each walker
    colors[i] = color(random(255), random(255), random(255), 50);
  }
}

void draw() {
  // updating multiple times per frame to make walkers move faster
  for (int j = 0; j<30; j++) {
    // update each walker
    for (int i = 0; i < walkeramount; i++) {
      update(i);
    }
  }
  
}

void update(int i) {
  // get random direction for the walker 
  int r = int(random(0, 5));
  
  // move the walker based on the random direction 
  if (r == 1) { 
    y[i] -= speed; // move up
  } 
  if (r == 2) {
    x[i] += speed; // move right
  } 
  if (r == 3) {
    y[i] += speed; // move down
  }
  if (r == 4) {
    x[i] -= speed; // move left
  }

  // check if the walker goes out of bounds
  if (x[i] < 0 || x[i] >= width || y[i] < 0 || y[i] >= height) {
    // setting the position of the walker to be at the center of the screen and setting it to a new color
    x[i] = width / 2;
    y[i] = height / 2;
    colors[i] = color(random(255), random(255), random(255), 50);
  }

  // set the fill color to the walker's color
  fill(colors[i]);
  // drawing the walker
  rect(x[i], y[i], 2, 2);
}

// resetting the positions and colors of walkers when the mouse button is pressed
void mousePressed() {
  // setting the background to black to clear the background
  background(0);
  // resetting all positions to center and assigning new colors
  for (int i = 0; i<walkeramount; i++) {
    x[i] = width/2;
    y[i] = height/2;
    colors[i] = color(random(255), random(255), random(255), 50);
  }
}
