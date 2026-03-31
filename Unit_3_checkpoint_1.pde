color pink = #ffd6ff;
color purple1 = #e7c6ff;
color purple2 = #c8b6ff;
color purple3 = #b8c0ff;
color blue1 = #bbd0ff;
color blue2 = #fff0f3;

color selectedcolor;

void setup(){
  size(600,600);
  stroke(pink);
  strokeWeight(10);
  selectedcolor = blue1;
}

void draw(){
  background(255);
  
  //button
  if (dist(100,100,mouseX,mouseY)<50){
    stroke(#f72585);
  } else {
    stroke(pink);
  }
  p1();
  
  if (dist(300,100,mouseX,mouseY)<50){
    stroke(#f72585);
  } else {
    stroke(pink);
  }
  p2();
  
   if (dist(500,100,mouseX,mouseY)<50){
    stroke(#f72585);
  } else {
    stroke(pink);
  }
  p3();
  
  stroke(pink);
  //color
  fill(selectedcolor);
  square(150,230,300);
}

void mouseReleased(){
  if (dist(100,100,mouseX,mouseY)<50){
    selectedcolor = purple1;
  }
  if (dist(300,100,mouseX,mouseY)<50){
    selectedcolor = purple2;
  }
  if (dist(500,100,mouseX,mouseY)<50){
    selectedcolor = purple3;
  }
}

void p1(){
  fill(purple1);
  circle(100,100,100);
}

void p2(){
  fill(purple2);
  circle(300,100,100);
}

void p3(){
  fill(purple3);
  circle(500,100,100);
}
