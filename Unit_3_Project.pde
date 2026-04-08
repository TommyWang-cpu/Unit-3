//Tommy Wang
//April 1st
//Unit 3 Projoect

color currentColor = color(0);
float drawStrokeSize = 5;
float uiStrokeSize = 3;

boolean drawing = false;

// Slider
float sliderX = 150;
float sliderY = 60;
float sliderW = 200;
float knobX;
boolean draggingSlider = false;

// Stamp tool
int currentStamp = 0; // 0 = off, 1 = circle, 2 = rectangle

// Canvas area
int canvasY = 100;


void setup() {
  size(600, 500);
  background(255);
  knobX = sliderX;
}

void draw() {
  // UI background
  fill(220);
  noStroke();
  rect(0, 0, width, canvasY);

  // Draw UI elements
  drawColorButtons();
  drawStampButtons();
  drawSlider();
  drawStrokeSize();
  drawIndicator();
  drawNewButton();
  drawSaveButton();
  drawLoadButton();
}

// ---------- MOUSE EVENTS ----------
void mousePressed() {
  handleColorClick();
  handleStampClick();
  handleNewClick();
  handleSaveClick();
  handleLoadClick();

  // Slider grab
  if (dist(mouseX, mouseY, knobX, sliderY) < 10) {
    draggingSlider = true;
  }

  // Stamp placement
  if (mouseY > canvasY && currentStamp != 0) {
    drawStamp(mouseX, mouseY);
  }
}

void mouseDragged() {
  // Move slider
  if (draggingSlider) {
    knobX = constrain(mouseX, sliderX, sliderX + sliderW);
    drawStrokeSize = map(knobX, sliderX, sliderX + sliderW, 1, 30);
  }

  // Draw continuously with stamp
  if (mouseY > canvasY && currentStamp != 0) {
    drawStamp(mouseX, mouseY);
  }
}

void mouseReleased() {
  draggingSlider = false;
}

// ---------- DRAW FUNCTIONS ----------

// Color buttons
void drawColorButtons() {
  color[] colors = {
    color(0), color(255, 0, 0), color(0, 255, 0),
    color(0, 0, 255), color(255, 255, 0), color(255, 0, 255)
  };

  for (int i = 0; i < colors.length; i++) {
    drawButton(10 + i * 40, 20, 30, 30, colors[i], lerpColor(colors[i], color(200), 0.4));
  }
}

// Stamp buttons
void drawStampButtons() {
  // Circle button
  boolean active1 = currentStamp == 1;
  drawButton(300, 20, 40, 30, color(200), active1 ? color(100) : color(200));
  fill(0);
  ellipse(320, 35, 15, 15);

  // Square button
  boolean active2 = currentStamp == 2;
  drawButton(350, 20, 40, 30, color(200), active2 ? color(100) : color(200));
  fill(0);
  rect(360, 28, 20, 15);
}

// Slider
void drawSlider() {
  stroke(0);
  line(sliderX, sliderY, sliderX + sliderW, sliderY);

  // Tactile effect
  if (dist(mouseX, mouseY, knobX, sliderY) < 10) {
    fill(100);
  } else {
    fill(150);
  }

  ellipse(knobX, sliderY, 20, 20);
}

// Indicator preview
void drawIndicator() {
  fill(currentColor);
  stroke(currentColor);
  strokeWeight(uiStrokeSize);
  ellipse(550, 50, uiStrokeSize * 2, uiStrokeSize * 2);
}

// New button
void drawNewButton() {
  drawButton(450, 20, 60, 30, color(180), color(140));
  fill(0);
  textAlign(CENTER, CENTER);
  text("NEW", 480, 35);
}

// Generic tactile button
void drawButton(float x, float y, float w, float h, color base, color active) {
  boolean hover = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;

  if (hover) {
    fill(active);
  } else {
    fill(base);
  }

  stroke(0);
  rect(x, y, w, h);
}

// ---------- CLICK HANDLERS ----------

// Color click
void handleColorClick() {
  color[] colors = {
    color(0), color(255, 0, 0), color(0, 255, 0),
    color(0, 0, 255), color(255, 255, 0), color(255, 0, 255)
  };

  for (int i = 0; i < colors.length; i++) {
    float x = 10 + i * 40;
    if (mouseX > x && mouseX < x + 30 && mouseY > 20 && mouseY < 50) {
      currentColor = colors[i];
      currentStamp = 0; // turn off stamp
    }
  }
}

// Stamp click
void handleStampClick() {
  // Circle
  if (mouseX > 300 && mouseX < 340 && mouseY > 20 && mouseY < 50) {
    currentStamp = (currentStamp == 1) ? 0 : 1;
  }

  // Rectangle
  if (mouseX > 350 && mouseX < 390 && mouseY > 20 && mouseY < 50) {
    currentStamp = (currentStamp == 2) ? 0 : 2;
  }
}

// New button click
void handleNewClick() {
  if (mouseX > 450 && mouseX < 510 && mouseY > 20 && mouseY < 50) {
    background(255);
  }
}

// ---------- STAMP DRAW ----------
void drawStamp(float x, float y) {
  fill(currentColor);
  noStroke();

  if (currentStamp == 1) {
    ellipse(mouseX, mouseY, drawStrokeSize * 2, drawStrokeSize * 2);
  } else if (currentStamp == 2) {
    rect(mouseX, mouseY, drawStrokeSize * 2, drawStrokeSize * 2);
  }
}
// ---------- STROKE DRAW ----------
void drawStrokeSize(){
  if (mousePressed && mouseY > canvasY && currentStamp == 0) {
    stroke(currentColor);
    strokeWeight(drawStrokeSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
// --------------Save & Load --------------
void drawSaveButton(){
  drawButton(450, 60, 60, 30, color(180), color(140));
  fill(0);
  textAlign(CENTER, CENTER);
  text("Save", 480, 75);
}
void saveImage(File f){
  if (f != null){
   PImage canvas = get( 0, 100, width-71, height-1);
   canvas.save(f.getAbsolutePath());
  }
}

void handleSaveClick() {
  if (mouseX > 450 && mouseX < 510 && mouseY > 60 && mouseY < 90) {
    selectOutput("include file extention name as .jpg, .jpeg, .PNG etc file", "saveImage");
  }
}

void handleLoadClick() {
  if (mouseX > 380 && mouseX < 440 && mouseY > 60 && mouseY < 90) {
    selectInput("Pick an image to load", "openImage");
  }
}

void openImage(File f){
 if (f != null){
  int n = 0;
  while (n < 10){
   PImage pic = loadImage(f.getPath());
   image(pic,0,100,600,400);
   n = n+1;
  }
 }
}

void drawLoadButton(){
  drawButton(380, 60, 60, 30, color(180), color(140));
  fill(0);
  textAlign(CENTER, CENTER);
  text("Load", 410, 75);
}
