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
  
  tactile(100,100,50);
  button(50,60,100,purple1);
  tactile(300,100,50);
  button(250,60,100,purple2);
  tactile(500,100,50);
  button(450,60,100,purple3);
  
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

void tactile(int x,int y,int r){
  if (dist(x,y,mouseX,mouseY)<r){
    stroke(#f72585);
  } else {
    stroke(pink);
  }
}
void button(int x,int y,int r,color f){
  fill(f);
  square(x,y,r);
}
