float sliderX = 100;
float sliderY = 300;
float sliderWidth = 300;
float sliderHeight = 10;

float knobX;
float knobSize = 20;
boolean dragging = false;

// Circle size
float circleSize = 50;

void setup() {
  size(500, 400);
  knobX = sliderX; // start at minimum
}

void draw() {
  background(240);

  // Draw slider track
  fill(180);
  rect(sliderX, sliderY, sliderWidth, sliderHeight);

  // Draw knob
  fill(100);
  ellipse(knobX, sliderY + sliderHeight / 2, knobSize, knobSize);

  // Map knob position to circle size
  circleSize = map(knobX, sliderX, sliderX + sliderWidth, 10, 200);

  // Draw circle
  fill(50, 150, 255);
  ellipse(width / 2, height / 2, circleSize, circleSize);
}

void mousePressed() {
  // Check if mouse is on knob
  if (dist(mouseX, mouseY, knobX, sliderY + sliderHeight / 2) < knobSize / 2) {
    dragging = true;
  }
}

void mouseDragged() {
  if (dragging) {
    knobX = constrain(mouseX, sliderX, sliderX + sliderWidth);
  }
}

void mouseReleased() {
  dragging = false;
}
